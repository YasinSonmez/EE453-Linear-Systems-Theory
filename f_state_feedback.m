% Find state feedback if controllable
a=sym('a');
s=sym('s');
A = [-4 2 3; 1 -3 -1; -2 2 1];
B = [2*a+1; -1 ;a+1];

A = [1 1 0; 0 0 1; 1 0 1];
B = [1; 28; 1];
C = [1 28 1];
D = [0];

% Kalman controllability matrix
K_r = [B A*B A^2*B] %adjust this to size of matrices
rank_K_r = rank(K_r)

a_s = charpoly(A);
a_s = a_s(:,2:end);

alpha_s = [16.8 43.2 56]; % Input intended polynomial coefficients 
M = [1 a_s(1) a_s(2); 0 1 a_s(1); 0 0 1]; % Adjust this according to size

K = (alpha_s-a_s)*inv(M)*inv(K_r) % K feedback matrix