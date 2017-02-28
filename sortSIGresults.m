function sortSIGresults(resultPoint, position, name)
flowCalResult = strcat('C:\Users\David Zong\Dropbox\Rice\Bennett Lab\Data\Hybrid Promoter\Flow Cytometer\Flowcal\', resultPoint, '\result.csv');
d = csvread(flowCalResult);
inducerConc = [0, 1e-3, 1e-2, 1e-1, 1e0, 1e1];
inducer2Conc = 10.^([-8 -7 -5 -4 -2 -1]./3);
inducer3Conc = [0 0 0 10 10 10];
inducerRange = [inducerConc, inducer2Conc, inducer3Conc];
if position == 1
    mean = [d(1:6:36, 2); d(2:6:36, 2); d(3:6:36, 2)];
    rcv = [d(1:6:36, 11); d(2:6:36, 11); d(3:6:36, 11)];
else
    mean = [d(4:6:36, 2); d(5:6:36, 2); d(6:6:36, 2)];
    rcv = [d(4:6:36, 11); d(5:6:36, 11); d(6:6:36, 11)];
end
pack = [inducerRange', mean, rcv];
xlswrite('sigResults.xlsx',pack,name)
end