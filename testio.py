from matplotlib import pyplot as plt
import FlowCal

# Load file
index = 1;
d = FlowCal.io.FCSData('../160629_YFPmaxconst_ssrA_fix_test_export/160629_YFPmaxconst_ssrA_fix_test_export-'+str(index)+'.fcs')
print 'done'