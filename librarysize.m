x = 2:10;
for i=1:9
y(i) = nchoosek(x(i), 2);
end
plot(x, y, '.k', 'MarkerSize', 12)
ylabel('Number of Possible Combinations', 'FontSize', 18)
xlabel('Library Size', 'FontSize', 18)
set(gca,'fontsize',16)