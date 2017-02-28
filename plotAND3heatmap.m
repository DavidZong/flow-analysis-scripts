clc
close all

ind1 = 'Ara';
ind2 = 'Rib';
ind3 = 'Tre00';
meanMean00 = log10(getMeanPlane(ind1, ind2, ind3));
ind3 = 'Tre10';
meanMean10 = log10(getMeanPlane(ind1, ind2, ind3));
ind3 = 'Tre01';
meanMean01 = log10(getMeanPlane(ind1, ind2, ind3));


meanMeanAR = log10(getMeanPlane(ind1, ind2));
meanMeanAT = log10(getMeanPlane(ind1, 'Tre'));
meanMeanRT = log10(getMeanPlane(ind2, 'Tre'));

ultimateMax = max([max(max(meanMean00)), max(max(meanMean10)), max(max(meanMean01)), max(max(meanMeanAR)), max(max(meanMeanAT)), max(max(meanMeanRT))]);
ultimateMin = min([min(min(meanMean00)), min(min(meanMean10)), min(min(meanMean01)), min(min(meanMeanAR)), min(min(meanMeanAT)), min(min(meanMeanRT))]);
bot = ultimateMax - ultimateMin;

meanMean00n = (meanMean00 - ultimateMin) / bot;
meanMean01n = (meanMean01 - ultimateMin) / bot;
meanMean10n = (meanMean10 - ultimateMin) / bot;
meanMeanARn = (meanMeanAR - ultimateMin) / bot;
meanMeanATn = (meanMeanAT - ultimateMin) / bot;
meanMeanRTn = (meanMeanRT - ultimateMin) / bot;

% ind1 goes up on the x axis, ind2 goes right on the y axis
ind1 = 'Ara';
ind2 = 'Rib';
plotHeatmap(ind1, ind2, meanMean00n)
plotHeatmap(ind1, ind2, meanMean01n)
plotHeatmap(ind1, ind2, meanMean10n)
plotHeatmap(ind1, ind2, meanMeanARn)
plotHeatmap(ind1, 'Tre', meanMeanATn)
plotHeatmap(ind2, 'Tre', meanMeanRTn)
