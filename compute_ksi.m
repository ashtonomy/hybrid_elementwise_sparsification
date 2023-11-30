function ksi_ij = compute_ksi(sq_frob, one_norm, A_ij, alpha) 
    % Equation 8 from Kundu et al. 2017
    %   Computes ksi matrix of A at ij
    
    if A_ij == 0
        ksi_ij = 0;
    else
        denom = (alpha * sq_frob) / ((abs(A_ij) * one_norm)) + (1-alpha);
        ksi_ij = sq_frob / denom;
    end
    end