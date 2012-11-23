function [ valueClosest, indexClosest ] = closest( searchArray, searchValue )
% This function returns the closest value and index, which is in searchArray, closest to searchValue.

    [~, indexClosest] = min(abs(searchArray - searchValue)); %save index
    valueClosest = searchArray(indexClosest); %return value
end

