classdef agent < handle
    %AGENT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties(GetAccess = public, SetAccess = public)
       radius % Grösse des Agents in Meter
       cordX %Momentane X Koordinate in Meter
       cordY %Momentane Y Koordinate in Meter
       maxSpeed %Maximale Geschwindigkeit des Agents in Meter pro Sekunde. + heisst nach oben, - nach unten
       actSpeed %Aktuelle Geschwindigkeit des Agents in Meter pro Sekunde
       priority %Priorität des Agents; in welcher Reihenfolge er später iteriert wird
       angle %Winkel, in die ein Agent schaut (für gewisse graphische Darstellungen, 
       distance %zurückgelegter weg
    end
     
       
    
    methods(Access = public)
        function obj = agent(radius, cordX, cordY, maxSpeed, priority) %Konstruktor 
            obj.radius = radius;
            obj.cordX = cordX;
            obj.cordY = cordY;
            obj.maxSpeed = maxSpeed;
            obj.actSpeed = maxSpeed;
            obj.priority = priority;
            obj.angle = 0;
            obj.distance = 0;
        end
        
        function obj = reset(obj)
            obj.distance = 0; %reset distance
        end
        
    end
    
end
