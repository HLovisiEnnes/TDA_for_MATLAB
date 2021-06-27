function vec = random_normal(number_of_vec, dim_of_vec)
random = rand(number_of_vec, dim_of_vec);
vec = [];
for y = 1:number_of_vec
    vec = [vec; random(y,:)/sqrt(dot(random(y,:),random(y,:)))];
end
