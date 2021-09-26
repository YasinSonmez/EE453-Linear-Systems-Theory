a=sym('a');
b=sym('b');
s=sym('s');
t_f=sym('t_f');
t_0=sym('t_0');
x_f=sym('x_f');
x_01=sym('x_01');
x_02=sym('x_02');
tau = sym('tau');

A = [-1];
B = [a];
C = [2];
D = [0];

% Observability grammian
phi = expm(A*(tau-t_0));
G_o_integrand = simplify(transpose(phi)*transpose(C)*C*phi);
G_o = simplify(int(G_o_integrand,tau, [t_0 t_f]))
rank_G_o = rank(G_o);

t_0=0;
G_o = subs(G_o)

y_t = simplify(subs(C*phi*[x_01; x_02]))
y_t = collect(y_t, 'exp')