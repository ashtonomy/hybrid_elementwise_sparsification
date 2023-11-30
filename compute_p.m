function p_ij = compute_p(one_norm, sq_two_norm, A_ij, alpha)
    % Equation 11 from Kundu et al. 2017
    %   Computes sampling probabilities
    
    if A_ij == 0
        p_ij = 0.0;
    else
        p_ij = alpha * abs(A_ij) / one_norm;
        p_ij = p_ij + (1-alpha) * (A_ij^2) / sq_two_norm;
    end
    
    end