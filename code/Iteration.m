function [topOut,botOut] = Iteration( agentsArray, wallArray )
%	Funktion ruft die Funktion logicFunction auf
%   Muss mit einer Prioritätenliste auf alle Agents ausgeweitet werden

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
            if l == k
                continue
            end
            distMat(l,:) = [(sqrt((xCordNeu - agentsArray(l).cordX).^2 + (yCordNeu - agentsArray(l).cordY).^2) - agentsArray(k).radius - agentsArray(l).radius),-1]; %-1 als Sentinel                      
        end
        for l = (lenSort+1):(lenSort+lenWall)
            lneu = l-lenSort;
            distMat(l,:) = [(sqrt((xCordNeu - wallArray(lneu).cordX).^2 + (yCordNeu - wallArray(lneu).cordY).^2) - agentsArray(k).radius - wallArray(lneu).radius),-1]; %-1 als Sentinel                                  
        end
        distMat = sort(distMat);
        
        maxL = find(distMat(1,:) < 0, 1) - 1;
        if maxL == 0% Sollte eigentlich nicht geschehen
            maxL = 1;
        end
        
        %neue koordinante setzen
        agentsArray(k).cordX = xCordNeu(maxL);
        agentsArray(k).cordY = yCordNeu(maxL);
        
        if ((agentsArray(k).cordY < YSPB2 && agentsArray(k).maxSpeed < 0)) %von oben nach unten, grenze erreicht 
           agentsArray(k).priority = 0;
           agentsArray(k).actSpeed = 0;
            botOut = botOut +1;
        elseif(agentsArray(k).cordY > YSPT1 && agentsArray(k).maxSpeed > 0)) %von unten nach oben, grenze erreicht
           agentsArray(k).priority = 0;
           agentsArray(k).actSpeed = 0;
           topOut = topOut + 1;
        else
            agentsArray(k).actSpeed = agentsArray(k).maxSpeed() * (maxL - 1) / (PRECISIONCOLLISION - 1);
        end
    end    


end

     