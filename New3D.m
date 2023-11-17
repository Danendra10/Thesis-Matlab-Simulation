% Create the figure
clear all;
close all;
clc;
figure(1);

field_x = 200;
field_y = 200;
h = field_x * 0.5;
k = field_y * 0.5;
a = 1;
b = 1;
c = 0.04;
k_attr = 0.3;

% Create sliders for each parameter
slider_h = uicontrol('Style', 'slider', 'Min', 0, 'Max', field_x, 'Value', h, 'Position', [20 20 120 20], 'Callback', @updatePlot);
slider_k = uicontrol('Style', 'slider', 'Min', 0, 'Max', field_y, 'Value', k, 'Position', [20 50 120 20], 'Callback', @updatePlot);
slider_a = uicontrol('Style', 'slider', 'Min', 0, 'Max', 10, 'Value', a, 'Position', [20 80 120 20], 'Callback', @updatePlot);
slider_b = uicontrol('Style', 'slider', 'Min', 0, 'Max', 10, 'Value', b, 'Position', [20 110 120 20], 'Callback', @updatePlot);
slider_c = uicontrol('Style', 'slider', 'Min', 0, 'Max', 2, 'Value', c, 'Position', [20 140 120 20], 'Callback', @updatePlot);
slider_k_attr = uicontrol('Style', 'slider', 'Min', 0, 'Max', 10, 'Value', k_attr, 'Position', [20 170 120 20], 'Callback', @updatePlot);

set(slider_h, 'Callback', @(src, event)updatePlot(src, event, slider_h, slider_k, slider_a, slider_b, slider_c, slider_k_attr));
set(slider_k, 'Callback', @(src, event)updatePlot(src, event, slider_h, slider_k, slider_a, slider_b, slider_c, slider_k_attr));
set(slider_a, 'Callback', @(src, event)updatePlot(src, event, slider_h, slider_k, slider_a, slider_b, slider_c, slider_k_attr));
set(slider_b, 'Callback', @(src, event)updatePlot(src, event, slider_h, slider_k, slider_a, slider_b, slider_c, slider_k_attr));
set(slider_c, 'Callback', @(src, event)updatePlot(src, event, slider_h, slider_k, slider_a, slider_b, slider_c, slider_k_attr));
set(slider_k_attr, 'Callback', @(src, event)updatePlot(src, event, slider_h, slider_k, slider_a, slider_b, slider_c, slider_k_attr));

% Create the initial plot
updatePlot(slider_h, [], slider_h, slider_k, slider_a, slider_b, slider_c, slider_k_attr);

% Function to update the plot based on the slider values
function updatePlot(~, ~, slider_h, slider_k, slider_a, slider_b, slider_c, slider_k_attr)
    % Get the slider values
    h = get(slider_h, 'Value');
    k = get(slider_k, 'Value');
    a = get(slider_a, 'Value');
    b = get(slider_b, 'Value');
    c = get(slider_c, 'Value');
    k_attr = get(slider_k_attr, 'Value');
%     fprintf("h: %f | k: %f | a: %f | b: %f | c: %f | k_attr: %f\n", h, k, a, b, c, k_attr);
    field_x = 200;
    field_y = 200;
    max_trans_vel = 2;

    [X, Y] = meshgrid(linspace(0, field_x, field_x), linspace(0, field_y, field_y));
    
    % Update the paraboloid plot
    u_attr = zeros(size(X));
    for i = 1:size(X, 1)
        for j = 1:size(Y, 2)
            q = [X(i, j); Y(i, j)];
            goal = [h, k];
            u_attr(i, j) = NewAttractiveField(q, goal, k_attr, a, b, c, max_trans_vel);
        end
    end

    figure(2);
    surf(X, Y, u_attr);
    
    % Customize the plot
    xlabel('x')
    ylabel('y')
    zlabel('z')
    title('3D Attractive')
    axis tight
    shading interp
    colorbar
end