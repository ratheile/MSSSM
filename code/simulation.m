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
        currentStep = 1;
        
        %Results
        spawned;
        
        %Properties
        %EVT durch globals austauschen!!
        agentMinRadius = 0.25; %Minimaler Radius von einem Agent
        agentMaxSpeed;
        
    end
    
    methods
        
        %Constructor
        function obj = simulation()
            obj.spawned = zeros(1,obj.loops);
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
            global SEED
            rng(SEED);   % Set seed for random number generator
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
            obj.agentSize = floor((obj.draw.width*obj.draw.length)/...
                (3*obj.agentMinRadius^2));
        end
        
        %Random Funktion für oben unten spawnen
        function randOut = randPrefix(obj)
           randOut = randi(2);
           if (randOut == 2)
               randOut = 1;
           else
               randOut = -1;
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
                
                obj.draw.agentArray(i) = agent(0.01, 0 ,0 ,...
                    obj.agentMaxSpeed, 0);
            end

        end
        
        
        %Spawne einen neuen Agent
        function obj = addNewAgentsToArray(obj)
            if (balanceProbability(obj) == 1)
                obj.spawned(obj.currentStep) = obj.spawned(obj.currentStep) +1;
                spawn(obj.draw.agentArray,randPrefix(obj));
            end
        end
        
        %Spawnwahrscheinlichkeit
        function prob = balanceProbability(obj)
            if (rand(1) < 1)    %Muss noch angepasst werden mit deltaT * rho
                prob = 1;
            else
                prob = 0;
            end
        end
        
        %Führe die Simulation aus
        %Das Resultat ist eine Matrix der Form
        %Oben   [Schritt1O Schritt2O...]
        %Unten  [Schritt1U Schritt2U...]
        %Der jeweilige eintrag sind die angekommenen agents / iteration
        function result = run(obj)
            global SPEED;
            result = zeros(2,obj.loops);
            initialSpawn(obj);
            %for i = 1:obj.loops
                
              %  [result(1,1), result(2,1)] = ...
              %      Iteration(obj.draw.agentArray,...
              %      obj.draw.wallArray);
                
                obj.draw.plotStep();
                pause(SPEED);
                for i = 1:5
                    addNewAgentsToArray(obj);
                end
                obj.draw.plotStep();
            %end
            
        end
        
        
        
    end
    
end

