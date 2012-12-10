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

## Graps/Pictures

And there are some Graphs:
* There are no graphs yet.

## Graph commands
Here are the Matlab codes for the graphs:

The Matlab codes can be found in the file APlotCodes.txt.