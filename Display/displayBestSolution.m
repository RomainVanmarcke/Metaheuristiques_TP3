function displayBestSolution( pop, oldscores, cities, context )
%DISPLAYBESTSOLUTION Summary of this function goes here
%   Detailed explanation goes here
    
    figure
    plot(cities(:,1), cities(:,2),'r*'); 
    title('TSP');
    xlabel('X coordinates');
    ylabel('Y coordinates');

    orderedCities = zeros(context.N+1, context.L);
    x = orderedCities(:,1);
    y = orderedCities(:,2);
    
    hold on;
    h = plot(x, y);
    
    for g=1:context.Gmax
        [~, bestScoreIdx] = min(oldscores(g,:));
        bestPath = pop(g, bestScoreIdx, :);
        
        for n=1:context.N
           orderedCities(n,:) = cities(bestPath(n),:);  
        end  
        orderedCities(context.N+1,:) = orderedCities(1,:);
        x = orderedCities(:,1);
        y = orderedCities(:,2);
        pause(0.05);
        set(h,'XData',x,'YData',y);
        title(['TSP Gen ', num2str(g)]);
    end
    

end

