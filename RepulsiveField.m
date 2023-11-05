% Calculate the repulsive potential field for a position q
% d: The distance between the robot and the closest obstacle
% d0: The threshold distance for the repulsive potential
% kb: The repulsion gain coefficient
% Equation that calculates the Attractive Field force:
% Fatt(q) = 0.5 * Katt * (qd - q)^2
function Urep = RepulsiveField(d, d0, Krep)
    if d <= d0
        % Calculate the repulsive potential as per the equation in the paper
        % disp("Inside the influence range")
        % disp(d)
        % disp(d0)
        Urep = 0.5 * Krep * (1/d - 1/d0)^2;
    else
        % disp("Outside the influence range")
        % disp(d)
        % disp(d0)
        % Outside the influence range, the repulsive potential is zero
        Urep = 0;
    end
end

