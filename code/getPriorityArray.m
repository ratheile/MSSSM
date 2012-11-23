function [ priorityArray ] = getPriorityArray( agentsArray )
    %For given agents, this function reads out their priority values.

    priorityArray = zeros(1,length(agentsArray));
    for i = 1:length(agentsArray)
        priorityArray(i) = agentsArray(i).priority;
    end

end

