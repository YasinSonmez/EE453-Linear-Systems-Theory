a=sym('a');
s=sym('s');

A = [0 -3; 1 -4];
B = [1;0];
C = [5 -15];
D = [0];

% Kalman observability matrix
K_o = [C; C*A] %adjust this to size of matrices
null_K_o = null(K_o, 'r')
q = rank(null_K_o)
L = [null_K_o eye(size(A,1))];
echelon = rref(L) % take the pivot columns here
P = L(:,[2]); %replace the pivots
V = [null_K_o P]

A_hat = inv(V)*A*V %take n-q*n-q bottom right part
B_hat = inv(V)*B
C_hat = C*V