from matplotlib import pyplot as plt
import numpy as np
import FlowCal
import os.path
import re
def sort_nicely( l ):
    """ Sort the given list in the way that humans expect.
    """
    convert = lambda text: int(text) if text.isdigit() else text
    alphanum_key = lambda key: [ convert(c) for c in re.split('([0-9]+)', key) ]
    l.sort( key=alphanum_key )
    return l

# takes in location of folder and location of bead file
# plots the result and puts in in a folder
def processFolder(beadFile, dataFolder, gateSize, jobname):
    # Make Output folders
    dump = jobname+'output';
    if not os.path.exists(dump):
        os.makedirs(dump)
    if not os.path.exists(dump+'/figures'):
        os.makedirs(dump+'/figures')
    if not os.path.exists(dump+'/beads'):
        os.makedirs(dump+'/beads')

    # Define channels
    sc_channels = ['FSC-HLin', 'SSC-HLin']
    fl_channels = ['YEL-HLin']

    # Load in Beads file
    b = FlowCal.io.FCSData(beadFile)
    b = FlowCal.transform.to_rfi(b)

    # Gate beads
    b_g, __, c = FlowCal.gate.density2d(b,
        channels=sc_channels,
        gate_fraction=0.3,
        full_output=True)

    # Make MEF standard Curve
    # Molecules of Equivalent PE from Sphero
    mepe=[0,531,1504,4819,12506,36159,109588,250892];
    to_mef = FlowCal.mef.get_transform_fxn(b_g,
                                        mef_values=mepe,
                                        mef_channels='YEL-HLin',
                                        plot=True,
                                        plot_dir=dump+'/beads')

    statmat = np.arange(11)
    index = 1;
    filelist = sort_nicely(os.listdir(dataFolder));
    for filename in filelist:
        print 'current file: ' + filename
        # Load file
        d = FlowCal.io.FCSData(dataFolder+filename)
        # d = FlowCal.transform.to_rfi(d) # uncomment for rfi transform

        # transform to mef
        d = to_mef(d, channels=fl_channels)

        # Perform density gating
        # d_g0 = FlowCal.gate.start_end(d, 100, 100) # uncomment for start end gating
        # d_g1 = FlowCal.gate.high_low(d, channels=sc_channels) # d_g0 for start end
        dg, __, dc = FlowCal.gate.density2d(
            d, # d_g1 for high low gating
            channels=sc_channels,
            gate_fraction=gateSize,
            xscale='logicle',
            yscale='logicle',
            full_output=True)

        # Plot density diagram of YEL/SSC and histograms for fluorescence channels
        FlowCal.plot.density_and_hist(
            d,
            gated_data=dg,
            gate_contour=dc,
            density_channels=sc_channels,
            density_params={'mode': 'scatter', 'xscale': 'logicle', 'yscale': 'logicle'},
            hist_channels=fl_channels,
            hist_params={'xscale': 'logicle'},
            savefig = dump+'/figures/'+str(index)+".png")

        mean = FlowCal.stats.mean(dg, fl_channels)
        median = FlowCal.stats.median(dg, fl_channels)
        mode = FlowCal.stats.mode(dg, fl_channels)
        gmean = FlowCal.stats.gmean(dg, fl_channels)

        std = FlowCal.stats.std(dg, fl_channels)
        gstd = FlowCal.stats.gstd(dg, fl_channels)
        cv = FlowCal.stats.cv(dg, fl_channels)
        gcv = FlowCal.stats.gcv(dg, fl_channels)

        iqr = FlowCal.stats.iqr(dg, fl_channels)
        rcv = FlowCal.stats.rcv(dg, fl_channels)

        statrow = np.array([index, mean, median, mode, gmean, std, gstd, cv, gcv, iqr, rcv])

        if index == 1:
            statmat = statrow;
        else:
            statmat = np.vstack((statmat, statrow))
        index = index + 1;

    np.savetxt(dump+"/result.csv", statmat, delimiter=',')