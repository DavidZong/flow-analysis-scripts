% Takes in the results from a flowcal run and the time vector, then sorts
% the data into induction levels and saves it to excel.
% jobname: (string) the name of the job, uses this to name the sheet
% excelPoint: (string) the excel filename, must be located in the flow
% cytomter folder for now while I figure out how to make relative paths
% flowCalResult: (string) name of the folder that the flowcal script
% produced. Automatically fetches result.csv from that folder
function sort_results(jobname, excelPoint, resultPoint)
    excelFile = strcat('C:\Users\David Zong\Dropbox\Rice\Bennett Lab\Data\Hybrid Promoter\Flow Cytometer\', excelPoint);
    flowCalResult = strcat('C:\Users\David Zong\Dropbox\Rice\Bennett Lab\Data\Hybrid Promoter\Flow Cytometer\Flowcal\', resultPoint, '\result.csv');
    d = csvread(flowCalResult);
    t = xlsread(excelFile, 'Raw', 'AG3:AG50');
    t = t*1440;
    t = t - t(1);
    d = [d, t];

    x = [0, 10e-4, 10e-3, 10e-2, 10e-1, 10e0];

    for i = 1:6
        header = {strcat(num2str(x(i)),' mM'),'Mean','Median','Mode','Geo Mean','Stdev','Gstdev','CV','GCV','IQR','RCV','Time'};
        headerPos = 1 + (10*(i-1));
        tablePos = 2 + (10*(i-1));
        group = d(i:6:length(d), :);
        xlswrite(excelFile, header, jobname, strcat('A', num2str(headerPos)))
        xlswrite(excelFile, group, jobname, strcat('A', num2str(tablePos)))
    end
end