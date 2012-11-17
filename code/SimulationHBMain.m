% Main File


%Definition von Konstanten
XSCOPE = 20;
XRES = 0.01;%Definiert die möglichen Winkel für die Logikfunktion
XVALUES = -XSCOPE:XRES:XSCOPE;
GAUSSANGLE = gaussmf(XVALUES,[1 0]);
ANGLE = atan(XVALUES);
