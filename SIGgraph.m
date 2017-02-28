clc
close all

gate = 'Tre';
cross = {'Ara', 'IPTG', 'Rib', 'Tre'};
cross(ismember(cross, gate)) = [];
d1 = xlsread('sigResults.xlsx', [gate, 'R1']);
d2 = xlsread('sigResults.xlsx', [gate, 'R2']);
d3 = xlsread('sigResults.xlsx', [gate, 'R3']);

meanMean = mean([d1(:, 2), d2(:, 2), d3(:, 2)], 2);
stdevMean = std([d1(:, 2), d2(:, 2), d3(:, 2)], 0, 2);

meanRCV = mean([d1(:, 3), d2(:, 3), d3(:, 3)], 2);
stdevRCV = std([d1(:, 3), d2(:, 3), d3(:, 3)], 0, 2);

hold on
figure(1)
p = errorbar(d1(1:12, 1), meanMean(1:12), stdevMean(1:12));
p2 = plot(d1([13,16], 1), meanMean([13,16]));
p3 = plot(d1([14,17], 1), meanMean([14,17]));
p4 = plot(d1([15,18], 1), meanMean([15,18]));
a = gca();
set([p, p2, p3, p4], 'LineStyle', 'None')
set([p, p2, p3, p4], 'Marker', '.', 'MarkerSize', 12)
set(p2, 'Color', 'r')
set(p3, 'Color', 'g')
set(p4, 'Color', 'm')
set(a, 'XScale', 'log')
xlabel([gate, ' Concentration (mM)'])
ylabel('Normalized Yellow Flouresence (MEPE)')
legend(gate, cross{1}, cross{2}, cross{3},'Location','northwest')
hold off

%RCV
figure(2)
hold on
r = errorbar(d1(1:12, 1), meanRCV(1:12), stdevRCV(1:12));
r2 = plot(d1([13,16], 1), meanRCV([13,16]));
r3 = plot(d1([14,17], 1), meanRCV([14,17]));
r4 = plot(d1([15,18], 1), meanRCV([15,18]));
ra = gca();
set([r, r2, r3, r4], 'LineStyle', 'None')
set([r, r2, r3, r4], 'Marker', '.', 'MarkerSize', 12)
set(r2, 'Color', 'r')
set(r3, 'Color', 'g')
set(r4, 'Color', 'm')
set(ra, 'XScale', 'log')
xlabel([gate, ' Concentration (mM)'])
ylabel('RCV')
legend(gate, cross{1}, cross{2}, cross{3},'Location','northeast')
