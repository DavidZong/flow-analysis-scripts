from matplotlib import pyplot as plt
import FlowCal

# Load file
for x in xrange(1,49):
    index = x*2 - 1;
    d = FlowCal.io.FCSData('../160629_YFPmaxconst_ssrA_fix_test_export/160629_YFPmaxconst_ssrA_fix_test_export-'+str(index)+'.fcs')

    # Define channels
    sc_channels = ['FSC-HLin', 'SSC-HLin']
    # fl_channels = ['GRN-HLin', 'YEL-HLin', 'RED-HLin', 'RED2-HLin']
    fl_channels = ['YEL-HLin']

    # Perform density gating
    dg, __, dc = FlowCal.gate.density2d(
        d,
        channels=sc_channels,
        gate_fraction=0.50,
        xscale='logicle',
        yscale='logicle',
        full_output=True)

    # Plot density diagram of FSC/SSC and histograms for fluorescence channels
    FlowCal.plot.density_and_hist(
        d,
        gated_data=dg,
        gate_contour=dc,
        density_channels=sc_channels,
        density_params={'mode': 'scatter', 'xscale': 'logicle', 'yscale': 'logicle'},
        hist_channels=fl_channels,
        hist_params={'xscale': 'logicle'},
        savefig='output/'+str(index)+'.png')

print "done"