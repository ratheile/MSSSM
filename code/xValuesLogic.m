function [ xOut ] = xValuesLogic( indexX, distance, betaLeft, betaRight, diffVelocity )
%   Berechnet die Werte für die Berechnung der Richtung
    
    global XVALUES HEIGHT SLOPEFACTOR ANGLE
    
    alphaX = XVALUES(indexX);
    xOut = 1./(abs(XVALUES - alphaX).^(-diffVelocity/SLOPEFACTOR)); %Zentrierung um alphaX
    xOut = (xOut - min(xOut));
    
    [~,indLeft] = closest(ANGLE, betaLeft);
    [~,indRight] = closest(ANGLE, betaRight);
    [~,indLeftS] = closest(ANGLE, betaLeft - pi/18);
    [~,indRightS] = closest(ANGLE, betaRight + pi/18); 
    
    xOut(indLeft:indRight) = 0;
    xOut(indLeftS:indLeft) = linspace(xOut(indLeftS),0,(indLeft-indLeftS+1));
    xOut(indRight:indRightS) = linspace(0,xOut(indRightS),(indRightS-indRight+1));
    
    xOut = xOut * HEIGHT / max(xOut);
    
    
end

