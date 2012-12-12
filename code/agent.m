classdef agent < handle
%   The class agent represents the agents used in the simulation. An agent
%   is basically a container for all properties an agent needs to interact
%   with other agents.
%
%   A short explanation is given behind each property. See the
%   documentation for a more complete descrition of them.
%
%   The first six properties are crucial for the success of the simulation.
%   The latter three are used for monitoring and analysis.
    
    properties(GetAccess = public, SetAccess = public)
       radius   %   "Size"(radius) of an agent
       cordX    %	Actual x-coordinate
       cordY 	%	Actual y-coordinate
       maxSpeed %	Maximal velocity the agent wants to reach. + mean walking up, - walking down.
       actSpeed %	Actual velocity
       priority %	Priority of the agent. Determines the order of evalutation during the iteration. 0 for inactive agents

       angle    %	Angle of sight, given by the logic functions
       distance %   Covered distance of an agent during his lifetime
       time     % 	Time an agent spends in the simulation
    end
     
       
    
    methods(Access = public)
        function obj = agent(radius, cordX, cordY, maxSpeed, priority) % Construktor 
            obj.radius = radius;
            obj.cordX = cordX;
            obj.cordY = cordY;
            obj.maxSpeed = maxSpeed;
            obj.actSpeed = maxSpeed;
            obj.priority = priority;
            obj.angle = 0;
            obj.distance = 0;
            obj.time = 0;
        end
        
        function obj = reset(obj)
            obj.distance = 0; %reset distance
        end
        
    end
    
end
