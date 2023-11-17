% Define the parameters for the paraboloid
h = 0; % x-coordinate of the vertex
k = 0; % y-coordinate of the vertex
j = 0; % z-coordinate of the vertex (not needed for an elliptic paraboloid)
a = 2; % parameter controlling width in the x direction
b = 2; % parameter controlling width in the y direction
c = 0.9; % parameter controlling the scaling in z

% Define the range for x and y
x = linspace(-10, 10, 100); % 100 points from -10 to 10
y = linspace(-10, 10, 100); % 100 points from -10 to 10

% Create a grid of x and y values
[X, Y] = meshgrid(x, y);

% Calculate the corresponding z values
% Note that we multiply by c to control the scaling and add j to offset if needed
Z = c * (((X - h).^2) ./ a^2 + ((Y - k).^2) ./ b^2);

% Plot the paraboloid
surf(X, Y, Z)

% Customize the plot
xlabel('x')
ylabel('y')
zlabel('z')
title('3D Elliptic Paraboloid Plot')
axis tight
