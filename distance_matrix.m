function distance_matrix(x, bins)
size_x = size(x);
dist = [];
    for y = 1:size_x(1)
        for z = 1:size_x(1)
            if x(z,:) ~= x(y,:) 
                dist = [dist, sqrt(dot(x(z,:) - x(y,:), x(z,:) - x(y,:)))];
            end
        end
    end
histogram(dist, bins)
end