% ag = agent.empty(5,0) %Array von 2 leeren agents
% ag(1) = agent(1,0,0,0.1,1);
% ag(2) = agent(1,0,3,0.1,1);
% ag(3) = agent(1,2,2,0.1,1);
% ag(4) = agent(1,6,2,0.1,0);
% ag(5) = agent(1,7,2,0.1,0);
% prio = getPriorityArray(ag)
%prioArray = [1,1,1,0,0]

%function [ agentsArrayOut ] = logikFunktion( agentsArrayIn, wallArray )
function [angleOut] = logicFunction( agentsArray, agentPosition, influenceSphere, priorityArray)
%   Funktion berechnet die Richtung, in die ein Agent gehen wird. M�gliche
%   Werte liegen zwischen -pi/2 bis pi/2, wobei 0 nach rechts bedeutet und
%   180 nach links.
%   agentPosition gibt an, f�r welchen Agent dass es gemacht werden soll.
%   influenceSphere gibt an, wie gross der betrachtete Halbkreis eines
%   Arrays ist

    global ANGLE GAUSSANGLE
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
            if deltaX ~= 0
                angleXY = atan(deltaY/deltaX);
            else
                angleXY = 0;
            end
            [~,indexX] = closest(ANGLE, angleXY);
            
            distance = sqrt(deltaX^2 + deltaY^2);
            radiusSum = agentsArray(i).radius + agentsArray(agentPosition).radius;
            sumXaxis = sumXaxis .+ xValuesLogic(angleXY, radiusSum, distance)
            
            
            
            
        end
    end


end

