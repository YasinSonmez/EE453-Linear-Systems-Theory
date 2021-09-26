%%% Calculation of matrix exponential using Jordan form
syms t

A = [-1 1 1; -1 -3 0; 1 1 -2];

tf = isdiag(A); % Find if diagonalizable
[V,J] = jordan(A)

expJt = diag(diag(exp(J*t)))
expAt = V*expJt*inv(V)

% easier way of computing matrix exponential
e_at = expm(A*t)


% useful commands:
charpol = charpoly(A);
minpol = minpoly(A);
evals = eig(A);
[evecs,evalss] = eig(A);