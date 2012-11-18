function [] = defineConstants()
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
%Definition von Konstanten

    global ANGLE GAUSSANGLE XSCOPE XRES XVALUES DELTAT HEIGHT SLOPEFACTOR WALLFACTOR AGENTANGLEOFFSET WALLANGLEOFFSET INFLUENCESPHERE PRECISIONCOLLISION
    XSCOPE = 20;
    XRES = 0.001;%Definiert die möglichen Winkel für die Logikfunktion
    XVALUES = -XSCOPE:XRES:XSCOPE;
    breite = 1; %sigma der Gaussfunktion
    GAUSSANGLE = gaussmf(XVALUES,[breite 0]);
    ANGLE = atan(XVALUES);
    DELTAT = 0.1; %Iterationsschritte in Sekunden
    HEIGHT = 0.4; %Normierung bei der Berechnung der Logik
    SLOPEFACTOR = 8;
    WALLFACTOR = -5; %Faktor in der Stärke der Berechnung der Wand
    AGENTANGLEOFFSET = pi/18; %Offsetwinkel bei der Winkelberechnung für Agents
    WALLANGLEOFFSET = pi/18; %Offsetwinkel bei der Winkelberechung für Wand
    INFLUENCESPHERE = 5;
    PRECISIONCOLLISION = 31;
    
end

