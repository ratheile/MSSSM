% ag = agent.empty(5,0); %Array von 2 leeren agents
% ag(1) = agent(1,0,0,1,1);
% ag(2) = agent(1,0,3,-1,1);
% ag(3) = agent(1,2,2,1,1);
% ag(4) = agent(1,6,2,0.1,0);
% ag(5) = agent(1,7,2,0.1,0);
% prio = getPriorityArray(ag);
%prioArray = [1,1,1,0,0]

%function [ agentsArrayOut ] = logikFunktion( agentsArrayIn, wallArray )
function [angleOut] = logicFunction( agentsArray, agentPosition, influenceSphere, priorityArray, wallArray)
%   Funktion berechnet die Richtung, in die ein Agent gehen wird. Mögliche
%   Werte liegen zwischen -pi/2 bis pi/2, wobei 0 nach rechts bedeutet und
%   180 nach links.
%   agentPosition gibt an, für welchen Agent dass es gemacht werden soll.
%   influenceSphere gibt an, wie gross der betrachtete Halbkreis eines
%   Arrays ist

    global ANGLE GAUSSANGLE
    len = length(agentsArray);
    radius = zeros(len,1);
    
    sumXaxis = GAUSSANGLE;    
    if len > 0 %Sollte eigentlich immer erfüllt sein
        for i = 1:len
            radius(i) = agentsArray(i).radius;
        end
        maxRadius = max(radius);
        if influenceSphere < (3*maxRadius)
            influenceSphere = 3*maxRadius;
        end
%       agentsArrayIn(1) = agentsArrayIn(1).addY(0.1);


        for i = 1:len %Durch den Array mit allen Agenten durchgehen
            if i ~= agentPosition && priorityArray(i) ~= 0
                deltaY = agentsArray(i).cordY - agentsArray(agentPosition).cordY;
                deltaX = agentsArray(i).cordX - agentsArray(agentPosition).cordX;
                distance = sqrt(deltaX^2 + deltaY^2);
            
                if distance < influenceSphere && (sign(agentsArray(agentPosition).maxSpeed) * agentsArray(i).cordY) > (sign(agentsArray(agentPosition).maxSpeed) * agentsArray(agentPosition).cordY)
            
                    angleXY = atan(deltaX/deltaY);
            
                    [alpha,indexX] = closest(ANGLE, angleXY);
                    alpha = (pi/2 - alpha);
    
                    radiusSum = agentsArray(agentPosition).radius + agentsArray(i).radius;
            
            
                    if (sign(agentsArray(i).actSpeed) + sign(agentsArray(agentPosition).actSpeed)) == 0 %Agents laufen in unterschiedliche Richtung
                        diffVelocity = -abs(agentsArray(i).actSpeed - agentsArray(agentPosition).actSpeed);
                    else %Agents laufen in gleiche Richtung oder einer bleibt stehen
                        diffVelocity = abs(agentsArray(i).actSpeed - agentsArray(agentPosition).actSpeed);
                    end
                
                    [betaLeft, betaRight] = getBeta(radiusSum, alpha, distance);
                    sumXaxis = sumXaxis + xValuesLogic(indexX, distance, betaLeft, betaRight, diffVelocity, radiusSum);            
                    %angleOut = sumXaxis %Für debugging
                end
            end
        end
        
    end
    
    lenWall = length(wallArray);
    if lenWall > 0
        for i = 1:lenWall
            deltaY = agentsArray(i).cordY - agentsArray(agentPosition).cordY;
            deltaX = agentsArray(i).cordX - agentsArray(agentPosition).cordX;
            distance = sqrt(deltaX^2 + deltaY^2);           
            if distance < influenceSphere && (sign(agentsArray(agentPosition).maxSpeed) * wallArray(i).cordY) > (sign(agentsArray(agentPosition).maxSpeed) * agentsArray(agentPosition).cordY)
                    angleXY = atan(deltaX/deltaY);
                    [alpha,~] = closest(ANGLE, angleXY);
                    alpha = (pi/2 - alpha);
                    [betaLeft, betaRight] = getBeta(radius, alpha, distance);                    
                    
                    sumXaxis = sumXaxis + xWallLogic(distance, betaLeft, betaRight, agentsArray(agentPosition).radius);                
            end
            
        end
    end
    [~,indexAngle] = max(sumXaxis);
    angleOut = ANGLE(indexAngle);
end

