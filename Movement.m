close all; 
clc;

% Simulation parameters
TOTAL_ = 1200;
Kattr = 1;
Krepl = 100000;
d0 = 100; % example threshold distance for the repulsive potential
goal = [TOTAL_ * 0.5; TOTAL_ * 0.5]; % Initialize goal
obstacles = [200, 1000; 400, 150; 150, 400; 800, 700; 1000, 800]; % Obstacle coordinates
robotPos = [10; 10]; % Initial position of the robot
stepSize = 1; % The step size of the robot
maxIterations = 1000; % Maximum number of iterations to simulate
goalThreshold = 5; % Distance threshold to consider goal reached
a  = 1; % parabolic curvature of the attractive potential
b  = 1; % parabolic curvature of the repulsive potential
maxVel = 50;

% Initialize positions to calculate
[x, y] = meshgrid(linspace(0, TOTAL_, TOTAL_), linspace(0, TOTAL_, TOTAL_));

% Calculate attractive and repulsive potentials for each point in the grid
Uattr = zeros(size(x));
Urep = zeros(size(x));
Utotal = zeros(size(x));

for i = 1:size(x, 1)
    for j = 1:size(x, 1)
        pos = [x(i, j); y(i, j)];
        q = [x(i, j); y(i, j)];
        Uattr(i, j) = AttractiveField(q, goal, Kattr, a, b, maxVel);

        Urep(i, j) = 0;
        
        % Sum repulsive potentials from all obstacles
        for k = 1:size(obstacles, 1)
            obstacle = obstacles(k, :)';
            d = norm(pos - obstacle);
            Urep(i, j) = Urep(i, j) + RepulsiveField(d, d0, Krepl) ;
        end
        Utotal(i, j) = Uattr(i, j) + Urep(i, j);
    end
end

% Simulate robot movement
step = 10; % Define the step size for visualization
[X, Y] = meshgrid(1:step:TOTAL_, 1:step:TOTAL_); % Create a grid of points with a step of 10

for iter = 1:maxIterations
    % Calculate gradient of the total potential at robot position
    [gradX, gradY] = gradient(Uattr);

    gradX = gradX * -1;
    gradY = gradY * -1;
    
    % Saturate the gradients to maximum of 20
    gradX = min(max(gradX, -20), 20);
    gradY = min(max(gradY, -20), 20);

%     disp(gradX(round(robotPos(2)), round(robotPos(1))))

    % Update the robot position
    grad = [gradX(round(robotPos(2)), round(robotPos(1))); gradY(round(robotPos(2)), round(robotPos(1)))];
    robotPos = robotPos - stepSize * grad;

    % Keep the robot within bounds
    robotPos(1) = max(1, min(size(Utotal, 2), robotPos(1)));
    robotPos(2) = max(1, min(size(Utotal, 1), robotPos(2)));

    % Check if the goal is reached
    if norm(robotPos - goal) < goalThreshold
        disp('Goal reached.');
        break;
    end
end

[gradX, gradY] = gradient(Uattr);

% print gradient at 1,1
% disp(gradX(1,1))
% disp(gradY(1,1))

% print next 10th gradient
% disp(gradX(10,10))
% disp(gradY(10,10))

% After the loop, display the vector field using quiver with a step of 10
% figure(1); clf; hold on; % Clear figure, hold on to plot multiple datasets
% quiver(X, Y, gradX(1:step:end, 1:step:end), gradY(1:step:end, 1:step:end), 'AutoScale', 'off'); % Plot the gradient field
% plot(robotPos(1), robotPos(2), 'ro'); % Plot the robot position
% xlim([1 TOTAL_]); ylim([1 TOTAL_]); % Set the axis limits
% title('Gradient Vector Field with Robot Path');
% xlabel('X');
% ylabel('Y');
% hold off; % Release the plot hold

% Plotting the results
% Display the attractive potential field
% figure
% surf(x, y, Uattr)
% title('Attractive Potential Field')
% xlabel('x')
% ylabel('y')
% zlabel('U_{attr}')
% shading interp
% colorbar

% Display the repulsive potential field
figure
surf(x, y, Urep)
title('Repulsive Potential Field')
xlabel('x')
ylabel('y')
zlabel('U_{rep}')
shading interp
colorbar

% Display the total potential field
% figure
% surf(x, y, Utotal)
% title('Total Potential Field')
% xlabel('x')
% ylabel('y')
% zlabel('U_{total}')
% shading interp
% colorbar
% hold on

% Plot the path of the robot as a line on the total potential field
% plot3(robotPos(1), robotPos(2), Utotal(round(robotPos(2)), round(robotPos(1))), 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'blue');

% Label the robot's final position
% text(robotPos(1), robotPos(2), Utotal(round(robotPos(2)), round(robotPos(1))), ' Robot', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');

% Plot the goal position
% plot3(goal(1), goal(2), Utotal(round(goal(2)), round(goal(1))), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'red');
% text(goal(1), goal(2), Utotal(round(goal(2)), round(goal(1))), ' Goal', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');

% Plot obstacles
% for k = 1:size(obstacles, 1)
%     ob_pos = obstacles(k, :);
%     plot3(ob_pos(1), ob_pos(2), Utotal(ob_pos(2),ob_pos(1)), 'ks', 'MarkerSize', 10, 'MarkerFaceColor', 'black');
%     text(ob_pos(1), ob_pos(2), Utotal(ob_pos(2), ob_pos(1)), ' Obstacle', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
% end

hold off % Release the figure