function gamma = compute_gamma(A, alpha)
    % Equation 6 from Kundu et al. 2017
    %   Computes gamma

    [m, n] = size(A);

    one_norm = norm(A, 1);
    two_norm = norm(A, 2);
    sq_frob = norm(A, "fro")^2;
    
    A_g = zeros(m,n);
    partial_prod = (1-alpha) * (one_norm / sq_frob);

    for i = numel(A)

        if A(i) ~= 0
            A(i) = one_norm / (alpha + partial_prod*abs(A(i)));
        end
        
    end

    gamma = max(A_g(:)) + two_norm;
    
    end