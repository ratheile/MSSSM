
  

%DRAWING Summary of this class goes here
%This class draws an environment it contains only
%graphical drawing, no agent logic
%   Detailed explanation goes here

classdef drawing < handle
    properties(SetAccess = public, GetAccess = public)
        title = 'Plot';
        xAxisTitle = 'xAxis';
        yAxisTitle = 'yAxis';
        xStretchFactor = 5;
        
        
        particleDensity = 10;
        wallRadius = 0.005;
        

        width = 2.8;
        length = 30;
        wallDia = 0.05;
        
        spawnZoneDistanceTop = 2.5;
        spawnZoneDistanceBot = 2.5;
        
        %Data
        wallArray;
        agentArray;
        
        %Testdata
        testAgents;
        testWall;
        
        activateTesting = 0;
    end
    
    
    methods
        %Constructor
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
            
            %create the wall
            
            
            
            obj.wallArray = agent.empty(2*obj.length*obj.particleDensity,0);
            for k=1:(obj.length*obj.particleDensity)
                %left wall
               obj.wallArray(2*k-1)= agent(obj.wallRadius,0,((k-1)/obj.particleDensity),0,0);
               obj.wallArray(k*2)...
               = agent(obj.wallRadius,obj.width,((k-1)/obj.particleDensity),0,0);
            end%end create wall

            
            
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

        function obj= plotStep(obj)

            %Clear the graph window
            clf;
            
            
            sizeA = size(obj.agentArray,2); %size gibt 1, 200 aus
            sizeW = size(obj.wallArray,2);
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
                if(obj.agentArray(i).priority ~= 0)
                circlePlot(obj, obj.agentArray(i).cordX,...
                   obj.agentArray(i).cordY,...
                   obj.agentArray(i).radius,...
                   color);
                end
            end
            
            
%             for i = (sizeA+1):(sizeA+sizeW)
%                 coords(i,1)=obj.wallArray(i-sizeA).cordX;	
%                 coords(i,2)=obj.wallArray(i-sizeA).cordY;
%             end
%             
           
            xlim([0,obj.width])
            ylim([0,obj.length])
            daspect([1,obj.xStretchFactor,1])
            
            %The wall drawing:
            drawWallSquares(obj, obj.width, obj.length, obj.wallDia);
            
            %Draw start and end lines
            drawLine(obj, 0+obj.wallDia...
                , obj.spawnZoneDistanceBot, obj.width- obj.wallDia, ...
               obj.spawnZoneDistanceBot);
           
           drawLine(obj, 0+obj.wallDia...
                , obj.length-obj.spawnZoneDistanceTop, obj.width- obj.wallDia, ...
               obj.length-obj.spawnZoneDistanceTop);
        end

    end
    
     methods(Access = private)          
        function obj = drawWallSquares(obj, width, height, wallDiameter)
            rectangle('Position',[0,0,...
                wallDiameter,height],...
               'FaceColor','black');
           
           rectangle('Position',[width-wallDiameter,0,...
                wallDiameter,height],...
               'FaceColor','black');
        end
        
        function obj = circlePlot(obj,x, y, radius, color)
            rectangle('Position',[x-(radius),y-(radius),...
                radius*2,radius*2],...
               'Curvature',[1,1],...
               'FaceColor',color);
        end
      
        function obj = drawLine(obj, x1,y1, x2,y2)
           array = [x1,y1;x2,y2];
           line(array(:,1),array(:,2), [0;0],'Color','black', ...
               'LineWidth', 2);
          % get(l)
        end
     end
    
end

