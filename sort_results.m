clc
clear all
close all

% Takes in the results from a flowcal run and the time vector, then sorts
% the data into induction levels and saves it to excel

jobname = '90 Percent Gate';
excelPoint = '160818_IPTG_repeat.xlsx';
resultPoint = '160818_90percentoutput\result.csv';


excelFile = strcat('C:\Users\David Zong\Dropbox\Rice\Bennett Lab\Data\Hybrid Promoter\Flow Cytometer\', excelPoint);
flowCalResult = strcat('C:\Users\David Zong\Dropbox\Rice\Bennett Lab\Data\Hybrid Promoter\Flow Cytometer\Flowcal\', resultPoint);
d = csvread(flowCalResult);
t = xlsread(excelFile, 'Raw', 'AG3:AG98');
t = t(1:2:length(t))*1440;
t = t - t(1);
d = [d, t];

x = [0, 10e-4, 10e-3, 10e-2, 10e-1, 10e0];

group1 = d(1:6:length(d), :);
group2 = d(2:6:length(d), :);
group3 = d(3:6:length(d), :);
group4 = d(4:6:length(d), :);
group5 = d(5:6:length(d), :);
group6 = d(6:6:length(d), :);

for i = 1:6
    header = {strcat(num2str(x(i)),' mM'),'Mean','Median','Mode','Geo Mean','Stdev','Gstdev','CV','GCV','IQR','RCV','Time'};
    headerPos = 1 + (10*(i-1));
    tablePos = 2 + (10*(i-1));
    group = d(i:6:length(d), :);
    xlswrite(excelFile, header, jobname, strcat('A', num2str(headerPos)))
    xlswrite(excelFile, group, jobname, strcat('A', num2str(tablePos)))
end