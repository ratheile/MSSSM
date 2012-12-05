function [ xOut ] = xWallLogic(distance, betaLeft, betaRight, radius)                
%	xWallLogic calculates and returns the values for the repulsive strength and angle of an wall agent to an agent specified by distance, betaLeft und betaRight. Radius is the radius of the agent in question. See documentation for a visualisation of the setup

    global XVALUES WALLFACTOR ANGLE WALLANGLEOFFSET
    
    xOut = zeros(1, length(XVALUES));
    
    [~,indLeft] = closest(ANGLE, betaLeft);
    [~,indRight] = closest(ANGLE, betaRight);
    [~,indLeftS] = closest(ANGLE, betaLeft - WALLANGLEOFFSET); 
    [~,indRightS] = closest(ANGLE, betaRight + WALLANGLEOFFSET);
    
    xOut(indLeft:indRight) = WALLFACTOR / (distance - radius); 

    xOut(indLeftS:indLeft) = linspace(0, xOut(indLeft), (indLeft-indLeftS+1));
    xOut(indRight:indRightS) = linspace(xOut(indRight), 0, (indRightS-indRight+1));

end

