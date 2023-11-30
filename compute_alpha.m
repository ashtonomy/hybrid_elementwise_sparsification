function [f_a, alpha] = compute_alpha(A, eps)
    % Equation 10 from Kundu et al. 2017
    %   Computes an optimal alpha

    disp("Computing alpha*...")
    
    alphas = (1:10) / 10; 
    f_alphas = zeros(1,10);
    
    for i = 1:size(alphas,2)
        f_alphas(i) = compute_f(A, alphas(i), eps);
    end

    [f_a, i] = min(f_alphas);
    alpha = alphas(i);
    end