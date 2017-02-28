function plotHeatmap(ind1, ind2, meanMean)
c = reshape(meanMean, [6 6]);
c = flipud(c);
figure()
imagesc(c, [0 1])
co = colorbar;

co.Label.String ='Fluoresence (MEPE)';
co.Label.FontSize = 20;
co.FontSize = 20;
colormap jet
set(gca,'YTick',[]);
set(gca,'XTick',[]);
xlabel(ind1,'FontSize',20)
ylabel(ind2,'FontSize',20)