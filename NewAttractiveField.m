% Calculate the Attractive Field force to plot the vector field
% Uattr is a output vector size based on the q
% q is the input vector of position x, y
% qd is the goal position x, y
% Katt is constanta of attractive
% a and b is paraboloid curvature
% maxVel is the maximum velocity to saturate the linear
% When dist_to_goal > 100, use the linear but in 3 axis with input x and y

function Uattr = NewAttractiveField(q, qd, Katt, a, b, c,  linear_slope)
    persistent has_print_linear;
    if isempty(has_print_linear)
        has_print_linear = false;
    end
    persistent has_print_paraboloid;
    if isempty(has_print_paraboloid)
        has_print_paraboloid = false;
    end
    persistent has_print_blend;
    if isempty(has_print_blend)
        has_print_blend = false;
    end
    dist_to_goal = sqrt((q(1) - qd(1))^2 + (q(2) - qd(2))^2);

    % Paraboloid potential
    paraboloid = Katt * c * ((q(1) - qd(1))^2 / a^2 + (q(2) - qd(2))^2 / b^2);

    % Make sure the linear potential aligns with the paraboloid at transition
    linear_at_transition = Katt * c * (100^2 / a^2 + 100^2 / b^2);
    linear = linear_slope * (dist_to_goal - 100) + linear_at_transition;

    % Blending function (tanh for smoother transition)
    transition_distance = 100;
    blend_width = 40; % Control the smoothness of the transition
    blend = 0.5 * (tanh((dist_to_goal - transition_distance) / blend_width) + 1);

    % Combined potential
    Uattr = (1 - blend) * paraboloid + blend * linear;

    if dist_to_goal > transition_distance && dist_to_goal <= transition_distance + 1 && ~has_print_paraboloid
        fprintf('Linear potential(%f, %f): %f\n', q(1), q(2), Uattr);
        has_print_paraboloid = true;
    elseif dist_to_goal < transition_distance && dist_to_goal >= transition_distance - 1 && ~has_print_linear
        fprintf('Paraboloid potential(%f, %f): %f\n', q(1), q(2), Uattr);
        has_print_linear = true;
    elseif dist_to_goal < transition_distance + 1 && dist_to_goal > transition_distance - 1 && ~has_print_blend
        fprintf('Blending potential(%f, %f): %f\n', q(1), q(2), Uattr);
        has_print_blend = true;
    end
end