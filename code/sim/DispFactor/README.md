# Width Test Series

## Description

In this folder you find the outcomes of a test series, where ONLY the DISPERSIONFACTOR of the agents was changed. For 3 different Seeds (51, 151, 351), and 13 different dispersionfactors (1.0, 0.9, ..., 0.0, -0.1, -0.2), the simulation was run, which means there were in total 39 simulations. 

## Files

To each of these runs, three files were generated:
* filename.mat - contains all the information gained
* filename.png - a printscreen of the last created output that shows jams
* filename.txt - contains the File "defineConstants" for reproducibility as well as the used mode.

## Data saves

Then there are some Data Saves:
* ADataPackage1 - contains all the imported data, namely for each of the 39 simulations one vector AISDispFactXXSeedYYY and one vector DistDispFactXXXSeedYY, AIS = Agents in System, Dist = Distance covered of all agents, DispFactXXX = Dispersion Factor XXX eg. 05 = 0.5, M01 = -0.1 ; Seed YYY, YYY = {51, 151, 351}.

## Plots/Pictures and commands

And there are some plots and where their codes can be found to regenerate them:
* APossiblePlots.txt - contains commands and descriptions for plots that didn't make the way into our hearts but are very interesting too
* ADistanceSeedsFactors - split up in each seed, into groups of (5/4/4) subsets, one can easily see that the higher the higher the densityFactor, the higher is the possibility to crash (=jam). code in ADistanceSeedsFactors.m
* ASeedAnalysisSeperatedNormalized - Plots 3x3-Matrix with subplots analyzing the seeds, the seeds being seperated into smaller groups for better readability (-0.2 - 0.2 ; 0.3 - 0.6 ; 0.7 - 1.0). The total Distance per Iteration is divided by the number of agents in the system, that's why we call it "normalized". Code in file ASeedAnalysisSeperatedNormalized.m
* AAllInOneColorsEqual - Part 1 of 3 of "all in one" plots. Data "normalized" (total distance : #agents), and coloured (blue=low dispFac ; red=high dispFac). Because the colors are "gone through" three times, red is a bit dominant because drawn last, but not very much -> "equal". Code in file AAllInOneColorsEqual.m
* AAllInOneColorsRed - Part 2 of 3 of "all in one" plots. Data "normalized" (total distance : #agents), and coloured (blue=low dispFac ; red=high dispFac). Because the colors are "gone through" from blue to red, red is drawn last and is very dominant in the plot -> "red". Code in file AAllInOneColorsRed.m
* AAllInOneColorsBlue - Part 3 of 3 of "all in one" plots. Data "normalized" (total distance : #agents), and coloured (blue=low dispFac ; red=high dispFac). Because the colors are "gone through" from red to blue, blue is drawn last and is very dominant in the plot -> "blue". Code in file AAllInOneColorsBlue.m
