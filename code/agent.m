classdef agent < handle
    %AGENT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties(GetAccess = public, SetAccess = public)
       radius % Grösse des Agents in Meter
       cordX %Momentane X Koordinate in Meter
       cordY %Momentane Y Koordinate in Meter
       maxSpeed %Maximale Geschwindigkeit des Agents in Meter pro Sekunde. + heisst nach oben, - nach unten
       priority %Priorität des Agents; in welcher Reihenfolge er später iteriert wird
    end
    
    methods(Access = public)
        function obj = agent(radius, cordX, cordY, maxSpeed, priority) %Konstruktor 
            obj.radius = radius;
            obj.cordX = cordX;
            obj.cordY = cordY;
            obj.maxSpeed = maxSpeed;
            obj.priority = priority;
        end
        function obj = addX(obj, xPlus)
           obj.cordX = obj.cordX + xPlus;                       
        end
        function obj = addY(obj, yPlus)
           obj.cordY = obj.cordY + yPlus;                       
        end
        
    end
    
end
