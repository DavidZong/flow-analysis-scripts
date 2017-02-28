clc
close all

gate = 'Ara';
cross = {'Ara', 'IPTG', 'Rib', 'Tre'};
cross(ismember(cross, gate)) = [];
d1 = xlsread('sigResults.xlsx', [gate, 'R1']);
d2 = xlsread('sigResults.xlsx', [gate, 'R2']);
d3 = xlsread('sigResults.xlsx', [gate, 'R3']);

meanMean = mean([d1(:, 2), d2(:, 2), d3(:, 2)], 2);
stdevMean = std([d1(:, 2), d2(:, 2), d3(:, 2)], 0, 2);

meanRCV = mean([d1(:, 3), d2(:, 3), d3(:, 3)], 2);
stdevRCV = std([d1(:, 3), d2(:, 3), d3(:, 3)], 0, 2);

% Make zero  10-4
d1(1,1) = 1e-4;

hold on
figure(1)
p = errorbar(d1(1:12, 1), meanMean(1:12), stdevMean(1:12));
a = gca();
set(p, 'LineStyle', 'None')
set(p, 'Marker', '.', 'MarkerSize', 16)
set(a, 'XScale', 'log')
set(a, 'YScale', 'log')
xlabel([gate, ' (mM)'])
ylabel('Fluorescence (MEPE)')
xlim([1E-4 1E2])
ylim([1e3 5*1e4])
a.FontSize = 20;
a.XMinorTick = 'off';
a.YMinorTick = 'off';
a.TickLength = [0.02 0.035];
a.LineWidth = 1.5;
box on
hold off

figure(2)
hold on
b = bar([meanMean(6); meanMean(16:18)]);
b.FaceColor = 'k';
e = errorbar(1:4, [meanMean(6); meanMean(16:18)], [stdevMean(6); stdevMean(16:18)], '.');
e.Color = 'k';
e.CapSize = 20;
set(e,'linewidth',2)
a = gca();

a.XTickLabel = {'Ara', 'IPTG', 'Rib', 'Tre'};
a.XTick = 1:4;
set(a, 'YScale', 'log')
a.YMinorTick = 'off';
a.TickLength = [0.02 0.035];
a.LineWidth = 1.5;

a.FontSize = 20;


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
