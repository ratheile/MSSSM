function [ outList ] = getSortedPriorityArray(priorityArray)
%For given priorityArray, this function sorts them according to decreasing priority ignoring all zeros and returning the indices of the sorted priorities.
    
   sortMat = ([priorityArray; 1:length(priorityArray)])'; %prios with index
   sortMat = (sortrows(sortMat, 1))'; %sort them decreasingly wrt priority
   %Hier könnte man alle mit den gleichen Prioritätswerten
   %durcheinandermischen
   prioNotZero = fliplr(find(sortMat(1,:))); %only non-zero values
   outList = sortMat(2,prioNotZero); %return indices

end

