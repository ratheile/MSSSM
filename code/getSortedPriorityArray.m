function [ outList ] = getSortedPriorityArray(priorityArray)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    
   sortMat = ([priorityArray; 1:length(priorityArray)])';
   sortMat = (sortrows(sortMat, 1))';
   %Hier k�nnte man alle mit den gleichen Priorit�tswerten
   %durcheinandermischen
   prioNotZero = fliplr(find(sortMat(1,:)));
   outList = sortMat(2,prioNotZero);

end

