function [] = defineConstants()
%defineConstants defines all global constants that will be used later

    global ANGLE GAUSSANGLE XSCOPE XRES XVALUES DELTAT HEIGHT SLOPEFACTOR WALLFACTOR AGENTANGLEOFFSET WALLANGLEOFFSET INFLUENCESPHERE PRECISIONCOLLISION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Name & Value......................value.Description........................
    XSCOPE = 20;                    % 20    how far one looks to the sides
    XRES = 0.001;                   % 0.001 x-resolution, possible angles for logical functions
    XVALUES = -XSCOPE:XRES:XSCOPE;  % ntbc* generate all possible x-values
    breite = 1;                     % 1     standard deviation of Gaussian function
                                    % determines the tendency to walk straightforwards
    GAUSSANGLE = gaussmf(XVALUES,[breite 0]); % ntbc* generate Gaussian function for direction
    ANGLE = atan(XVALUES);          % ntbc* calculate angular values for Gaussian function
    DELTAT = 0.1;                   % 0.1   iteration steps in seconds
    HEIGHT = 0.4;                   % 0.4   normalization factor in logical calculations for agents
    SLOPEFACTOR = 8;                % 8     parameter for other agents' influence
    WALLFACTOR = -5;                % -5    parameter for walls' influence
    AGENTANGLEOFFSET = pi/18;       % pi/18 offset angle in angle calculations for agents
    WALLANGLEOFFSET = pi/18;        % pi/18 offset angle in angle calculations for walls
    INFLUENCESPHERE = 5;            % 5     how far an agents "looks", in meters
    PRECISIONCOLLISION = 31;        % 31    numerical precision for collision detection
    % *: ntbc = not to be changed!
end

