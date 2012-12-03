classdef agent < handle
    %AGENT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties(GetAccess = public, SetAccess = public)
       radius % Gr�sse des Agents in Meter
       cordX %Momentane X Koordinate in Meter
       cordY %Momentane Y Koordinate in Meter
       maxSpeed %Maximale Geschwindigkeit des Agents in Meter pro Sekunde. + heisst nach oben, - nach unten
       actSpeed %Aktuelle Geschwindigkeit des Agents in Meter pro Sekunde
       priority %Priorit�t des Agents; in welcher Reihenfolge er sp�ter iteriert wird
    end
     
       
    
    methods(Access = public)
        function obj = agent(radius, cordX, cordY, maxSpeed, priority) %Konstruktor 
            obj.radius = radius;
            obj.cordX = cordX;
            obj.cordY = cordY;
            obj.maxSpeed = maxSpeed;
            obj.actSpeed = maxSpeed;
            obj.priority = priority;
        end
        
    end
    
end
