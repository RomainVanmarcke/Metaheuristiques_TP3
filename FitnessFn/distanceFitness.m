function [ totalDistance ] = distanceFitness(sequence, cities)
%DISTANCEFITNESS Minimize total distance given by a sequence
%   Detailed explanation goes here
    M = length(sequence);
    totalDistance = 0;
    for i=1:M
        city1 = cities(sequence(i),:);
        if i == M
            city2 = cities(sequence(1),:);
        else
            city2 = cities(sequence(i+1),:);
        end
        
        totalDistance = totalDistance + pdist2(city1 , city2);
    end
end

