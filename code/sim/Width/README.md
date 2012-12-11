# Width Test Series

## Description

In this folder you find the outcomes of a test series, where ONLY the WIDTH of the hallway was changed. For 3 different Seeds (51, 77, 151), and each 5 different widths (2.2m, 2.5m, 2.8m, 3.0m, 3.5m), the simulation was run. 

## Files

To each of these runs, three files were generated:
* filename.mat - contains all the information gained
* filename.png - a printscreen of the last created output that shows jams
* filename.txt - contains the File "defineConstants" for reproducibility as well as the used mode.

## Data saves

Then there are some Data Saves:
* ADataPackage1 - contains the 15 vectors with number of agents in the system in each iteration
* ADataPackage2 - contains also 5 average vectors (one per each width)
* WidthTest2500mmSeed51ProfileViewer.pdf - The combination 2.5m, Seed 51 was a total killer because there was a massive jam right from the beginning which caused in massive CPU use, a reason to save the ProfileViewer's data.

## Plots/Pictures

And there are some plots:
* AallInOne - all the 15 vectors of #agents in systems in one graph
* AAveragesInOne - the 5 average vectors of #agents in systems
Also, a picture was token:
* WidthTest2800mmSeed51LaneFormation70sec.jpg - At 2.8m, Seed 51, ca.70, a very nice example of lane formation pops up

## Plot commands
Here are the Matlab codes for the plots:

AallInOne:

plot(0.1:0.1:100, W2200mmSeed51, 'c', 0.1:0.1:100, W2200mmSeed77, 'c', 0.1:0.1:100, W2200mmSeed151, 'c', 0.1:0.1:100, W2500mmSeed51, 'k', 0.1:0.1:100, W2500mmSeed77, 'k', 0.1:0.1:100, W2500mmSeed151, 'k', 0.1:0.1:100, W2800mmSeed51, 'r', 0.1:0.1:100, W2800mmSeed77, 'r', 0.1:0.1:100, W2800mmSeed151, 'r', 0.1:0.1:100, W3000mmSeed51, 'b', 0.1:0.1:100, W3000mmSeed77, 'b', 0.1:0.1:100, W3000mmSeed151, 'b', 0.1:0.1:100, W3500mmSeed51, 'g', 0.1:0.1:100, W3500mmSeed77, 'g', 0.1:0.1:100, W3500mmSeed151, 'g'); legend('2.2m - 51','2.2m - 77','2.2m - 151', '2.5m - 51','2.5m - 77','2.5m - 151', '2.8m - 51','2.8m - 77','2.8m - 151', '3.0m - 51','3.0m - 77','3.0m - 151', '3.5m - 51','3.5m - 77','3.5m - 151','Location','NorthWest'); title('WIDTH of hallway - agents in simulation'); xlabel('Time in seconds'); ylabel('Number of agents in system');

AaverageInOne:

plot(0.1:0.1:100, W2200mmAverage, 'c', 0.1:0.1:100, W2500mmAverage, 'k', 0.1:0.1:100, W2800mmAverage, 'r', 0.1:0.1:100, W3000mmAverage, 'b', 0.1:0.1:100, W3500mmAverage, 'g'); legend('2.2m - Average', '2.5m - Average', '2.8m - Average', '3.0m - Average', '3.5m - Average','Location','NorthWest'); title('WIDTH of hallway - agents in simulation'); xlabel('Time in seconds'); ylabel('Number of agents in system');