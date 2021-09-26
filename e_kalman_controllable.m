a=sym('a');
s=sym('s');

A = [1 -1 2; 0 0 1; 1 1 1];
B = [1; 0; 1];

% Kalman controllability matrix
K_r = [B A*B A^2*B] %adjust this to size of matrices
rank_K_r = rank(K_r)

eigs = eig(A);

% Check for controllable eignevalues
% If rank <n then uncontrollable
for i = 1:size(eigs,1) 
   rank_i =  rank([eigs(i)*eye(size(A,1))-A B]);
   fprintf('Eigenvalue= %s, rank= %d \n', eigs(i), rank_i)
end