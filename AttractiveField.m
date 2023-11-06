% Calculate the Attractive Field force to plot the vector field
% Uattr is a output vector size based on the q
% q is the input vector of position x, y
% qd is the goal position x, y
% Katt is constanta of attractive
% a and b is paraboloid curvature
% maxVel is the maximum velocity to saturate the linear
% When dist_to_goal > 100, use the linear but in 3 axis with input x and y
function Uattr = AttractiveField(q, qd, Katt, a, b, maxVel)
    dist_to_goal = sqrt((q(1) - qd(1))^2 + (q(2) - qd(2))^2);

    persistent max_u;

    if isempty(max_u)
        max_u = 0;
    end

    if dist_to_goal < 75
        % Compute the paraboloid potential at point q with the goal at qd
        Uattr =  Katt * ((q(1) - qd(1))^2 / a^2 + (q(2) - qd(2))^2 / b^2);
        max_u = max(max_u, Uattr); % Update max_u if current Uattr is larger
    else 
        % Gradient of the paraboloid at the boundary point
        grad_x = Katt * abs(q(1) - qd(1)) / a^2;
        grad_y = Katt * abs(q(2) - qd(2)) / b^2;
        
        % Calculate the linear potential in each axis using the gradient and the excess distance
        Uattr_x = grad_x * maxVel;
        Uattr_y = grad_y * maxVel;
        
        % The total potential is the sum of the individual potentials
        Uattr = max_u + sqrt(Uattr_x^2 + Uattr_y^2);
    end    
end
