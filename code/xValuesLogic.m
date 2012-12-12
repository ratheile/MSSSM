function [ xOut ] = xValuesLogic( indexX, distance, betaLeft, betaRight, diffVelocity, radiusSum , isMoving )
%   Berechnet die Werte für die Berechnung der Richtung
%  Calculates the values for the calculation of the direction    
    global XVALUES HEIGHT SLOPEFACTOR ANGLE AGENTANGLEOFFSET REPULSIONAGENT STANDOFF
    
    if isMoving == 0 && abs(diffVelocity) < 0.2    %Agents bleiben beide stehen (ungefähr)
        diffVelocity = STANDOFF;
    end
    
    if diffVelocity < 0
        alphaX = XVALUES(indexX);
        xOut = 1./(abs(XVALUES - alphaX).^(-diffVelocity/SLOPEFACTOR)); %Zentrierung um alphaX
        
        [~,indLeft] = closest(ANGLE, betaLeft);
        [~,indRight] = closest(ANGLE, betaRight);
        [~,indLeftS] = closest(ANGLE, betaLeft - AGENTANGLEOFFSET);
        [~,indRightS] = closest(ANGLE, betaRight + AGENTANGLEOFFSET);
        
        xOut = (xOut - min(xOut));
        xOut(indLeft:indRight) = 0;
        
        if isMoving == 1
            xOut = xOut * HEIGHT / max(xOut) * (-diffVelocity) * (radiusSum / distance)^REPULSIONAGENT;        
        else
            xOut = xOut * HEIGHT / max(xOut) * (radiusSum / distance)^REPULSIONAGENT;        
        end
            
        xOut(indLeftS:indLeft) = linspace(xOut(indLeftS),0,(indLeft-indLeftS+1));
        xOut(indRight:indRightS) = linspace(0,xOut(indRightS),(indRightS-indRight+1));

    elseif diffVelocity > 0
        alphaX = XVALUES(indexX);
        xOut = gaussmf(XVALUES, [radiusSum/distance alphaX]) * diffVelocity * HEIGHT/5 * radiusSum/distance;
        
    else
        xOut = zeros(1,length(XVALUES));    %Agents laufen gleich schnell
        
    end
        
end


