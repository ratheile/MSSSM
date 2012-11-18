function [ xOut ] = xWallLogic(distance, betaLeft, betaRight, radius)                
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    global XVALUES WALLFACTOR ANGLE WALLANGLEOFFSET
    
    xOut = zeros(1, length(XVALUES));
    
    [~,indLeft] = closest(ANGLE, betaLeft);
    [~,indRight] = closest(ANGLE, betaRight);
    [~,indLeftS] = closest(ANGLE, betaLeft - WALLANGLEOFFSET); %pi/18 willkürlich gewählt. Könnte man auch abhängig vom Abstand der beiden Agenten zueinander machen
    [~,indRightS] = closest(ANGLE, betaRight + WALLANGLEOFFSET);
    
    xOut(indLeft:indRight) = WALLFACTOR / (distance - radius);

    xOut(indLeftS:indLeft) = linspace(0, xOut(indLeft), (indLeft-indLeftS+1));
    xOut(indRight:indRightS) = linspace(xOut(indRight), 0, (indRightS-indRight+1));

end

