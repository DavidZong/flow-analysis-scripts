from matplotlib import pyplot as plt
import matplotlib
import numpy as np
import FlowCal
import os.path

beadFile = '../AND3/170125_beads/170125_beads-1.fcs'
dataFolder = '../AND3/170125_ara_rib_tre10_AND_r1/'
filename = '170125_ara_rib_tre10_AND_r1-1.fcs'

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
                                    plot=False)

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
    gate_fraction=0.50,
    xscale='logicle',
    yscale='logicle',
    full_output=True)

# Make the font in the plot editable
matplotlib.rcParams['svg.fonttype'] = 'none'
# Plot density diagram of YEL/SSC and histograms for fluorescence channels
FlowCal.plot.hist1d(
    dg,
    channel=fl_channels,
    xscale='logicle',
    savefig = "hist.svg")
