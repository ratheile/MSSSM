% ag = agent.empty(5,0); %Array von 2 leeren agents
% ag(1) = agent(1,0,0,1,1);
% ag(2) = agent(1,0,3,-1,1);
% ag(3) = agent(1,2,2,1,1);
% ag(4) = agent(1,6,2,0.1,0);
% ag(5) = agent(1,7,2,0.1,0);
% prio = getPriorityArray(ag);
%prioArray = [1,1,1,0,0]

%function [ agentsArrayOut ] = logikFunktion( agentsArrayIn, wallArray )
function [angleOut] = logicFunction( agentsArray, agentPosition, influenceSphere, priorityArray)
%   Funktion berechnet die Richtung, in die ein Agent gehen wird. Mögliche
%   Werte liegen zwischen -pi/2 bis pi/2, wobei 0 nach rechts bedeutet und
%   180 nach links.
%   agentPosition gibt an, für welchen Agent dass es gemacht werden soll.
%   influenceSphere gibt an, wie gross der betrachtete Halbkreis eines
%   Arrays ist

    global ANGLE GAUSSANGLE XVALUES
    len = length(agentsArray);
    radius = zeros(len,1);
    
    for i = 1:len
        radius(i) = agentsArray(i).radius;
    end
    maxRadius = max(radius);
    if influenceSphere < (3*maxRadius)
        influenceSphere = 3*maxRadius;
    end
%    agentsArrayIn(1) = agentsArrayIn(1).addY(0.1);

    sumXaxis = GAUSSANGLE;
    for i = 1:len
        if i ~= agentPosition && priorityArray(i) ~= 0
            deltaY = agentsArray(i).cordY - agentsArray(agentPosition).cordY;
            deltaX = agentsArray(i).cordX - agentsArray(agentPosition).cordX;
            angleXY = atan(deltaX/deltaY); %deltaY > Null noch durch Bedingung der influenceSphere und Intervall von Angle festlegen festlegen
            
            [alpha,indexX] = closest(ANGLE, angleXY);
            alpha = (pi/2 - alpha);
            
            distance = sqrt(deltaX^2 + deltaY^2);
            diffVelocity = agentsArray(i).actSpeed - agentsArray(agentPosition).actSpeed;
%            sumXaxis = sumXaxis + xValuesLogic(angleXY, radiusSum, distance);
            [betaLeft, betaRight] = getBeta(agentsArray(agentPosition), agentsArray(i), alpha, distance);
            sumXaxis = xValuesLogic(indexX, distance, betaLeft, betaRight, diffVelocity);
            
            angleOut = sumXaxis;
            
        end
    end


end

