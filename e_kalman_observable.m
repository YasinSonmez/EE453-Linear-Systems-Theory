a=sym('a');
s=sym('s');

A = [-6 2-a 3-a; 2*a+1 -a-5  -3*a-1; -a-2 2 a-1];
B = [3;0;2];
C = [2*a -a -2*a];
D = [0];


% Kalman observability matrix
K_o = [C; C*A; C*A^2] %adjust this to size of matrices
rank_K_o = rank(K_o)

A
eigs = eig(A)

for i = 1:size(eigs,1) 
   rank_i =  rank([eigs(i)*eye(size(A,1))-A; C]);
   fprintf('Eigenvalue= %s, rank= %d \n', eigs(i), rank_i)
end