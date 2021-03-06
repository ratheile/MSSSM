﻿# MATLAB HS12 – Research Plan
Version info: the submitted and approved version, 2012-10-24 17h

* Group Name: Mayara
* Group participants names: Moser Manuel (Mathematics BSc, 3rd Sem), Suter Yannick (Chemistry BSc, 5th Sem), Theiler Raffael (Informatics BSc, 3rd Sem)
* Project Title: Pedestrian dynamics in long, narrow hallways

## General Introduction

Annoyed by people rushing through the small corridor left in Zurich main station hall (the path between burger king and groups meeting point) during the Oktoberfest, market days, concerts and other occasions, we decided to have a look at pedestrian dynamics in hallways which are mostly crowded and narrow (3-4 meters in breadth) compared to normal days when the hall is empty, and where people walk through in opposite directions all the time. We want to have a look at how the pedestrian flux can be improved and how the walk-through time behaves during rush-hours, but also in the case of much more persons moving in one direction than in the other. Also, we want to have a look at the influences of aggressive, fast people in a rush, slowly moving obstacles like mothers with baby buggies and some drunkards, and try to figure out how to avoid jammings. Maybe we'll also implement a static obstacle to observe what happens.
The simulation of problems like this will also help understand the phenomena of group dynamics which usually control and resolve such problems in real life.

## The Model

We want to do an agent-based simulation of people moving through a long corridor (dimensions will be proportional to those encountered in our object, the Zurich main station). The people will primary want to move forwards at different speeds but also be able to move diagonally or even sideways if needed. A nice thing will be to try implementing agents being able to see some fields/meters ahead whether their path (assumed straight as long as possible) is free or not, and if they're about to crash into someone, try to avoid them.
Independent variables in our model are the amount of people per time arriving, the corridor and its obstacles and the characteristics of the agents like walking speed and aggressiveness.
Dependent variables will be the amount of people leaving, which should in the end determine whether the people will be stuck or if they can get through. Should the amount of people leaving be smaller than those arriving (per time unit), one can expect a blockage.
As a reference, we will use a simulation of a corridor without any obstacles and only few people. Then the collective success or failure of an other situation can be compared to this.

## Fundamental Questions

* We try to simulate the pedestrian flux in the following different situations:
Rush hour (danger of jamming), with an static obstacle, with aggressive/very fast or slow agents, random path agent (drunkard). Will the pedestrian flux run smoothly or will they block each other and be stuck?
* Will the implementation of a rudimentary kind of thinking/looking ahead help to avoid blockages? If possible, we may determine the limits for which the goal of passing is achieved with and without this implementation and compare them.
* Will there be group dynamics or similar behaviors of agents if they're only programmed to walk to the other side, each on his own?

## Expected Results

We think that there will be lots of walking around left/right while trying to avoid other agents, and with rising amount of agents there will be more jams, this seems obvious.
We think that in our simulation we'll have to deal with massive jams because the agents are not communicating with each other in any way. Implementation of "looking ahead" will probably improve the people flux but only to a limited range. Obstacles will also lead to more jams, whilst the drunkard simulation will for the amusement of our group.

## References 

Just some ideas where to get inspiration from:
* Project Suggestions - 16 - Pedestrian Dynamics - 5 papers - http://www.soms.ethz.ch/teaching/MatlabFall2012/projects/16-Pedestrian_Dynamics.zip - (01.10.2012)
* Mehdi Moussaid Publications - http://mehdimoussaid.com/publications.html (24.10.2012)
* Crowd-Flow-Optimization - FS2012 - https://github.com/nfloery/crowd-flow-optimization  (01.10.2012)
* Train Jamming - FS2011 - https://github.com/msssm/Train_Jammin  (01.10.2012)
* Airplane Evacuation / FS2011 https://github.com/msssm/Airplane_Evacuation_2011_FS  (01.10.2012)

## Research Methods

For our project, an agent-based model is the most satisfying because there we can really implement different speeds and directions. A disadvantage will be the complicated collision handling.

## Other

For the measurements of the corridor, we'll go to the main station and measure it one afternoon when it's not fully crowded. We also could count the rate of incoming and leaving people during a rather relaxed afternoon and a crowded rush-hour.