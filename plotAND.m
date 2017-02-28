clc
clear all
close all

ind1 = 'IPTG';
ind2 = 'Tre';
d1 = xlsread('andResults.xlsx', [ind1, ind2, '_R1']);
d2 = xlsread('andResults.xlsx', [ind1, ind2, '_R2']);
d3 = xlsread('andResults.xlsx', [ind1, ind2, '_R3']);

meanMean = mean([d1(:, 3), d2(:, 3), d3(:, 3)], 2);
stdevMean = std([d1(:, 3), d2(:, 3), d3(:, 3)], 0, 2);

meanRCV = mean([d1(:, 4), d2(:, 4), d3(:, 4)], 2);
stdevRCV = std([d1(:, 4), d2(:, 4), d3(:, 4)], 0, 2);

figure(1)
plot3_errorbars_surf(d1(:, 1), d1(:, 2), meanMean, stdevMean)
xlabel([ind1, ' Concentration (mM)'])
ylabel([ind2, ' Concentration (mM)'])
zlabel('Normalized Yellow Flouresence (MEPE)')

figure(2)
plot3_errorbars_surf(d1(:, 1), d1(:, 2), meanRCV, stdevRCV)
xlabel([ind1, ' Concentration (mM)'])
ylabel([ind2, ' Concentration (mM)'])
zlabel('RCV')