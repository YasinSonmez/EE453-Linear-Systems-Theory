% Find stabilizability and K matrix if not controllable
a=sym('a');
s=sym('s');
c_1=sym('c_1');
c_2=sym('c_2');
c_3=sym('c_3');

A = [1 1 0; 0 0 1; 1 0 1];
B = [1; 28; 1];
C = [1 28 1];
D = [0];

% Kalman controllability matrix
K_r = [B A*B A^2*B] %adjust this to size of matrices
rank_K_r = rank(K_r)

eigs = eig(A);

% Check for controllable eignevalues
% If rank <n then uncontrollable
for i = 1:size(eigs,1) 
   rank_i =  rank([eigs(i)*eye(size(A,1))-A B]);
   fprintf('Eigenvalue= %s rank= %d \n', eigs(i), rank_i)
end
% Check the uncontrollable eigenvalues to be on OLHP for stabilizability

% To find all polynomials that can be satisfied
a_s = charpoly(A);
a_s = a_s(:,2:end);
M = [1 a_s(1) a_s(2); 0 1 a_s(1); 0 0 1]; % Adjust this according to size

rowspace = transpose(colspace(sym(transpose(K_r*M))))
c = [c_1 c_2 c_3] %adjust size accordingly
alpha_minus_a = c*rowspace % this is equal to alpha - a, find alpha from here