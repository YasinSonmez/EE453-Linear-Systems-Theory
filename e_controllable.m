a=sym('a');
s=sym('s');
t_f=sym('t_f');
t_0=sym('t_0');
x_f=sym('x_f');
x_0=sym('x_0');
tau = sym('tau');

A = [0 -3; 1 -4];
B = [1;0];
C = [5 -15];
D = [0];


% Reachability grammian
phi = expm(A*(t_f-tau));
G_r_integrand = simplify(phi*B*transpose(B)*transpose(phi));
G_r = simplify(int(G_r_integrand,tau, [t_0 t_f]))
rank_G_r = rank(G_r)

% Min energy input
phi = expm(A*(t_f-tau));
phi2 = expm(A*(t_f-t_0));
min_inp = transpose(B)*transpose(phi)*inv(G_r)*(x_f-phi2*x_0)

x_f=[5]; x_0=[-2]; t_f=3; t_0=1;
min_inp_num = subs(min_inp)
%vpa(min_inp_num) to get rid of exp.
vpa(min_inp_num)
