a=sym('a');
s=sym('s');

A = [-1 0 0; 0 2 0; 0 0 -3];
B = [2;0;5];
C = [0 0 1];
D = [0];

% Kalman reachability matrix
K_r = [B A*B A^2*B] %adjust this to size of matrices
rank_K_r = rank(K_r)

echelon1 = rref(K_r) % find pivots here
R = K_r(:,[1 2]); % replace pivots here

M = [R eye(size(A,1))];
echelon2 = rref(M) % find pivots again here
S = M(:,[4]); %replace the pivots
V = [R S]

A_hat = inv(V)*A*V %take q*q upper left part
B_hat = inv(V)*B
C_hat = C*V