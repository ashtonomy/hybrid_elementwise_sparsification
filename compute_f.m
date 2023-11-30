function f_alpha = compute_f(A, alpha, eps)
    %  Parameterization for s from Kundu et al. 2017
    %   Returns f(alpha)
    
    rho_squared = compute_rho_squared(A, alpha);
    gamma = compute_gamma(A, alpha);
    f_alpha = rho_squared + gamma * eps * norm(A) / 3;

    end