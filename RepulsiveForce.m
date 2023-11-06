function Frep = RepulsiveForce(q, obstacle, d0, Krep)
    % Vector from obstacle to point q
    vec_to_q = q - obstacle;
    d = norm(vec_to_q); % Distance from obstacle to point q
    if d <= d0 && d ~= 0
        % fprintf("On location %f, %f || Distance %f Dq %f || d <= d0\n", q(1), q(2), d, d0);
        % Gradient of the repulsive potential
        grad_Urep = Krep * (1/d - 1/d0) * (1/(d^2)) * (vec_to_q/d);
        % Since force is the negative gradient of the potential, we invert the sign
        Frep = -grad_Urep;
        % fprintf("Frep %f, %f\n", Frep(1), Frep(2))
    else
        % If outside the influence zone or exactly at the obstacle location, no force
        Frep = [0; 0];
    end
end