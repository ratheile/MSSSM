function [] = Iteration( agentsArray, wallArray, priorityArray )
%	Funktion ruft die Funktion logicFunction auf
%   Muss mit einer Prioritätenliste auf alle Agents ausgeweitet werden

    angle = logicFunction(agentsArray, 1, 5, priorityArray);


end

