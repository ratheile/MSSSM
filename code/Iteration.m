function [] = Iteration( agentsArray, wallArray )
%	Funktion ruft die Funktion logicFunction auf
%   Muss mit einer Prioritätenliste auf alle Agents ausgeweitet werden

    global INFLUENCESPHERE PRECISIONCOLLISION DELTAT
    
    dist = linspace(0,1,PRECISIONCOLLISION);
    
    prioArray = getPriorityArray(agentsArray);
    sortedPrioArray = getSortedPriorityArray(prioArray);    
    
    for k = sortedPrioArray
        angleShift = logicFunction(agentsArray, k, INFLUENCESPHERE, prioArray, wallArray);
        
        %Kollisionstest        
        %yCordOld = agentsArray(k).cordY;
        xCordNeu = agentsArray(k).cordX + sin(angleShift) * DELTAT * agentsArray(k).maxSpeed * dist;
        yCordNeu = agentsArray(k).cordY + cos(angleShift) * DELTAT * agentsArray(k).maxSpeed * dist;
        distMat = zeros(length(sortedPrioArray)-1+length(wallArray),PRECISIONCOLLISION+1);
        for l = sortedPrioArray
            if l == k
                continue
            end
            distMat(l,:) = [(sqrt((xCordNeu - agentsArray(l).cordX)^2 + (yCordNeu - agentsArray(l).cordY)^2) - agentsArray(k).radius - agentsArray(l).radius),-1]; %-1 als Sentinel                      
        end
        for l = 1:length(wallArray)
            distMat(l,:) = [(sqrt((xCordNeu - wallArray(l).cordX)^2 + (yCordNeu - wallArray(l).cordY)^2) - agentsArray(k).radius - wallArray(l).radius),-1]; %-1 als Sentinel                                  
        end
        distMat = sort(distMat);
        
        maxL = find(distMat(1,:) < 0, 1) - 1;
        if maxL == 0% Sollte eigentlich nicht geschehen
            maxL = 1;
        end
        agentsArray(k).cordX = xCordNeu(maxL);
        agentsArray(k).cordY = yCordNeu(maxL);
        agentsArray(k).actSpeed = agentsArray(k).maxSpeed() * (maxL - 1) / (PRECISIONCOLLISION - 1);
        
    end    


end

     