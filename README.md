# MATLAB HS12 – Research Plan

* Group Name: (be creative!) - any ideas? Mayalura (Thank you for calling customer support in india, my name is mayalura how can i help you) ? xD
* Group participants names: Moser Manuel (Mathematics, 3rd Sem), Schiesser Lukas (Mathematics, 3rd Sem), Suter Yannick (Chemistry, 5th Sem), Theiler Raffael (Informatics, ? Sem)
* Project Title: Pedestrian dynamics in hallways - or other ideas?

## General Introduction

> (States your motivation clearly: why is it important / interesting to solve this problem?)
> (Add real-world examples, if any)
> (Put the problem into a historical context, from what does it originate? Are there already some proposed solutions?)
Annoyed by people rushing through the small corridor left in Zurich main station during the octoberfest, market days, concerts and other occasions, we decided to have a look at pedestrian dynamics in hallways which are mostly crowded and narrow (3-4 meters in breadth) compared to normal days when the hall is empty, and where people walk through in opposite directions all the time. We want to have a look at how the pedestrian flux can be improved and how the walk-through time behaves during rush-hours, but also in the case of much more persons moving in one direction than in the other. Also, we want to have a look at the influences of aggressive, fast persons in a rush, slowly moving obstacles like mothers with baby buggies and some drunkards and try to figure out how to avoid jammings.

## The Model

> (Define dependent and independent variables you want to study. Say how you want to measure them.)
> (Why is your model a good abtraction of the problem you want to study?)
> (Are you capturing all the relevant aspects of the problem?)
We want to do an agent-based simulation people moving through a long corridor (dimensions will be proportional to those encountered in our object, the Zurich main station). The persons will primary want to move forwards at different speeds but also be able to move diagonally or even sideways if needed. A nice thing to try to implement will be agents being able to see some fields/meters ahead whether their path (assumed straight as long as possible) is free or not, and if they're about to crash into someone, try to avoid them.

## Fundamental Questions

> (At the end of the project you want to find the answer to these questions)
> (Formulate a few, clear questions. Articulate them in sub-questions, from the more general to the more specific. )
* Can we work out strategies to improve the pedestrian flux in different situations:
rush hour (danger of jamming), with an obstacle, with aggressive/very fast agents
* Will there be group dynamics or similar behaviours of agents if they're only programmed to walk to the other side, each on his own?
* ...?
* (add more, but I think programming group dynamics will be too much, we should concentrate on "easier" tasks such as different speeds of agents, looking ahead a few meters, and so on)

## Expected Results

> (What are the answers to the above questions that you expect to find before starting your research?)
We think that there will be lots of walking around left/right while trying to avoid other agents, and with rising amount of agents there will be more jams.
A situation we think of as quite appealing will be to divide the hallway into halfs, each being a one-way street. This could cause problem between fast and slow moving agents in the same direction but could be a good method to avoid bottleneck situations.
We think that in our simulation we'll have to deal with massive jammings because the agents are not communicating with each other.


## References 

> (Add the bibliographic references you intend to use)
> (Explain possible extension to the above models)
> (Code / Projects Reports of the previous year)
Just some ideas where to get inspiration from:
* Project Suggestions - 16 - Pedestrian Dynamics - 5 papers
* Crowd-Flow-Optimization - FS2012 - https://github.com/nfloery/crowd-flow-optimization
* Train Jamming - FS2011 - https://github.com/msssm/Train_Jammin https://github.com/msssm/Airplane_Evacuation_2011_FS

## Research Methods

> (Cellular Automata, Agent-Based Model, Continuous Modeling...) (If you are not sure here: 1. Consult your colleagues, 2. ask the teachers, 3. remember that you can change it afterwards)
Müssen wir abklären, ob agent-based oder cellular automata besser geeignet! Ich vermute Agent-based, aber habe gesen dass die Crowd-Flow-Opt. Leute in ihrer PPS von Cellular Automata schreiben, und die scheinen etwas ähnliches zu haben...


## Other

> (mention datasets you are going to use)
...??????

## Version / Want-to-do-List

* Version Mosi first setup, 2012-10-09 21h
* geht nochmals alle Fragen durch, haben wir zu allem etwas?
* ein paar mal überarbeiten
* Research Methods entscheiden/ Infos einholen
* Other...?