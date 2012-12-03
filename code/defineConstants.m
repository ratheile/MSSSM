function [] = defineConstants()
%defineConstants defines all global constants that will be used later

    global ANGLE GAUSSANGLE XSCOPE XRES XVALUES DELTAT...
        HEIGHT SLOPEFACTOR WALLFACTOR AGENTANGLEOFFSET...
        WALLANGLEOFFSET INFLUENCESPHERE PRECISIONCOLLISION...
        SPEED MEANRADIUS STDRADIUS MEANSPEED STDSPEED WIDTH...
        YSPB1 YSPB2 YSPT1 YSPT2 RANDSTART REP DENSITYUP DENSITYDOWN...
        REPULSIONAGENT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Name & Value......................value.Description........................
    XSCOPE = 100;                    % 20    how far one looks to the sides
    XRES = 0.05;                   % 0.001 x-resolution, possible angles for logical functions
    XVALUES = -XSCOPE:XRES:XSCOPE;  % ntbc* generate all possible x-values
    breite = 1;                     % 1     standard deviation of Gaussian function
                                    % determines the tendency to walk straightforwards
    GAUSSANGLE = gaussmf(XVALUES,[breite 0]); % ntbc* generate Gaussian function for direction
    ANGLE = atan(XVALUES);          % ntbc* calculate angular values for Gaussian function
    
    %!!!delta t noch anpassen ist warscheinlich noch zu klein!!!
    
    DELTAT = 0.03;                   % 0.1   iteration steps in seconds
    HEIGHT = 3.5;                   % 0.4   normalization factor in logical calculations for agents
    SLOPEFACTOR = 12;                % 8     parameter for other agents' influence
    REPULSIONAGENT = 2;             % 2     parameter for the repulsion between two agents. The higher it is, the higher HEIGHT has to be
    WALLFACTOR = -0.02;                % -5    parameter for walls' influence
    AGENTANGLEOFFSET = pi/12;       % pi/18 offset angle in angle calculations for agents
    WALLANGLEOFFSET = pi/20;        % pi/18 offset angle in angle calculations for walls
    INFLUENCESPHERE = 2;            % 5     how far an agents "looks", in meters
    PRECISIONCOLLISION = 4;        % 31    numerical precision for collision detection
    
    SPEED = 0.001; %Wartezeit in Sekunden für das Abspielen zweier Schritte
    RANDSTART = 133; %Seed für die Zufallsgeneratoren
    
    MEANRADIUS = 0.25;
    STDRADIUS = 0.01;
    MEANSPEED = 1.4;
    STDSPEED = 0.05;
    WIDTH = 3;
    
    %YSPT2--------
    %YSPT1--------
    %
    %Feld hier
    %
    %YSPB2--------
    %YSPB1--------
    
    YSPB1 = 0;
    YSPB2 = 2;
    YSPT1 = 22;
    YSPT2 = 24;
    REP = 4;
    
    DENSITYUP = 0.5;        % Anzahl neue Personen aus einer Richtung pro Sekunde
    DENSITYDOWN = 0.5;      % Und nach unten
    % *: ntbc = not to be changed!
end

