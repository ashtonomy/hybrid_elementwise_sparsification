function A_tilde = algo_1(A, eps, delta, save_dir)
    % Algorithm 1 from Kundu et al. 2017
    %
    % Args
    %   A: data matrix (n x m)
    %   eps: epsilon i.e. accuracy bound
    %   delta: Failure probability bound
    
    [m, n] = size(A);
    og_mat_path = save_dir + "/original.mat";
    save(og_mat_path, "A");

    [f_a, alpha] = compute_alpha(A, eps);
    fprintf('Optimal alpha: %lf\n', alpha);
    s = compute_s(A, f_a, eps, delta);
    s = ceil(s);
    fprintf('Optimal s: %d\n', s);

    
    
    disp("Computing sampling probabilities...")

    one_norm = norm(A, 1);
    sq_two_norm = norm(A, 2)^2;
    P = arrayfun(@(a) compute_p(one_norm, sq_two_norm, a, alpha), A);
    
    disp("Creating sparse sketch...")
    
    idxs = 1:numel(A);
    sample_idxs = randsample(idxs, s, true, P(:));
    A_tilde = zeros(m,n);
    A_tilde(sample_idxs) = A(sample_idxs);
    
    workspace_path = save_dir + "/algo_1.data";
    save(workspace_path);
    a_tilde_path = save_dir + "/sparse_sketch.mat";
    save(a_tilde_path, "A_tilde"),

    end



    

