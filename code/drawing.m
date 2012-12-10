%This class can draw the current agent positions onto a graph. The agents
%are simplified as cyrcles. Every agent has another line indicator which is
%the speed and the angle of its movement.

%The drawing class contains the reference to the array of agents. It also
%generates the wall agents direct in its contructor.

classdef drawing < handle
    properties(SetAccess = public, GetAccess = public)
        %Details about this plot
        title = 'Plot';             %not implemented    
        xAxisTitle = 'xAxis';       %not implemented
        yAxisTitle = 'yAxis';       %not implemented
        xStretchFactor = 5;         %stretches the x-axis to get a better overwiew
        
        %care: if stretched, the cycles will apear as an oval!
        
        
        particleDensity = 10;       %wall agent density
        wallRadius = 0.005;         %diameter of the wall = 2x wallRadius
        drawP = 1;                  %P = Direction of Attraction =)

        %Field definitions:
        width = 2.8;                %in meters         
        length = 30;                %in meters
        wallDia = 0.05;             %in meters 
        
        %Note difference beween wallDia and wallRadius:
        %Radius is used for the agents, diameter for the drawing of the 
        %wall.
        
        %the spawn-zone:
        
        %we need this zone because otherwise agents could be spawned direct
        %on top of arriving agents from the other side.
        spawnZoneDistanceTop = 2.5; %in meters
        spawnZoneDistanceBot = 2.5; %in meters
        
        %Data
        wallArray;              %reference to the wall agents
        agentArray;             %reference to the agents
        
        %Testdata
        %Used to test the drawing 
        testAgents;
        testWall;
        activateTesting = 0;
    end
    
    
    methods
        %Constructor
        %Function: Creates a new drawing object. For this task,
        %several global constants are loaded into the object.
        %Also creates random agents if the testing mode is activated.
        %Variables:
        %   Object  - the object of this instance (matlab specific)
        function obj = drawing()
            
            %Setup the Playfield
            global YSPT2 YSPT1 YSPB1 YSPB2 WIDTH
            obj.width = WIDTH;
            obj.length = YSPT2;
            obj.spawnZoneDistanceTop = YSPT2 - YSPT1;
            obj.spawnZoneDistanceBot = YSPB2 - YSPB1;
            
            %Create testagents
            if(obj.activateTesting)
                obj.testAgents = agent.empty(200,0);
                
               for k=1:200
                   obj.testAgents(k)= agent(0.25,obj.width*rand(),obj.length*rand(),10000,1);
                   
               end
              obj.agentArray = obj.testAgents;      
               
            end
            createWall(obj);
        end
        
        %Set the agents
        function obj = set.agentArray(obj, value)
            obj.agentArray = value;
        end
        
        %Set the wall
        function obj = set.wallArray(obj, value)
            obj.wallArray = value;
        end
        
    end
    
    methods(Access = public)
        
        
        %Function: This Function creates the wall dummy - agents
        %The positioning and the ammount are dynamicaly calculated based on
        %the particle density (constant)
        %Variables:
        %   Object  - the object of this instance (matlab specific)
        function obj = createWall(obj)
            obj.wallArray = agent.empty(2*obj.length*obj.particleDensity,0);
            for k=1:(obj.length*obj.particleDensity)
                %left wall
               obj.wallArray(2*k-1)= agent(obj.wallRadius,0,((k-1)/obj.particleDensity),0,0);
               obj.wallArray(k*2)...
               = agent(obj.wallRadius,obj.width,((k-1)/obj.particleDensity),0,0);
            end%end create wall
        end

        
        %Function: This function plots one timestep onto the selected graph.
        %To create an animation call this function in a for loop and
        %implement some agent logic. (for an example implementation see simulation.m ->
        %the run function.
        %Variables:
        %   Object  - the object of this instance (matlab specific)
        function obj= plotStep(obj)

            %Clear the graph window
            clf;
            
            
            sizeA = size(obj.agentArray,2); %Determine the size of the agent array
            sizeW = size(obj.wallArray,2);  %Determine the size of the wall agent array
            if obj.activateTesting
                sizeA
                sizeW
            end
            %1 = X coordinates
            %2 = Y coordinates
            %3 = color
            
            %For wall painting use this:
            %coords = zeros(sizeA+ sizeW,4);          
            for i = 1:sizeA
                 if(sign(obj.agentArray(i).maxSpeed) == -1)
                    color = 'blue';
                else
                    color = 'red';
                 end
                 
                %Draw only if the priority of the agent != 0
                %Priority 0 means that this agent is inactive, 
                %see agent.m
                if(obj.agentArray(i).priority ~= 0)
                circlePlot(obj, obj.agentArray(i).cordX,...
                   obj.agentArray(i).cordY,...
                   obj.agentArray(i).radius,...
                   color);
               
               
               %Draw the direction indicator lines
               %The line is longer if the agent is faster and points to the
               %direction the specific agent wants to move.
               if(obj.drawP == 1)
                   drawLine(obj, obj.agentArray(i).cordX,...
                       obj.agentArray(i).cordY,...
                       obj.agentArray(i).cordX+...
                       sin(obj.agentArray(i).angle)*obj.agentArray(i).actSpeed,...
                       obj.agentArray(i).cordY+...
                       cos(obj.agentArray(i).angle)*obj.agentArray(i).actSpeed);
               end
              end
            end
            
            
%             for i = (sizeA+1):(sizeA+sizeW)
%                 coords(i,1)=obj.wallArray(i-sizeA).cordX;	
%                 coords(i,2)=obj.wallArray(i-sizeA).cordY;
%             end
%             
           
            %Setup the graph window: This is matlab specific code and has
            %nothing to do with the implementation.
            xlim([0,obj.width]) 
            ylim([0,obj.length])
            daspect([1,obj.xStretchFactor,1]) %stretch the window
            
            %The wall drawing:
            drawWallSquares(obj, obj.width, obj.length, obj.wallDia);
            
            %Draw start and end lines:
            %Line at the bottom
            drawLine(obj, 0+obj.wallDia...
                , obj.spawnZoneDistanceBot, obj.width- obj.wallDia, ...
               obj.spawnZoneDistanceBot);
           
           %Line at the top
           drawLine(obj, 0+obj.wallDia...
                , obj.length-obj.spawnZoneDistanceTop, obj.width- obj.wallDia, ...
               obj.length-obj.spawnZoneDistanceTop);
        end

    end
    
     %Those methods are simple function calls from the matlab api to 
     %draw all the geometric shapes:
     methods(Access = private)        
         
                 
        %Function:  Draws side wall squares with the given parameters
        %Variables:
        %   width   - the width of the field
        %   height  - the height of the field
        %   wallDi..- the desired wall diameter
        %   Object  - the object of this instance (matlab specific)
        function obj = drawWallSquares(obj, width, height, wallDiameter)
            rectangle('Position',[0,0,...
                wallDiameter,height],...
               'FaceColor','black');
           
           rectangle('Position',[width-wallDiameter,0,...
                wallDiameter,height],...
               'FaceColor','black');
        end
        
        %Function: Draws a circle with the given parameters
        %Variables:
        %   x       - the x coordinate of the center
        %   y       - the y coordinate of the center
        %   radius  - the radius of the circle
        %   color   - fill color of the circle
        %   Object  - the object of this instance (matlab specific)
        function obj = circlePlot(obj,x, y, radius, color)
            rectangle('Position',[x-(radius),y-(radius),...
                radius*2,radius*2],...
               'Curvature',[1,1],...
               'FaceColor',color);
        end
      
        %Function:   draws a single line with the given parameters
        %Variables:
        %   x1      -x coordinate of endpoint 1
        %   y1      -y coordinate of endpoint 1
        %   x2      -x coordinate of endpoint 2
        %   y2      -y coordinate of endpoint 2
        %   Object  - the object of this instance (matlab specific)
        function obj = drawLine(obj, x1,y1, x2,y2)
           array = [x1,y1;x2,y2];
           line(array(:,1),array(:,2), [0;0],'Color','black', ...
               'LineWidth', 2);
          % get(l)
        end
        
        
     end
end

