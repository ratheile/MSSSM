classdef simulation < handle
    %SIMULATION Summary of this class goes here
    %   Detailed explanation goes here
    
    %Vllt probleme wenn erster agent nicht gesetz ist.. schauen was
    %passiert sonst erster agent manuell setzen
    
    
    properties
        %Iteration properties
        loops = 100;
        
        
        %Objects
        draw; %Das Zeichenobjekt
        agentSize = 200; %Defaultwert 200 kann mit Funktion berechnet werden
        %Results
        
        
        %Properties
        %EVT durch globals austauschen!!
        agentMinRadius = 0.25; %Minimaler Radius von einem Agent
        agentMaxSpeed
        
    end
    
    methods
        
        %Constructor
        function obj = simulation()
        end
    end

%-----------------------------------------------------
%Public:

    methods(Access = public)
        
        
        %Wegen fehler : kann leider nicht in konstruktor 
        %ausgeführt werden - weiss nicht wie evt noch fragen
        %nächste woche!
        function obj = init(obj)
            defineConstants(); %defne all global variables
            obj.draw = drawing.empty(1,0);
            obj.draw = drawing();   %create the drawing object
            calcPossibleAgents(obj);
            obj.draw.agentArray = agent.empty(obj.agentSize ...
                ,0);
        end
        
      
        %Modusauswahl für verschidene Run Konfigurationen
        %switch case hat aus irgend einem grund nicht funktioniert.
        function obj = runMode(obj,mode)
            
            
              if (strcmp('normal', mode) == 1)
                disp('Running normal mode:');
                run(obj);
              else
                disp('unknown mode');
              end
        end
    end
    
%-----------------------------------------------------
%Private:

    methods(Access = private)
        
        %Berechnet die maximale Anzahl möglicher Agents
        %im generierten Feld
        function obj =  calcPossibleAgents(obj) 
            obj.agentSize = (obj.draw.width*obj.draw.length)/...
                (3*obj.agentMinRadius^2);
        end
        
        %Random Funktion für oben unten spawnen
        function rand = randPrefix(obj)
           rand = randi(2);
           if (rand == 2)
               rand = 1;
           else
               rand = -1;
           end
        end
        
        
        %spawne alle agents
        function obj = initialSpawn(obj)
            sze = size(obj.draw.agentArray);
        
            for i = 1:(sze)
                %For testing
                %obj.draw.length
                %obj.draw.width
                %obj.draw.agentArray(i) =  agent(0.25,obj.draw.width*rand()...
                %    ,obj.draw.length*rand(),10000,1)
                
                obj.draw.agentArray(i) = agent(0.4, 0,0,...
                    obj.agentMaxSpeed, 0);
            end
        end
        
        
        %Finde leere Agents
        function obj = addNewAgentsToArray(obj)
            emptyCount = 0;
            sze = size(obj.draw.agentArray);
            
            for i = 1:(sze(2))
                obj.draw.agentArray(i)
                if(obj.draw.agentArray(i).priority == 0)
                    emptyCount = emptyCount + 1;
                end
            end
            emptyCount
            %Fülle leere Plätze mit neuen Agents
            spawned = 0;
            for i = 1:emptyCount
                if(balanceProbability(obj) == 1)
                    spawned = spawned +1;
                    randPrefix(obj)
                    spawn(obj.draw.agentArray,randPrefix(obj));
                end
            end
            spawned
        end
        
        %Spawnwahrscheinlichkeit
        function prob = balanceProbability(obj)
            if (rand(1)< 0.1)
                prob = 1;
            else
                prob = 0;
            end
        end
        
        %Führe die Simulation aus
        %Das Resultat ist eine Matrix der Form
        %Oben   [Schritt1O Schritt2O...]
        %Unten  [Schritt1U Schritt2U...]
        function result =  run(obj)
            global SPEED;
            result = zeros(2,obj.loops);
            initialSpawn(obj);
            %for i = 1:obj.loops
                
                [result(1,1), result(2,1)] = ...
                    Iteration(obj.draw.agentArray,...
                    obj.draw.wallArray);
                
                obj.draw.plotStep();
                pause(SPEED);
                addNewAgentsToArray(obj);
                
            %end
            
        end
    end
    
end

