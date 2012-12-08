classdef simulation < handle
    %SIMULATION Summary of this class goes here
    %   Detailed explanation goes here
    
    %Vllt probleme wenn erster agent nicht gesetz ist.. schauen was
    %passiert sonst erster agent manuell setzen
    
    
    properties
        %Iteration properties
        loops = 500;
        
        
        %Objects
        draw; %Das Zeichenobjekt
        agentSize = 200; %Defaultwert 200 kann mit Funktion berechnet werden
        
        %Results
        calcAdditionalReport = 0;
        spawned;
        result;
        additionalresult;
        
        %Properties
        %EVT durch globals austauschen!!
        agentMinRadius = 0.25; %Minimaler Radius von einem Agent
        agentMaxSpeed;
        drawGraph = 1;
        
    end
    
    methods
        
        %Constructor
        function obj = simulation()
            obj.spawned = zeros(2,obj.loops);
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
            
            
            obj.draw.agentArray = agent.empty(100 ...
                 ,0);

            
%              obj.draw.agentArray = agent.empty(obj.agentSize ...
%                  ,0);
        end
        
      
        %Modusauswahl für verschidene Run Konfigurationen
        %switch case hat aus irgend einem grund nicht funktioniert.
        function obj = runMode(obj,mode)
                
              if(isempty(strfind(mode, '-MACHKEIPENIS')) == 0)
                  disp('MODE: keine Richtungsanzeige');
                  obj.draw.drawP = 0;
              end
            
              if(isempty(strfind(mode, '-nograph')) == 0)
                  disp('MODE: kein Graph');
                  obj.drawGraph = 0;
              end
              
              
              if(isempty(strfind(mode, '-report')) == 0)
                  disp('MODE: zusätzlicher report');
                  obj.calcAdditionalReport = 1;
              end
              
              if (isempty(strfind(mode, 'normal')) == 0)
                  obj.draw.particleDensity = 4;
                  obj.draw.createWall();
                disp('Running normal mode:');
                run(obj);
              elseif (isempty(strfind(mode, 'fasttest')) == 0)
                disp('Running fast mode with reduced wall points:');
                obj.draw.particleDensity = 1;
                obj.draw.createWall();
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
        function obj = addNewAgentsToArray(obj, currentStep)
            if (balanceProbability(obj) == 1)
                pfx = randPrefix(obj);
                if(pfx == 1)
                    %Unten gespawnt
                    obj.spawned(2,currentStep) = obj.spawned(currentStep) +1;
                else
                    %Oben gespawnt
                    obj.spawned(1,currentStep) = obj.spawned(currentStep) +1;
                end
                spawn(obj.draw.agentArray,pfx);
            end
        end
        
        %Spawnwahrscheinlichkeit
        function prob = balanceProbability(obj)
            global DENSITYUP DENSITYDOWN DELTAT
            %Genähert kommen genau im schnitt density agents
            if (rand(1) > 1-DELTAT*(DENSITYUP+DENSITYDOWN))  
                prob = 1;
            else
                prob = 0;
            end
        end
        
        
        %Berechnet optionale Resultate
        %Reihe1: Gesammtweg/Schritt
        %Reihe2: Agents im system
        function obj = additionalReport(obj, step)
            global DELTAT;
            
            sizeA = size(obj.draw.agentArray,2);
            for i = 1:sizeA
                if(obj.draw.agentArray(i).priority ~= 0)
                    obj.additionalresult(2,step) =  obj.additionalresult(2,step) +1; %Agents ++
                    way = abs(obj.draw.agentArray(i).actSpeed)*DELTAT;
                    obj.additionalresult(1,step) = obj.additionalresult(1,step)+ way; %Gesammtweg aufsummieren
                    obj.draw.agentArray(i).distance = obj.draw.agentArray(i).distance+way; %Agent aufsummieren
                end
            end
        end
        
        
        %Führe die Simulation aus
        %Das Resultat ist eine Matrix der Form
        %Oben   [Schritt1O Schritt2O...]
        %Unten  [Schritt1U Schritt2U...]
        %Der jeweilige eintrag sind die angekommenen agents / iteration
        function obj = run(obj)
            global SPEED DELTAT;
            obj.result = zeros(2,obj.loops);
            %Speicher für additionale resultate
            if(obj.calcAdditionalReport == 1)
                obj.additionalresult = zeros(2, obj.loops);
            end
            
            initialSpawn(obj);
            
            for i = 1:obj.loops
                if(mod(i,50) == 0)
                    fprintf('Time elapsed: %i Seconds \n',(DELTAT*i))
                end
                [obj.result(1,i), obj.result(2,i)] = ...
                    Iteration(obj.draw.agentArray,...
                    obj.draw.wallArray);
                
                addNewAgentsToArray(obj, i);
                pause(SPEED);
                
                if(obj.drawGraph == 1)
                    obj.draw.plotStep();
                end
                
                if(obj.calcAdditionalReport == 1)
                    additionalReport(obj, i);
                end
                
            end
            
            
           
            
        end
        
        
        
    end
    
end
