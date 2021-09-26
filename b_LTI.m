%%% Given input u and initial state x_0 computes the output of the system
s=sym('s');
u=sym('u');
a=sym('a');
b=sym('b');
c=sym('c');
u_laplace = 1/s; % define u here

A = [-2*28 -28*28 -1; 1 0 0; 1 1 -1];
B = [1; 0; 0];
C = [1 1 0];
D = [0];
x0=[1;0;0]; % define x_0 here

Fis=inv(s*eye(size(A,1))-A)

yzs=simplify(C*Fis*B*u_laplace)
yzs_t = ilaplace(yzs)

yzi=simplify(C*Fis*x0)
yzi_t = ilaplace(yzi)

y=simplify(yzs+yzi)
%Then take inverse laplace of total y
y_t = ilaplace(y)
vpa(y_t)
