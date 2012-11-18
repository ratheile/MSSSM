function [ xOut ] = xValuesLogic( indexX, distance, betaLeft, betaRight, diffVelocity, radiusSum )
%   Berechnet die Werte für die Berechnung der Richtung
    
    global XVALUES HEIGHT SLOPEFACTOR ANGLE
    
    if diffVelocity < 0
        alphaX = XVALUES(indexX);
        xOut = 1./(abs(XVALUES - alphaX).^(-diffVelocity/SLOPEFACTOR)); %Zentrierung um alphaX
        
        [~,indLeft] = closest(ANGLE, betaLeft);
        [~,indRight] = closest(ANGLE, betaRight);
        [~,indLeftS] = closest(ANGLE, betaLeft - pi/18); %pi/18 willkürlich gewählt. Könnte man auch abhängig vom Abstand der beiden Agenten zueinander machen
        [~,indRightS] = closest(ANGLE, betaRight + pi/18);
        
        xOut = (xOut - min(xOut));
        xOut(indLeft:indRight) = 0;
        
        xOut = xOut * HEIGHT / max(xOut) * radiusSum / distance;        
        
        xOut(indLeftS:indLeft) = linspace(xOut(indLeftS),0,(indLeft-indLeftS+1));
        xOut(indRight:indRightS) = linspace(0,xOut(indRightS),(indRightS-indRight+1));

    elseif diffVelocity > 0
        alphaX = XVALUES(indexX);
        xOut = gaussmf(XVALUES, [radiusSum/distance alphaX]) * diffVelocity * HEIGHT * radiusSum/distance;
        
    else
        xOut = zeros(1,length(XVALUES));
        
    end
        
   
    
    
end


