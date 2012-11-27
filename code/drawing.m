classdef drawing 
    %DRAWING Summary of this class goes here
    %This class draws an environment it contains only
    %graphical drawing, no agent logic
    %   Detailed explanation goes here
    
    properties(SetAccess = public, GetAccess = public)
        title = 'Plot';
        xAxisTitle = 'xAxis';
        yAxisTitle = 'yAxis';
        
        particleDensity = 10;
        agentRadius = 0.005;
        wallRadius = 0.005;
        
        width = 5;
        length = 5;
        
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
        function obj = drawing(title, xAxisTitle, yAxisTitle)
            obj.title = title;
            obj.xAxisTitle = xAxisTitle;
            obj.yAxisTitle = yAxisTitle;
            
            %Create testagents
            if (obj.activateTesting)
                obj.testAgents = agent.empty(200,0);
                
               for k=1:200
                   obj.testAgents(k)= agent(1,obj.width*rand(),obj.length*rand(),10000,1);
                   
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
            
            
            sizeA = size(obj.agentArray,2); %size gibt 1, 200 aus
            sizeW = size(obj.wallArray,2);
            if obj.activateTesting
                sizeA
                sizeW
            end
            %1 = X coordinates
            %2 = Y coordinates
            %3 = color
            coords = zeros(sizeA+ sizeW,4);
            
            for i = 1:sizeA
                coords(i,1)=obj.agentArray(i).cordX;
                coords(i,2)=obj.agentArray(i).cordY;
                coords(i,3)=1; %Color1
                coords(i,4)=20; %Size of point
            end
            
            for i = (sizeA+1):(sizeA+sizeW)
                coords(i,1)=obj.wallArray(i-sizeA).cordX;
                coords(i,2)=obj.wallArray(i-sizeA).cordY;
                coords(i,3)=2; %Color2
                coords(i,4)=50; %Size of point
            end
            
            % Create a scatter plot of the data
            s = scatter(coords(:,1),coords(:,2),coords(:,4),...
            coords(:,3), 'filled');
            
            for i=  1:sizeA
                circlePlot(obj,coords(i,1),coords(i,2),obj.agentArray(i).radius)
            end
            xlim([0,obj.width])
            ylim([0,obj.length])
            daspect([1,1,1])
  
        end
        
        
        function circlePlot(obj, x, y, radius)
            rectangle('Position',[x-radius,y-radius,...
                radius*2,radius*2],...
            'Curvature',[1,1],...
              'FaceColor','r')
      end
    end
    
end

