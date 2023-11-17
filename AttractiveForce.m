% AttractiveForce - Calculates the attractive force between a current position q and a goal position qd
%
% Syntax:
%    Fatt = AttractiveForce(q, qd, Katt, a, b, maxVel)
%
% Inputs:
%    q - Current position (2D vector)
%    qd - Goal position (2D vector)
%    Katt - Attractive force gain
%    a - Parabolic curvature of the attractive potential
%    b - Parabolic curvature of the attractive potential
%    maxVel - Maximum velocity or force magnitude to apply
%
% Output:
%    Fatt - Attractive force (2D vector)
%
% Example:
%    Fatt = AttractiveForce([0; 0], [10; 10], 1, 1, 1, 100)
%
% Other m-files required: None
% Subfunctions: None
% MAT-files required: None
%
% See also: RepulsiveForce
function Fatt = AttractiveForce(q, qd, Katt, a, b, maxVel)
    dist_to_goal = sqrt((q(1) - qd(1))^2 + (q(2) - qd(2))^2);
    
    if dist_to_goal < 200
        % Compute the gradient of the paraboloid potential at point q with the goal at qd
        grad_x = Katt * (q(1) - qd(1)) / a^2;
        grad_y = Katt * (q(2) - qd(2)) / b^2;

        % Since force is the negative gradient of the potential,
        % we invert the sign of the calculated gradient.
        Fatt_x = -grad_x;
        Fatt_y = -grad_y;
        
        % Combine the individual components to create the vector force.
        Fatt = [Fatt_x; Fatt_y];
    else 
        % Assuming q and qd are the current and destination positions respectively,
        % and maxVel is the maximum velocity or force magnitude you want to apply.
        
        % Calculate the direction of the gradient. Note that the original code may result
        % in a division by zero if q(i) equals qd(i). So, we handle the case where the difference is zero.
        if q(1) == qd(1)
            grad_dir_x = 0;
        else
            grad_dir_x = (q(1) - qd(1)) / abs(q(1) - qd(1));
        end
        
        if q(2) == qd(2)
            grad_dir_y = 0;
        else
            grad_dir_y = (q(2) - qd(2)) / abs(q(2) - qd(2));
        end
        
        % Calculate the attractive force components.
        % The force is negative of the gradient of the potential field.
        Fatt_x = -Katt * grad_dir_x * maxVel / a^2;
        Fatt_y = -Katt * grad_dir_y * maxVel / b^2;
        
        % Combine the components to create the vector force.
        Fatt = [Fatt_x; Fatt_y];

    end    
end