% Potential Field Main Loop
TOTAL_ = 200;
Kattr = 1;
Krepl = 10000;
d0 = 50; % example threshold distance for the repulsive potential
% Initialize goal
goal = [TOTAL_ * 0.5;TOTAL_ * 0.5];

% Initialize positions to calculate
[x, y] = meshgrid(linspace(0, TOTAL_, TOTAL_ * 0.5), linspace(0, TOTAL_, TOTAL_ * 0.5));
% obstacle = [50; 50]; 
obstacles = [50, 50; 100, 150; 150, 100; 80, 180; 180, 80]; 
disp(obstacle)

% Calculate attractive potential for each point in the grid
Uattr = zeros(size(x)); % Initialize Uattr as a matrix of zeros
Urep = zeros(size(x)); % Initialize Urep as a matrix of zeros
Utotal = zeros(size(x)); % Initialize Utotal as a matrix of zeros

for i = 1:size(x, 1)
    for j = 1:size(x, 2)
        q = [x(i, j); y(i, j)];
        d = norm(q - obstacle); % Calculate the distance from the point to the obstacle
        Uattr(i, j) = AttractiveField(q, goal', Kattr);
        % Urep(i, j) = RepulsiveField(d, d0, Krepl);

        for k = 1:size(obstacles, 1)
            d = norm(q - obstacles(k, :)'); % Jarak dari titik ke halangan
            Urep(i, j) = Urep(i, j) + RepulsiveField(d, d0, Krepl);
        end

        Utotal(i, j) = Uattr(i, j) + Urep(i, j);
    end
end

localMinimaPoints = FindLocalMinima(Utotal);
disp('Local Minima Points')
disp(localMinimaPoints)

[globalMinValue, minRow, minCol] = FindGlobalMinima(Utotal);

% Display the results
disp(['Global minimum value: ', num2str(globalMinValue)]);
disp(['Global minimum position: (', num2str(minRow), ', ', num2str(minCol), ')']);

localMaximaPoints = FindLocalMaxima(Utotal);
disp("Local Maxima:")
disp(localMaximaPoints)

[globalMaxValue, maxRow, maxCol] = FindGlobalMaxima(Utotal);
disp(['Global maximum value: ', num2str(globalMaxValue)]);
disp(['Global maximum position: (', num2str(maxRow), ', ', num2str(maxCol), ')']);


% Display as surf
figure
surf(x, y, Uattr)
title('Attractive Potential Field')
xlabel('x')
ylabel('y')
zlabel('U_{attr}')
shading interp
colorbar

% Display as surf
figure
surf(x, y, Urep)
title('Repulsive Potential Field')
xlabel('x')
ylabel('y')
zlabel('U_{rep}')
shading interp
colorbar

% Display as surf
figure
surf(x, y, Utotal)
title('Total Potential Field')
xlabel('x')
ylabel('y')
zlabel('U_{total}')
shading interp
colorbar
hold on; % Keep the surface plot

% Plot global minimum and maximum
plot3(minRow * 2, minCol * 2, globalMinValue, 'rp', 'MarkerSize', 10, 'MarkerFaceColor', 'red'); % Global minima point
plot3(maxRow * 2, maxCol * 2, globalMaxValue, 'gp', 'MarkerSize', 10, 'MarkerFaceColor', 'green'); % Global maxima point

% Label global minimum and maximum
text(minRow * 2, minCol * 2, globalMinValue, ' Global Min', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
text(maxRow * 2, maxCol * 2, globalMaxValue, ' Global Max', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');

hold off; % Release the figure