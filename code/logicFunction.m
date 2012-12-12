function [angleOut] = logicFunction( agentsArray, agentPosition, influenceSphere, priorityArray, wallArray)
%   Funktion berechnet die Richtung, in die ein Agent gehen wird. Mögliche
%   Werte liegen zwischen -pi/2 bis pi/2, wobei 0 nach rechts bedeutet und
%   180 nach links.
%   agentPosition gibt an, für welchen Agent dass es gemacht werden soll.
%   influenceSphere gibt an, wie gross der betrachtete Halbkreis eines
%   Arrays ist
%   Funktion summiert die einzelnen Einflüsse aller anderen Agents, welche
%   innerhalbt der influenceSphere sind. Danach werden die Einflüsse aller
%   Wandagents innerhalb der influenceSphere addiert. Anschliessend wird
%   das Maximum dieser entstehenden Funktion genommen und der entsprechende
%   Winkel zurückgegeben.

    global ANGLE GAUSSANGLE DISPERSIONFACTOR
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

        for i = 1:len %Durch den Array mit allen Agenten durchgehen
            if i ~= agentPosition && priorityArray(i) ~= 0
                deltaY = agentsArray(i).cordY - agentsArray(agentPosition).cordY;
                deltaX = agentsArray(i).cordX - agentsArray(agentPosition).cordX;
                distance = sqrt(deltaX^2 + deltaY^2);
            
                if distance < influenceSphere && (sign(agentsArray(agentPosition).maxSpeed) * agentsArray(i).cordY) > (sign(agentsArray(agentPosition).maxSpeed) * agentsArray(agentPosition).cordY)
            
                    angleXY = atan(deltaX/deltaY);
            
                    [alpha,indexX] = closest(ANGLE, angleXY);
                    alpha = (pi/2 - alpha); %   Alpha umrechnen in das Alpha, welches für die Berechnung der Betawinkel benötigt wird (siehe Dokumentation)
    
                    radiusSum = agentsArray(agentPosition).radius + agentsArray(i).radius;
            
                    
                    if (sign(agentsArray(i).actSpeed) == 0) %Anderer Agent bleibt stehen
                        diffVelocity = -abs(agentsArray(i).actSpeed);
%                    elseif (sign(agentsArray(i).actSpeed) + sign(agentsArray(agentPosition).actSpeed)) == 0 || ((abs(agentsArray(agentPosition).actSpeed) - abs(agentsArray(i).actSpeed)) > 0) %Agents laufen in unterschiedliche Richtung
                    elseif (sign(agentsArray(i).actSpeed) + sign(agentsArray(agentPosition).actSpeed)) == 0 %Agents laufen in unterschiedliche Richtung
                        diffVelocity = -abs(agentsArray(i).actSpeed - agentsArray(agentPosition).actSpeed);
                    elseif ((abs(agentsArray(agentPosition).actSpeed) - abs(agentsArray(i).actSpeed)) > 0)
                        diffVelocity = -abs(agentsArray(i).actSpeed - agentsArray(agentPosition).actSpeed) * DISPERSIONFACTOR;                        
                    else %Agents laufen in gleiche Richtung oder einer bleibt stehen
                        diffVelocity = abs(agentsArray(i).actSpeed - agentsArray(agentPosition).actSpeed);
                    end
                
                    [betaLeft, betaRight] = getBeta(radiusSum, alpha, distance);
                    if sign(agentsArray(agentPosition).actSpeed) == 0
                        moving = 0;
                    elseif abs(sign(agentsArray(agentPosition).actSpeed) + sign(agentsArray(i).actSpeed)) == 2 %Agents laufen in die gleiche Richtung
                        moving = 1;
                    else
                        moving = 2;
                    end
                        
                    sumXaxis = sumXaxis + xValuesLogic(indexX, distance, betaLeft, betaRight, diffVelocity, radiusSum, moving);       
                    %angleOut = sumXaxis %Für debugging
                end
            end
        end
        
    end
    
    lenWall = length(wallArray);
    if lenWall > 0
        for i = 1:lenWall
            deltaY = wallArray(i).cordY - agentsArray(agentPosition).cordY;
            deltaX = wallArray(i).cordX - agentsArray(agentPosition).cordX;
            distance = sqrt(deltaX^2 + deltaY^2);        
            if distance < influenceSphere && (sign(agentsArray(agentPosition).maxSpeed) * wallArray(i).cordY) > (sign(agentsArray(agentPosition).maxSpeed) * agentsArray(agentPosition).cordY)
                    angleXY = atan(deltaX/deltaY);
                    [alpha,~] = closest(ANGLE, angleXY);
                    alpha = (pi/2 - alpha);
                    [betaLeft, betaRight] = getBeta(radius(agentPosition) + wallArray(i).radius, alpha, distance);
                    
                    sumXaxis = sumXaxis + xWallLogic(distance, betaLeft, betaRight, agentsArray(agentPosition).radius);
            end
            %plot(ANGLE, sumXaxis);
        end
    end
    [~,indexAngle] = max(sumXaxis);
    angleOut = ANGLE(indexAngle);
end

