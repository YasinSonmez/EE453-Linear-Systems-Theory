% Find stabilizability and K matrix for MIMO systems
a=sym('a');
s=sym('s');
c_1=sym('c_1');
c_2=sym('c_2');

A = [-a -a-2 0; 0 2 0; -a-4 -a-2 4];
B = [1 1; -1 -1; 2 0];


% Check if cyclic (chapoly=minpoly)
charpoly_A = charpoly(A)
minpoly_A = minpoly(A)

% Find M matrix
a_s = charpoly(A);
a_s = a_s(:,2:end);
M = [1 a_s(1) a_s(2); 0 1 a_s(1); 0 0 1]; % Adjust this according to size

alpha_s = [-a -a -a]; % Input intended polynomial coefficients 

% Multiply B with q
B = B*[-1;2]

% Kalman controllability matrix
K_r = [B A*B A^2*B] %adjust this to size of matrices
rank_K_r = rank(K_r)

% Bass-Gura formula
K = (alpha_s-a_s)*inv(M)*inv(K_r) % K feedback matrix