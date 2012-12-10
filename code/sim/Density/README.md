# Density Test Series

## Description

In this folder you find the outcomes of a test series, where ONLY the densities, namely DENSITYUP and DENSITYDOWN of agents incoming per second was changed. For 3 different Seeds (51, 71, 91), and for different combinations of up and down density (each combinations of elements of (0.4, 0.6, 0.8, 1), where densityup >= densitydown => 10 combinations), the simulation was run. We didn't run the other combinations because the whole situation is symmetric.

## Files

To each of these runs, three files were generated:
* filename.mat - contains all the information gained
* filename.png - a printscreen of the last created output that shows jams
* filename.txt - contains the File "defineConstants" for reproducibility as well as the used mode.

## Data saves

Then there are some Data Saves:
* ADataPackage1 - contains for the 10 simulated combinations, each 3 seeds, each the vectors "agents in system", "agent finished time", "agent finished distance", so in total 10*3*3=90 vectors
* ADataPackage2 - contains ADataPackage1 and also Average Vectors to each of the Situations: ...Avg (...1+...2+...3)/3
* ADataPackage3 - contains ADataPackage2 and also the 9 "scaled" AgentsInSystem Vectors (eg. AIS08up08downAvgScaled = AgentsInSystem08up08downAvg/1.6;). Also, it contains the mean values taken to each densitycombination over all seeds for time and distance travelled. eg: meanDist1up06down = mean([AgentsDist1up06down1, AgentsDist1up06down2, AgentsDist1up06down3]); and an example for the time: meanTime04up04down = mean([AgentsTime04up04down1, AgentsTime04up04down2, AgentsTime04up04down3]);
* ADataPackage4 - contains ADataPackage3 and also for all the finished agents their velocities as in AgentSpeed1up1down=[AgentsDist1up1down1, AgentsDist1up1down2, AgentsDist1up1down3]./[AgentsTime1up1down1, AgentsTime1up1down2, AgentsTime1up1down3]; and their mean values as in meanSpeed1up1down = mean(AgentSpeed1up1down); 

## Graps/Pictures

And there are some Graphs:

* AAllAveragesInOnePlot - This one plots the average number of agents (of the three seeds) in the different densities against time
* AAllAveragesScaled - This one plots the average #agents, divided per the sum of the densities, so it's a scaled version of the one above
* AMeanDistancesCompared - This one plots the mean distance (over all seeds), an agent had to walk in order to arrive, in comparison to the densities added up.
* AMeanTimeCompared - This one plots the mean time (over all seeds), an agent had to walk in order to arrive, in comparison to the densities added up.
* AMeanSpeedCompared - This one plots the mean speed (over all seeds), an agent had to walk in order to arrive, in comparison to the densities added up.

## Graph commands
Here are the Matlab codes for the graphs:

The Matlab codes can be found in the file APlotCodes.txt.