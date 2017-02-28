from matplotlib import pyplot as plt
import numpy as np
import FlowCal

# Load file
index = 1;
d = FlowCal.io.FCSData('../160629_YFPmaxconst_ssrA_fix_test_export/160629_YFPmaxconst_ssrA_fix_test_export-'+str(index)+'.fcs')
d = FlowCal.transform.to_rfi(d)

time = d.acquisition_start_time;

print time