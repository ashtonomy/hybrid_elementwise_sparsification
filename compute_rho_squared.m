function rho_2 = compute_rho_squared(A, alpha)
    % Equation 7 from Kundu et al. 2017
    %   Computes rho squared
    
    smallest_sv = svds(A,1,'smallest');
    one_norm = norm(A, 1);
    sq_frob_norm = norm(A, "fro")^2;

    ksi_A = arrayfun(@(a) compute_ksi(sq_frob_norm, one_norm, a, alpha), A);
    max_col_sum = max(sum(ksi_A, 1));
    max_row_sum = max(sum(ksi_A, 2));

    rho_2 = max(max_row_sum, max_col_sum) - smallest_sv;
    
    end