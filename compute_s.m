function s = compute_s(A, f_a, eps, delta)
    % Equation 11 from Kundu et al. 2017
    %   Computes an optimal s given a data
    %   matrix A, parameter alpha, eps, and failure-
    %   bound delta

    disp("Computing s*...")
    
    [m, n] = size(A);

    s = 2 / ((eps * norm(A))^2);
    s = s * log((m+n)/delta);
    s = s * f_a;

    end