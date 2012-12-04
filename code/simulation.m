classdef simulation
    %SIMULATION Summary of this class goes here
    %   Detailed explanation goes here
    
    %Vllt probleme wenn erster agent nicht gesetz ist.. schauen was
    %passiert sonst erster agent manuell setzen
    
    
    properties
        %Iteration properties
        loops = 100;
        
        
        %Objects
        draw; %the drawing object
        agentSize = 400;
        agents
        %Results
        
        
    end
    
    methods
        
        %Constructor
        function obj = simulation()
        end
    end
    
    methods(Access = public)
        
        
        %Wegen fehler : kann leider nicht in konstruktor 
        %ausgeführt werden - weiss nicht wie evt noch fragen
        %nächste woche!
        function obj = init(obj)
            defineConstants(); %defne all global variables
            obj.draw = drawing();   %create the drawing object
        end
        
        
        %Gebe reultate zurück
        function obj = getResults(obj)
            
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
    end
    
    
    methods(Access = private)
        
        
        function obj = addAgentsToArray(obj)
    
        end
        
        
        function obj = balanceProbability(obj)
        end
        
        
        function obj = run(obj)
            
            for i = 1:obj.loops
                Iteration(obj.draw.agentArray, obj.draw.wallArray);
                obj.draw.plotStep();
                pause(SPEED)
            end
            
        end
    end
    
end

