function distance_matrix(x, bins)
dist = [];
    for y = transpose(x)
        for z = transpose(x)
            dist = [dist, sqrt(dot(z-y, z-y))];
        end
    end
histogram(dist, bins)
end