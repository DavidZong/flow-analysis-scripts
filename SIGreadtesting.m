clc
clear all
close all

resultPoint = '160907_Rib_IPTG_SIG_r1output';
sortSIGresults(resultPoint, 1, 'RibR1');
sortSIGresults(resultPoint, 2, 'IPTGR1');
resultPoint = '160907_Tre_Ara_SIG_r1output';
sortSIGresults(resultPoint, 1, 'TreR1');
sortSIGresults(resultPoint, 2, 'AraR1');
resultPoint = '160909_Rib_IPTG_SIG_r2output';
sortSIGresults(resultPoint, 1, 'RibR2');
sortSIGresults(resultPoint, 2, 'IPTGR2');
resultPoint = '160909_Tre_Ara_SIG_r2output';
sortSIGresults(resultPoint, 1, 'TreR2');
sortSIGresults(resultPoint, 2, 'AraR2');
resultPoint = '160910_Ara_IPTG_SIG_r3output';
sortSIGresults(resultPoint, 2, 'AraR3');
sortSIGresults(resultPoint, 1, 'IPTGR3');
resultPoint = '160910_Rib_Tre_SIG_r3output';
sortSIGresults(resultPoint, 1, 'RibR3');
sortSIGresults(resultPoint, 2, 'TreR3');