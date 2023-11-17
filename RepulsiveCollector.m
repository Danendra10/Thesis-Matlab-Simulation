close all; 
clc;

% Simulation parameters
TOTAL_ = 1200;
Krepl_values = [100000, 10000000, 100000000]; % Different repulsive constants
d0_values = [50, 100, 200]; % Different threshold distances
obstacles = [200, 1000; 400, 150; 150, 400; 800, 700; 1000, 800]; % Obstacle coordinates

[x, y] = meshgrid(linspace(0, TOTAL_, TOTAL_), linspace(0, TOTAL_, TOTAL_));

% Iterate over each combination of Krepl and d0
for Krepl = Krepl_values
    for d0 = d0_values

        Urep = zeros(size(x));

        for i = 1:size(x, 1)
            for j = 1:size(x, 2)
                pos = [x(i, j); y(i, j)];
                q = [x(i, j); y(i, j)];
                Urep(i, j) = 0;        
                % Sum repulsive potentials from all obstacles
                for k = 1:size(obstacles, 1)
                    obstacle = obstacles(k, :)';
                    d = norm(pos - obstacle);
                    Urep(i, j) = Urep(i, j) + RepulsiveField(d, d0, Krepl);
                end
            end
        end

        % Display the repulsive potential field
        figure
        surf(x, y, Urep)
        title(['Repulsive Potential Field, Krepl = ', num2str(Krepl), ', d0 = ', num2str(d0)])
        xlabel('x')
        ylabel('y')
        zlabel('U_{rep}')
        shading interp
        colorbar
        
        % Save the figure or data if needed
        saveas(gcf, ['RepField_Krepl_', num2str(Krepl), '_d0_', num2str(d0), '.png']);
        % or save data
        save(['RepField_Data_Krepl_', num2str(Krepl), '_d0_', num2str(d0), '.mat'], 'Urep');
    end
end