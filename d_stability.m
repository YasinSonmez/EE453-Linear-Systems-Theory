a=sym('a');
s=sym('s');
t=sym('t');

A = [-a -1 -28 -28; 1 0 0 0; 0 1 0 0; 0 0 1 0];
B = [1;0;0;0];
C = [0 1 0 0];
D = [0];

% Eigenvalues: Check stability
% charpoly(A) % use Routh Hurwitz for stability 
evals = eig(A)

% BIBO Stable if h is integrable [0, +inf]
Fis=inv(s*eye(size(A,1))-A);

h_s = simplify(C*Fis*B)

% h(t) can be calculated as following two ways
%h_t = c*ilaplace(Fis)*b
h_t = c*expm(A*t)*B

% use fplot(f) to symbolically plot or use Routh Hurwitz to find if there
% are positive poles