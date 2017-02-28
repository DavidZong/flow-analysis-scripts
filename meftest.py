import FlowCal
import matplotlib.pyplot as plt

# Load in Beads file
b = FlowCal.io.FCSData('../160629_YFPmaxconst_ssrA_fix_test_export/160629_YFPmaxconst_ssrA_fix_test_export-95.fcs')
b = FlowCal.transform.to_rfi(b)

# Gate beads
b_g, __, c = FlowCal.gate.density2d(b,
	channels=['FSC-HLin', 'SSC-HLin'],
	gate_fraction=0.3,
	full_output=True)

# Plot the Gating
FlowCal.plot.density_and_hist(b,
							gated_data=b_g,
							gate_contour=c,
							density_channels=['FSC-HLin','SSC-HLin'],
							density_params={'mode': 'scatter', 'xscale': 'logicle', 'yscale': 'logicle'},
							hist_channels=['YEL-HLin'],
							hist_params={'xscale': 'logicle'},
							savefig='output/bead.png')

# Make MEF standard Curve
# Molecules of Equivalent PE from Sphero
mepe=[0,531,1504,4819,12506,36159,109588,250892];
to_mef = FlowCal.mef.get_transform_fxn(b_g,
									mef_values=mepe,
									mef_channels='YEL-HLin',
									plot=False)

# Load and Process All Samples
for x in xrange(1,49):
	index = x*2 - 1;
	# Load file
	s = FlowCal.io.FCSData('../160629_YFPmaxconst_ssrA_fix_test_export/160629_YFPmaxconst_ssrA_fix_test_export-'+str(index)+'.fcs')

	# Transform all channels to a.u., and YEL-HLin to MEF
	s = FlowCal.transform.to_rfi(s)
	s = to_mef(s, channels='YEL-HLin')

	# Gate: start end, high low, and density by FSC and SSC
	s_g0 = FlowCal.gate.start_end(s, 100, 100)
	s_g1 = FlowCal.gate.high_low(s_g0, channels=['FSC-HLin','SSC-HLin'])
	dg, __, dc = FlowCal.gate.density2d(s_g1,
										channels=['FSC-HLin','SSC-HLin'],
										gate_fraction=0.50,
										xscale='logicle',
										yscale='logicle',
										full_output=True)

	# Plot density gate and histogram of transformed channel
	FlowCal.plot.density_and_hist(s,
								gated_data=dg,
								gate_contour=dc,
								density_channels=['FSC-HLin','SSC-HLin'],
								density_params={'mode': 'scatter', 'xscale': 'logicle', 'yscale': 'logicle'},
								hist_channels=['YEL-HLin'],
								hist_params={'xscale': 'logicle'},
								savefig='output/all/'+str(index)+'.png')

print 'done'