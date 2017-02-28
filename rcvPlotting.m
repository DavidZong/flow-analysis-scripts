close all

means = [];
rcvs = [];
gind = []; % an index to track which gate the data is from

gate = {'Ara', 'IPTG', 'Rib', 'Tre','AraIPTG', 'AraRib', 'AraTre', 'IPTGRib', 'IPTGTre', 'RibTre'};
for i = 1:4
    %get data
    d1 = xlsread('sigResults.xlsx', [gate{i}, 'R1']);
    d2 = xlsread('sigResults.xlsx', [gate{i}, 'R2']);
    d3 = xlsread('sigResults.xlsx', [gate{i}, 'R3']);
    %append data
    means = [means; d1(1:12, 2); d2(1:12, 2); d3(1:12, 2)];
    rcvs = [rcvs; d1(1:12, 3); d2(1:12, 3); d3(1:12, 3)];
    gind = [gind; i*ones(3*length(d1(1:12, 2)),1)];
end

% append all AND gates

for i = 5:10
    %get data
    d1 = xlsread('andResults.xlsx', [gate{i}, '_R1']);
    d2 = xlsread('andResults.xlsx', [gate{i}, '_R2']);
    d3 = xlsread('andResults.xlsx', [gate{i}, '_R3']);
    %append data
    means = [means; d1(:, 3); d2(:, 3); d3(:, 3)];
    rcvs = [rcvs; d1(:, 4); d2(:, 4); d3(:, 4)];
    gind = [gind; i*ones(3*length(d1(:, 3)),1)];
end

rcv2 = rcvs .^ 2;

figure(1)
plot(means, rcv2, '.k', 'MarkerSize', 12);
a = gca();
set(a, 'XScale', 'log')
set(a, 'YScale', 'log')
xlabel('Fluorescence (MEPE)')
ylabel('RCV')

figure(2)
index = [find(gind == 1); find(gind >= 5 & gind <= 7)];
hybridmeans = means(index);
hybridrcv2 = rcv2(index);
plot(hybridmeans, hybridrcv2, '.k', 'MarkerSize', 12);
a = gca();
set(a, 'XScale', 'log')
set(a, 'YScale', 'log')
xlabel('Fluorescence (MEPE)')
ylabel('RCV')
yaxislims = ylim;

figure(3)
index2 = [find(gind >= 2 & gind <= 4); find(gind >= 8 & gind <= 10)];
lacmeans = means(index2);
lacrcv2 = rcv2(index2);
plot(lacmeans, lacrcv2, '.k', 'MarkerSize', 12);
a = gca();
set(a, 'XScale', 'log')
set(a, 'YScale', 'log')
xlabel('Fluorescence (MEPE)')
ylabel('RCV')
ylim(yaxislims);
