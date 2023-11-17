close all;
clear all;
clc;
field_x = 1200;
field_y = 800;

target_x = field_x/2;
target_y = field_y/2;

qd = [target_x; target_y];

f_total_x = zeros(size(field_x));
f_total_y = zeros(size(field_x));

[x,y] = meshgrid(linspace(0,field_x + 1,field_x),linspace(0,field_y + 1,field_y));

% Constants
a = 1;
b = 1;
c = 0.04;
k_attr = 20;
linear_slope = 20;
rad_thr = 50;
U_trans = 100;
k_repl = 100000000;
d0 = 200;

% Obstacles
obstacles = [200, 700; 400, 150; 150, 400; 800, 700; 1000, 800];

for i = 1:size(x,1)
    for j = 1:size(y,2)
        q = [x(i, j); y(i, j)];
        f_attr = NewAttractiveForce(q, qd, k_attr, a, b, c, linear_slope, rad_thr, U_trans);

        f_repl = zeros(2,1);

        for k = 1:size(obstacles, 1)
            obstacle = obstacles(k, :)';
            d = norm(q - obstacle);
            f_repl = f_repl + RepulsiveField(d, d0, k_repl);
        end

        f_total = f_attr - f_repl;
        f_total_x(i, j) = f_total(1);
        f_total_y(i, j) = f_total(2);
    end
end

figure
quiver(x, y, f_total_x, f_total_y);
axis([0 field_x 0 field_y]);
hold on;
plot(qd(1), qd(2), 'r*');
plot(obstacles(:,1), obstacles(:,2), 'k*');
hold off;