function [  ] = spawn( agentArray, position )
%SPAWN function that generates values for new spawned agents
% For given agentArray and information whether to spawn on bottom or top, 
% this function calculates the initial values for a new spawned agent.
% position - takes value 1 (spawn at bottom) or -1 (spawn at top)

global MEANRADIUS STDRADIUS MEANSPEED STDSPEED WIDTH YSPB1 YSPT2 REP
% MEANRADIUS, STDRADIUS - for Gaussian for radius
% MEANSPEED, STDSPEED - for Gaussian for speed
% WIDTH is the width of the corridor, YSP(b/t)(1/2) are the y-coordinates
% of the spawning fields, b=the bottom ones, t=the top ones, both numbered
% from bottom to top (which means, YSPB1=0, then +spawning height=YSPB2, then
% +length of corridor=YSPT1, and +spawning height=YSPT2
% Here we only use the lower boundary (YSPB1) and the top boundary (YSPT2)
% REP; #of tries to spawn the agent (if always collision, don't spawn him)

priorityArray = getPriorityArray(agentArray);
sortedPriorityArray = getSortedPriorityArray(priorityArray);
index = find(priorityArray==0,1); %position of empty agent slot in agentArray
    if (size(index,2)~=0) %if agentArray is not full.
    
    % Generate radius with MEANRADIUS, STDRADIUS and a Gaussian
    % distribution
        radius=4*STDRADIUS;
        while (abs(radius)>(3*STDRADIUS))
            radius=normrnd(0,STDRADIUS);
        end %while
        radius=MEANRADIUS+radius;
    
        %y-coordinate
        if position==-1
            ycoord=YSPT2;
        else
            ycoord=YSPB1;
        end %if-else-ycoord.
    
        %x-coordinate
        distMat = zeros(1,length(sortedPriorityArray));
        if size(distMat,2) == 0 %Kein Agent vorhanden
            xcoord=(WIDTH-2*radius)*rand(1)+radius;
            speed=4*STDSPEED;
            while (abs(speed)>(3*STDSPEED))
                speed=normrnd(0,STDSPEED);
            end %while
            speed=position*(MEANSPEED+speed);
            
            agentArray(index).cordX = xcoord;
            agentArray(index).cordY = ycoord;
            agentArray(index).maxSpeed = speed;
            agentArray(index).actSpeed = speed;
            agentArray(index).radius = radius;
            agentArray(index).priority = rand(1);
            while (agentArray(index).priority == 0) %Damit priority sicher nicht 0 ist
                agentArray(index).priority = rand(1);
            end
        else
                       
            for count=1:REP 
                xcoord=(WIDTH-2*radius)*rand(1)+radius;
                for k = sortedPriorityArray
                    distMat(k) = sqrt((ycoord - agentArray(k).cordY)^2 + (xcoord - agentArray(k).cordX)^2) - agentArray(k).radius - radius;
                end
                distMat = sort(distMat);
                if (distMat(1) >= 0)
                    break
                elseif (count ~= REP)
                    continue
                else
                    'No agent spawned'
                    return
                end
            end
    
            if (distMat(1) >= 0)       
            %Generate velocity with MEANSPEED, STDSPEED and position (move up
            %or down!) and a Gaussian distribution
                speed=4*STDSPEED;
                while (abs(speed)>(3*STDSPEED))
                    speed=normrnd(0,STDSPEED);
                end %while
                speed=position*(MEANSPEED+speed);
            
                agentArray(index).cordX = xcoord;
                agentArray(index).cordY = ycoord;
                agentArray(index).maxSpeed = speed;
                agentArray(index).actSpeed = speed;
                agentArray(index).radius = radius;
                agentArray(index).priority = rand(1);
                while (agentArray(index).priority == 0) %Damit priority sicher nicht 0 ist
                    agentArray(index).priority = rand(1);
                end
            end %if kollisionsabfrage
        end %if size
    else
        'Warning: Agent array is full'
    end %if
    agentArray(index)
end %Function