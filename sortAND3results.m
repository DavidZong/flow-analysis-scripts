function sortAND3results(resultPoint, name)
flowCalResult = strcat('C:\Users\David Zong\Dropbox\Rice\Bennett Lab\Data\Hybrid Promoter\Flow Cytometer\Flowcal\', resultPoint, '\result.csv');
d = csvread(flowCalResult);
inducerConc = [0, 1e-3, 1e-2, 1e-1, 1e0, 1e1];
inducer1 = reshape([inducerConc;inducerConc;inducerConc;inducerConc;inducerConc;inducerConc;], 36, 1);
inducer2 = reshape([inducerConc;inducerConc;inducerConc;inducerConc;inducerConc;inducerConc;]', 36, 1);
mean = d(1:36, 2);
rcv = d(1:36, 11);
inducerRange = [inducer1, inducer2];
pack = [inducerRange, mean, rcv];
xlswrite('and3Results.xlsx',pack,name)
end