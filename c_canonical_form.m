% SISO TF to SS define h=b/a
b = [1 0 2 5];
a = [1 1 4 3];
[A,B,C,D] = tf2ss(b,a);

% MIMO
s = tf('s');
H=[(s^3+32*s^2+115*s+84)/(s^4+10*s^3+35*s^2+50*s+24)];
sys = ss(H);

% minimal representation
minimal = ss(H,'minimal')

% Observable companion
canon1 = canon(sys,'companion') 

% Controllable companion
A_control = canon1.A.'
B_control = canon1.B.'
C_control = canon1.C.'
D_control = canon1.D.'