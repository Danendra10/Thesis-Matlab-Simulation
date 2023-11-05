% Calculate the Attractive Field force to plot the vector field
% Z is a output vector size based on the q
% q is the input vector of position x, y
% qd is the goal position x, y
% Equation that calculates the Attractive Field force:
% Fatt(q) = 0.5 * Katt * (qd - q)^2

% 1.0
% function Uattr = AttractiveField(q, qd, Katt)
%     % Reshape qd to allow for broadcasting with q
%     qd = qd(:);
%     Uattr = 0.5 * Katt * sum((qd - q).^2, 1);
% end

function Uattr = AttractiveField(q, qd, Katt, a, b)
    % Compute the paraboloid potential at point q with the goal at qd
    Uattr = 0.5 * Katt * ((q(1) - qd(1))^2 / a^2 + (q(2) - qd(2))^2 / b^2);
end
