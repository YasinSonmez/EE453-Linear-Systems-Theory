% Given A and C check detectibality
a=sym('a');
s=sym('s');
l_1=sym('l_1');
l_2=sym('l_2');
l_3=sym('l_3');

A = [1 1 0; 0 0 1; 1 0 1];
B = [1; a; 1];
C = [1 a 1];
D = [0];

% Kalman observability matrix
K_o = [C; C*A; C*A^2] %adjust this to size of matrices
rank_K_o = rank(K_o)

eigs = eig(A)
for i = 1:size(eigs,1) 
   rank_i =  rank([eigs(i)*eye(size(A,1))-A; C]);
   fprintf('Eigenvalue= %s, rank= %d \n', eigs(i), rank_i)
   % be careful this doesn't give imaginal output for eigenvalues correctly
end
% Check the unobservable eigenvalues to be on OLHP for stabilizability,
% detectability

% To find all polynomials that can be satisfied
a_s = charpoly(A);
a_s = a_s(:,2:end).';
M = [1 a_s(1) a_s(2); 0 1 a_s(1); 0 0 1].'; % Adjust this according to size



rowspace = transpose(colspace(sym(transpose(M*K_o))))
l = [l_1; l_2; l_3]; %adjust size accordingly
alpha_minus_a = rowspace*l % this is equal to alpha - a, find alpha from here
M*K_o*l