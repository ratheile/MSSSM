function [betaLeft, betaRight] = getBeta(radiusSum, alpha, distance)
%getBeta: For two agents: for given radii, angle alpha (direction of other agent wrt. x-Axis) and the distance between, this function calculates the angles outside. See documentation for the derivation and exact meaning of alpha, betaLeft, betaRight and gamma
    
    gamma = acos(radiusSum / distance);
    betaRight = pi - (gamma + alpha);   %betaRight = pi/2 - (gamma + alpha - pi/2);
    betaLeft = - alpha + gamma;         %betaLeft = pi/2 - (pi/2 + alpha - gamma);

end