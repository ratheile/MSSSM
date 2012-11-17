function [ priorityArray ] = getPriorityArray( agentsArray )
    %Priorit�tsarray bestimmen

    priorityArray = zeros(1,length(agentsArray));
    for i = 1:length(agentsArray)
        priorityArray(i) = agentsArray(i).priority;
    end

end

