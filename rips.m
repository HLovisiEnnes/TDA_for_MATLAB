function connected_components = rips(x, t)
%returns connected components for a thickenong t
size_x = size(x); 
%calculates the distance matrix
dist = [];
    for y = 1:size_x(1)
        for z = 1:size_x(1)
            if x(z,:) ~= x(y,:) 
                dist = [dist, sqrt(dot(x(z,:) - x(y,:), x(z,:) - x(y,:)))];
            end
        end
    end
    
    
%makes a simplex matrix so that simplex(i,j) = 1 if ij are at distance at
%least t and 0 otherwise
simplex = [];
for y = dist
    if y <= t
        simplex = [simplex, 1];
    else
        simplex = [simplex, 0];
    end
end 
simplex = reshape(simplex,[length(x), length(x)]);

%creates the list of vertices
vertices = 1:1:size_x(1);
%we use control to check which vertices were already put in a connected
%component
control = [];
connected_components = [];
for y = vertices
  if ismember(y, control) == 0
      component_y = [];
      for z = vertices
          if simplex(y,z) == 1
              component_y = [component_y, z];
          end
      end
      connected_components = [connected_components, {set_maker(component_y)}];
      for z = component_y
        control = [control, z];
      end
  end
end
end


%creates a function that makes traditional set operation ie. deleting
%double entries in a vector
function list = set_maker(x)
list = [];
for y = x
    if ismember(y, list) == 0
        list = [list, y];
    end
end
end
