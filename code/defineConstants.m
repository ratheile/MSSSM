function [] = defineConstants()
%defineConstants defines all global constants that will be used later

    global ANGLE GAUSSANGLE XSCOPE XRES XVALUES DELTAT HEIGHT SLOPEFACTOR WALLFACTOR AGENTANGLEOFFSET WALLANGLEOFFSET INFLUENCESPHERE PRECISIONCOLLISION SPEED
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Name & Value......................value.Description........................
    XSCOPE = 100;                    % 20    how far one looks to the sides
    XRES = 0.005;                   % 0.001 x-resolution, possible angles for logical functions
    XVALUES = -XSCOPE:XRES:XSCOPE;  % ntbc* generate all possible x-values
    breite = 1;                     % 1     standard deviation of Gaussian function
                                    % determines the tendency to walk straightforwards
    GAUSSANGLE = gaussmf(XVALUES,[breite 0]); % ntbc* generate Gaussian function for direction
    ANGLE = atan(XVALUES);          % ntbc* calculate angular values for Gaussian function
    DELTAT = 0.03;                   % 0.1   iteration steps in seconds
    HEIGHT = 3;                   % 0.4   normalization factor in logical calculations for agents
    SLOPEFACTOR = 12;                % 8     parameter for other agents' influence
    WALLFACTOR = -0.01;                % -5    parameter for walls' influence
    AGENTANGLEOFFSET = pi/12;       % pi/18 offset angle in angle calculations for agents
    WALLANGLEOFFSET = pi/20;        % pi/18 offset angle in angle calculations for walls
    INFLUENCESPHERE = 2;            % 5     how far an agents "looks", in meters
    PRECISIONCOLLISION = 4;        % 31    numerical precision for collision detection
    
    SPEED = 0.01; %Wartezeit in Sekunden für das Abspielen zweier Schritte
    % *: ntbc = not to be changed!
end

