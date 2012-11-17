function [ valueClosest, indexClosest ] = closest( searchArray, searchValue )
%	Gibt den Wert und den Indexpunkt wieder, der in searchArray am n�chsten
%	bei searchValue liegt

    [~, indexClosest] = min(abs(searchArray - searchValue));
    valueClosest = searchArray(indexClosest);
end

