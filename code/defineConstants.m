function [] = Untitled10()
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
%Definition von Konstanten

    global ANGLE GAUSSANGLE XSCOPE XRES XVALUES DELTAT
    XSCOPE = 100;
    XRES = 0.01;%Definiert die möglichen Winkel für die Logikfunktion
    XVALUES = -XSCOPE:XRES:XSCOPE;
    breite = 10; %sigma der Gaussfunktion
    GAUSSANGLE = gaussmf(XVALUES,[breite 0]);
    ANGLE = atan(XVALUES);
    DELTAT = 0.1; %Iterationsschritte in Sekunden


end

