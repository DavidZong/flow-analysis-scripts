
ara = getTriplicate('Ara');
IPTG = getTriplicate('IPTG');
rib = getTriplicate('Rib');
tre = getTriplicate('Tre');

hold on
plot(ara(:, 2), ara(:, 3).^2, 'LineStyle', 'None', 'Marker', '.', 'MarkerSize', 12, 'MarkerFaceColor', 'r')
plot(IPTG(:, 2), IPTG(:, 3).^2, 'LineStyle', 'None', 'Marker', '.', 'MarkerSize', 12, 'MarkerFaceColor', 'g')
plot(rib(:, 2), rib(:, 3).^2, 'LineStyle', 'None', 'Marker', '.', 'MarkerSize', 12, 'MarkerFaceColor', 'b')
plot(tre(:, 2), tre(:, 3).^2, 'LineStyle', 'None', 'Marker', '.', 'MarkerSize', 12, 'MarkerFaceColor', 'm')
xlabel('Normalized Yellow Flouresence (MEPE)')
ylabel('RCV Squared')
legend('Ara', 'IPTG', 'Rib', 'Tre','Location','northeast')
a = gca();
set(a, 'YScale', 'log')
set(a, 'XScale', 'log')