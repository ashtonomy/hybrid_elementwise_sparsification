% Implementation of Algorithm 1 from Kundu et al.
% Image source: http://letopis.msu.ru/peoples/2174

file_path = "data/mnist_train.csv";
save_dir = "mnist_output";

% Sergei
%A = imread(file_path);
%A = im2double(rgb2gray(A));
%imshow(A);

% MNIST for digit 7
A = readtable(file_path);
A = A{:, :};
disp(A(1:10,1:10));
A = A(A(:,1)==7, :);
A(:, 1) = [];

eps = 0.05;
delta = 0.1;
sparse_sketch = algo_1(A, eps, delta, save_dir);

