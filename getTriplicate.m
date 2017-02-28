function d = getTriplicate(gate)
d1 = xlsread('sigResults.xlsx', [gate, 'R1']);
d2 = xlsread('sigResults.xlsx', [gate, 'R2']);
d3 = xlsread('sigResults.xlsx', [gate, 'R3']);
d = [d1;d2;d3];