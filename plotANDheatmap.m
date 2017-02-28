clc
close all

ind1 = 'Ara';
ind2 = 'Tre';
d1 = xlsread('andResults.xlsx', [ind1, ind2, '_R1']);
d2 = xlsread('andResults.xlsx', [ind1, ind2, '_R2']);
d3 = xlsread('andResults.xlsx', [ind1, ind2, '_R3']);

meanMean = mean([d1(:, 3), d2(:, 3), d3(:, 3)], 2);
stdevMean = std([d1(:, 3), d2(:, 3), d3(:, 3)], 0, 2);

meanRCV = mean([d1(:, 4), d2(:, 4), d3(:, 4)], 2);
stdevRCV = std([d1(:, 4), d2(:, 4), d3(:, 4)], 0, 2);

% ind1 goes up on the y axis, ind2 goes right on the x axis
c = reshape(meanMean, [6 6]);
c = flipud(c);
cl = log10(c);
imagesc(cl)
co = colorbar;

co.Label.String ='Flouresence (MEPE)';
co.Label.FontSize = 20;
co.FontSize = 20;
colormap jet
set(gca,'YTick',[]);
set(gca,'XTick',[]);
xlabel(ind1,'FontSize',20)
ylabel(ind2,'FontSize',20)
