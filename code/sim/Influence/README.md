# Influence Test Series

## Description

In this folder you find the outcomes of a test series, where ONLY the influence sphere radius, namely INFLUENCESPHERE, which represents the radius of the semi-circle an agent has a look into to decide where to walk next, was changed. For 3 different Seeds (51, 77, 151), and for four different values (1.5, 2.0, 2.5 and 3.0 meters), the simulation was run.

## Files

To each of these runs, three files were generated:
* filename.mat - contains all the information gained
* filename.png - a printscreen of the last created output that shows jams
* filename.txt - contains the File "defineConstants" for reproducibility as well as the used mode.

## Data saves

Then there are some Data Saves:
* ADataPackage1 - contains 12 vectors with the total walked distance per iteration (sum over all agents) of each simulation.

## Graps/Pictures

And there are some plots:

* ATotalDistanceInfluencesColoured - Plots the total distances of all 12 simulations in one plot, the same influence values have the same colour.
* ATotalDistanceSeedsColoured - Plots the total distances of all 12 simulations in one plot, the same seeds have the same colour
* ADistancesPerSeeds - Plots 3 plots, each another seed.

## Plot commands
The Matlab commands for the plots can be found in the file "APlotCodes.txt".