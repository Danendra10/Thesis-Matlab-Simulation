function Fattr = NewAttractiveForce(q, qd, Katt, a, b, c, linear_slope, rad_thr, U_trans)
    % Hitung jarak ke tujuan
    dist_to_goal = sqrt((q(1) - qd(1))^2 + (q(2) - qd(2))^2);

    % Blending function
    omega = 40; % Ini adalah nilai lebar blending yang Anda pilih, bisa diubah sesuai kebutuhan
    blend = 0.5 * (tanh((dist_to_goal - rad_thr) / omega) + 1);

    % Turunan dari blending function terhadap d
    d_sigma_dd = 0.5 * (1 / omega) * (sech((dist_to_goal - rad_thr) / omega))^2;
    
    % Turunan dari jarak terhadap q1 dan q2
    d_d_dq1 = (q(1) - qd(1)) / dist_to_goal;
    d_d_dq2 = (q(2) - qd(2)) / dist_to_goal;
    
    % Turunan dari sigma terhadap q1 dan q2 menggunakan aturan rantai
    d_sigma_dq1 = d_sigma_dd * d_d_dq1;
    d_sigma_dq2 = d_sigma_dd * d_d_dq2;
    
    % Hitung komponen-komponen dari gradien Uattr terhadap q1 dan q2
    grad_Uattr_q1 = Katt * c * 2 * (q(1) - qd(1)) / a^2 * (1 - blend) ...
                    + (d_sigma_dq1 * linear_slope * (dist_to_goal - rad_thr) * U_trans) ...
                    + blend * linear_slope * d_d_dq1 *  U_trans;
    grad_Uattr_q2 = Katt * c * 2 * (q(2) - qd(2)) / b^2 * (1 - blend) ...
                    + (d_sigma_dq2 * linear_slope * (dist_to_goal - rad_thr) * U_trans) ...
                    + blend * linear_slope * d_d_dq2 *  U_trans;
    
    % Gabungkan komponen-komponen untuk mendapatkan gradien Uattr
    grad_Uattr = [grad_Uattr_q1; grad_Uattr_q2];
    
    % Attractive force adalah negatif dari gradien Uattr
    Fattr = -grad_Uattr;
end