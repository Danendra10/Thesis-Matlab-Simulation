field_x = 1200;
field_y = 800;
target_x = 600;
target_y = 400;
a = 1;
b = 1;
c = 0.04;
k_attr = 0.3;
k_repl = 100000000;
d0 = 200;
obstacles = [200, 700; 400, 150; 150, 400; 800, 700; 1000, 800]; % Obstacle coordinates

max_trans_vel = 2;

[X, Y] = meshgrid(linspace(0, field_x, field_x), linspace(0, field_y, field_y));

% Update the paraboloid plot
u_attr = zeros(size(X));
u_repl = zeros(size(X));
u_total = zeros(size(X));
for i = 1:size(X, 1)
    for j = 1:size(Y, 2)
        q = [X(i, j); Y(i, j)];
        goal = [target_x, target_y];
        u_repl(i, j) = 0;

        u_attr(i, j) = NewAttractiveField(q, goal, k_attr, a, b, c, max_trans_vel);

        for k = 1:size(obstacles, 1)
            obstacle = obstacles(k, :)';
            d = norm(q - obstacle);
            u_repl(i, j) = u_repl(i, j) + RepulsiveField(d, d0, k_repl);
        end
        
        u_total(i, j) = u_attr(i, j) + u_repl(i, j);
    end
end

surf(X, Y, u_total);
    
% Customize the plot
xlabel('x')
ylabel('y')
zlabel('z')
title('3D Total Field')
axis tight
shading interp
colorbar