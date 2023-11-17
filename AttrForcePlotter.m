% Define the grid
grid_size = 400;
[x, y] = meshgrid(linspace(0, 400, grid_size), linspace(0, 400, grid_size));
Fattr_x = zeros(size(x));
Fattr_y = zeros(size(y));

% Target position
qd = [200; 200]; 

% Constants
a = 1;
b = 1;
c = 0.04;
k_attr = 0.3;
linear_slope = 2;
rad_thr = 50;
U_trans = 100;

% Calculate the attractive force components at each grid point
for i = 1:size(x, 1)
    for j = 1:size(x, 2)
        q = [x(i, j); y(i, j)];
        Fattr = NewAttractiveForce(q, qd, k_attr, a, b, c, linear_slope, rad_thr, U_trans);
        Fattr_x(i, j) = Fattr(1);
        Fattr_y(i, j) = Fattr(2);
    end
end

% Visualize the attractive force field with quiver plot
figure
quiver(x, y, Fattr_x, Fattr_y, 'AutoScaleFactor', 0.5)
axis equal
title('Attractive Force Field')
xlabel('x position')
ylabel('y position')
