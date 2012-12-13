%This one plots the average #agents, divided per the sum of the densities,
%so it's a scaled version of the one above

hold on;
plot(0.1:0.1:120, AIS1up1downAvgScaled, 0.1:0.1:120, AIS1up08downAvgScaled, 0.1:0.1:120, AIS1up06downAvgScaled, 0.1:0.1:120, AIS1up04downAvgScaled, 0.1:0.1:120, AIS08up08downAvgScaled, 0.1:0.1:120, AIS08up06downAvgScaled, 0.1:0.1:120, AIS08up04downAvgScaled, 0.1:0.1:120, AIS06up06downAvgScaled);
plot(0.1:0.1:120, AIS06up04downAvgScaled, 'Color', [1 153/253 51/253]);
plot(0.1:0.1:120, AIS04up04downAvgScaled, 'Color', [153/255 1 0]);
legend('1 up, 1 down','1 up, 0.8 down','1 up, 0.6 down','1 up, 0.4 down','0.8 up, 0.8 down','0.8 up, 0.6 down','0.8 up, 0.4 down','0.6 up, 0.6 down','0.6 up, 0.4 down','0.4 up, 0.4 down','Location','NorthWest');
xlabel('Time in Seconds');
ylabel('(Number of Agents in System):(densityup+densitydown)');
title('Number of agents compared with various densities, scaled');
hold off;