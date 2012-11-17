classdef agent
    %AGENT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties(GetAccess = public, SetAccess = private)
       radius % Grösse des Agents
       cordX %Momentane X Koordinate
       cordY %Momentane Y Koordinate
       maxSpeed %Maximale geschwidigkeit des Agents
    end
    
    methods(Access = public)
        function obj=agent(maxSpeed, radius)
            obj.maxSpeed = maxSpeed;
            obj.radius = radius;
        end
    end
    
    
    methods(Access = private)
        function privateFunct(da)
        end
    end
    
    
    
end
