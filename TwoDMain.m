close all;
clc;

% Potential Field Main Loop
TOTAL_ = 400;
stepSize = 1; % Step size for quiver plot
maxVel = 2;
Kattr = 1;
Krepl = 1000;
d0 = 50;
a = 1; % parabolic curvature of the attractive potential
b = 1; % parabolic curvature of the attractive potential

% Initialize goal
goal = [TOTAL_ * 0.5; TOTAL_ * 0.5];

% Initialize positions to calculate
[x, y] = meshgrid(0:stepSize:TOTAL_, 0:stepSize:TOTAL_);
% Calculate attractive force for each point in the grid
Fattr_x = zeros(size(x)); % Initialize Fattr_x as a matrix of zeros
Fattr_y = zeros(size(x)); % Initialize Fattr_y as a matrix of zeros
Frep_x = zeros(size(x)); % Repulsive force x-component
Frep_y = zeros(size(x)); % Repulsive force y-component

% Define obstacles (as row vectors for ease of subtraction)
obstacles = [50, 50; 300, 300; 500, 700; 700, 700; 800, 1000];

% Calculate forces for each point in the grid
for i = 1:size(x, 1)
    for j = 1:size(x, 2)
        q = [x(i, j); y(i, j)];
        % Calculate the attractive force using the AttractiveForce function
        Fatt = AttractiveForce(q, goal, Kattr, a, b, maxVel);
        Fattr_x(i, j) = Fatt(1);
        Fattr_y(i, j) = Fatt(2);

        % Calculate repulsive force from each obstacle
        F_rep_total = [0; 0];
        for k = 1:size(obstacles, 1)
            obstacle = obstacles(k, :)';
            F_rep = RepulsiveForce(q, obstacle, d0, Krepl) ;
            F_rep_total = F_rep_total + F_rep;
        end
        Frep_x(i, j) = F_rep_total(1);
        Frep_y(i, j) = F_rep_total(2);
    end
end

% Visualize the attractive force using a quiver plot
figure;
hold on; % Hold on to plot repulsive forces on the same figure

% Now create a quiver plot with the specified step size
quiver(x(1:20:end, 1:20:end), y(1:20:end, 1:20:end), Fattr_x(1:20:end, 1:20:end), Fattr_y(1:20:end, 1:20:end), 'AutoScale', 'off', 'color', 'b');

title('Repulsive Force Field');
xlabel('X position');
ylabel('Y position');
% legend('Attractive Force', 'Repulsive Force'); % Uncomment this if you plot attractive forces too
axis equal tight;
hold off; % Release the figure for other plots



% Calculate total forces for each point in the grid
Ftotal_x = Fattr_x + Frep_x;
Ftotal_y = Fattr_y + Frep_y;
Ftotal = [Ftotal_x, Ftotal_y];

% Visualize the total force using a new quiver plot in a different figure
figure;
quiver(x(1:20:end, 1:20:end), y(1:20:end, 1:20:end), Ftotal_x(1:20:end, 1:20:end), Ftotal_y(1:20:end, 1:20:end), 'AutoScale', 'off', 'color', 'g');
title('Total Force Field');
xlabel('X position');
ylabel('Y position');
axis equal tight;

localMaximaPoints = FindLocalMaxima([Frep_x, Frep_y]);
disp("Local Maxima:")
disp(localMaximaPoints)

% Create Voronoi Diagram using the points
figure;
voronoi(localMaximaPoints(:, 1), localMaximaPoints(:, 2));
title('Voronoi Diagram');
xlabel('X position');
ylabel('Y position');
axis([0 TOTAL_ 0 TOTAL_]); % Set axis limits to the size of your field
axis equal;