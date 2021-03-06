function [topOut,botOut, outDistArray, outTimeArray] = Iteration( agentsArray, wallArray, distArray , timeArray)
%	Funktion ruft die Funktion logicFunction auf
%   Muss mit einer Priorit�tenliste auf alle Agents ausgeweitet werden
%   distArray: Speichere die zur�ckgelegte Wegl�nge eines Agents wenn er
%   gel�scht wird

    global INFLUENCESPHERE PRECISIONCOLLISION DELTAT YSPT1 YSPB2
    
    dist = linspace(0,1,PRECISIONCOLLISION);
    topOut=0;
    botOut=0;
    prioArray = getPriorityArray(agentsArray);
    sortedPrioArray = getSortedPriorityArray(prioArray);  
    lenSort = length(sortedPrioArray);
    lenWall = length(wallArray);
    
    for k = sortedPrioArray
        angleShift = logicFunction(agentsArray, k, INFLUENCESPHERE, prioArray, wallArray);
        
        %Kollisionstest        
        xCordNeu = agentsArray(k).cordX + sin(angleShift) * DELTAT * agentsArray(k).maxSpeed * dist;
        yCordNeu = agentsArray(k).cordY + cos(angleShift) * DELTAT * agentsArray(k).maxSpeed * dist;
        distMat = zeros(lenSort+lenWall,PRECISIONCOLLISION+1);
        for l = sortedPrioArray
            if (((agentsArray(k).cordX - agentsArray(l).cordX)^2 + (agentsArray(k).cordY - agentsArray(l).cordY)^2) > (INFLUENCESPHERE * INFLUENCESPHERE)) || (l == k)
                continue
            end
            distMat(l,:) = [(sqrt((xCordNeu - agentsArray(l).cordX).^2 + (yCordNeu - agentsArray(l).cordY).^2) - agentsArray(k).radius - agentsArray(l).radius),-1]; %-1 als Sentinel                      
        end
        for l = (lenSort+1):(lenSort+lenWall)
            lneu = l-lenSort;
            if (((agentsArray(k).cordX - wallArray(lneu).cordX)^2 + (agentsArray(k).cordY - wallArray(lneu).cordY)^2) < (INFLUENCESPHERE * INFLUENCESPHERE))
                distMat(l,:) = [(sqrt((xCordNeu - wallArray(lneu).cordX).^2 + (yCordNeu - wallArray(lneu).cordY).^2) - agentsArray(k).radius - wallArray(lneu).radius),-1]; %-1 als Sentinel                                  
            end
        end
        distMat = sort(distMat);
        
        maxL = find(distMat(1,:) < 0, 1) - 1;
        
        if maxL == 0 %  Sollte eigentlich nicht passieren, dann ist ein Fehler in der Iteration geschehen. Loesche den Agent, da er sich nicht bewegen kann, da ein anderer Agent auf seiner Position steht
            agentsArray(k).priority = 0;
            agentsArray(k).distance = 0;
            fprintf('Ein Agent ist in einer unm�glichen Position. Agent gel�scht\n')
            continue
        end
            
        %neue koordinante setzen
        agentsArray(k).distance = agentsArray(k).distance + sqrt((xCordNeu(maxL) - agentsArray(k).cordX)^2 + (yCordNeu(maxL) - agentsArray(k).cordY)^2);
        agentsArray(k).cordX = xCordNeu(maxL);
        agentsArray(k).cordY = yCordNeu(maxL);
        agentsArray(k).angle = angleShift;
        agentsArray(k).time = agentsArray(k).time + DELTAT;
        
        if (agentsArray(k).cordY < YSPB2 && agentsArray(k).maxSpeed < 0) %von oben nach unten, grenze erreicht 
           agentsArray(k).priority = 0;
           agentsArray(k).actSpeed = 0;
           %evaluateAgent(agent);
            botOut = botOut +1;
            test = find(distArray == 0,1);
            if size(test,2) == 0
                fprintf('Distanzarray ist zu kurz\n')
            else
                distArray(test) = agentsArray(k).distance;
            end
            test = find(timeArray == 0,1);
            if size(test,2) == 0
                fprintf('Distanzarray ist zu kurz\n')
            else
                timeArray(test) = agentsArray(k).time;
            end
            agentsArray(k).time = 0;
            agentsArray(k).distance = 0;
            prioArray = getPriorityArray(agentsArray);
        elseif(agentsArray(k).cordY > YSPT1 && agentsArray(k).maxSpeed > 0) %von unten nach oben, grenze erreicht
           agentsArray(k).priority = 0;
           agentsArray(k).actSpeed = 0;
           %evaluateAgent(agent);
           topOut = topOut + 1;
            test = find(distArray == 0,1);
            if size(test,2) == 0
                fprintf('Distanzarray ist zu kurz\n')
            else
                distArray(test) = agentsArray(k).distance;
            end
            test = find(timeArray == 0,1);
            if size(test,2) == 0
                fprintf('Distanzarray ist zu kurz\n')
            else
                timeArray(test) = agentsArray(k).time;
            end
            agentsArray(k).time = 0;
            agentsArray(k).distance = 0;
            prioArray = getPriorityArray(agentsArray);
        else
            agentsArray(k).actSpeed = agentsArray(k).maxSpeed() * (maxL - 1) / (PRECISIONCOLLISION - 1);
        end
    end    
    
    outTimeArray = timeArray;
    outDistArray = distArray;
end

     