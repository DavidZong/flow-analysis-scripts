function meanMean = getMeanPlane(ind1, ind2, ind3)
switch nargin
    case 3
        sheet = 'and3Results.xlsx';
    case 2
        sheet = 'andResults.xlsx';
        ind3 = '';
end
d1 = xlsread(sheet, [ind1, ind2, ind3, '_R1']);
d2 = xlsread(sheet, [ind1, ind2, ind3, '_R2']);
d3 = xlsread(sheet, [ind1, ind2, ind3, '_R3']);

meanMean = mean([d1(:, 3), d2(:, 3), d3(:, 3)], 2);