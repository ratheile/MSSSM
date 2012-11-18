function [betaLeft, betaRight] = getBeta(radiusSum, alpha, distance)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here

    gamma = acos(radiusSum / distance);
    betaRight = pi/2 - (gamma + alpha - pi/2);
    betaLeft = pi/2 - (pi/2 + alpha - gamma);

end

