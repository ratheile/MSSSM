%This one plots the average number of agents (of the three seeds) in the
%different densities against time.

hold on;
plot(0.1:0.1:120, AgentsInSystem1up1downAvg, 0.1:0.1:120, AgentsInSystem1up08downAvg, 0.1:0.1:120, AgentsInSystem1up06downAvg, 0.1:0.1:120, AgentsInSystem1up04downAvg, 0.1:0.1:120, AgentsInSystem08up08downAvg, 0.1:0.1:120, AgentsInSystem08up06downAvg, 0.1:0.1:120, AgentsInSystem08up04downAvg);
plot(0.1:0.1:120, AgentsInSystem06up06downAvg, 'Color', [1 0 1]);
plot(0.1:0.1:120, AgentsInSystem06up04downAvg, 'Color', [1 153/253 51/253]);
plot(0.1:0.1:120, AgentsInSystem04up04downAvg, 'Color', [153/255 1 0]);
legend('1 up, 1 down','1 up, 0.8 down','1 up, 0.6 down','1 up, 0.4 down','0.8 up, 0.8 down','0.8 up, 0.6 down','0.8 up, 0.4 down','0.6 up, 0.6 down','0.6 up, 0.4 down','0.4 up, 0.4 down','Location','NorthWest');
xlabel('Time in Seconds'); ylabel('Number of Agents in System');
title('Number of agents compared with various densities');
hold off;