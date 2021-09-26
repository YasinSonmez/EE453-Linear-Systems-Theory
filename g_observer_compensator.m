% find observer based compensator
a=sym('a');
s=sym('s');

A = [1 1 0; 0 0 1; 1 0 1];
B = [1; 28; 1];
C = [1 28 1];
D = [0];

% Eigenvalues: Check stability
% charpoly(A) % use Routh Hurwitz for stability 
evals = eig(A)

% BIBO Stable if h is integrable [0, +inf]
Fis=inv(s*eye(size(A,1))-A);

C*Fis*B
h_s = simplify(C*Fis*B)