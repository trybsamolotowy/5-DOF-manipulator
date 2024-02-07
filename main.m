% addpath rtb common smtb
%% KINEMATYKA PROSTA
clearvars
clc
close all

d1 = 311;
d3 = 2090;
d4 = 1050;
d5 = 168;
d6 = 30;

syms theta d a alfa
A = [
 cos(theta), -sin(theta) * cos(alfa), sin(theta) * sin(alfa), a * cos(theta);
 sin(theta), cos(theta) * cos(alfa), - cos(theta) * sin(alfa), a * sin(theta);
 0, sin(alfa), cos(alfa), d;
 0, 0, 0, 1
 ];
syms theta1 
A_1 = subs(A, [theta, d, a, alfa], [theta1, d1, 0, 0]);
disp('A_1')
disp(A_1)
syms alfa2
A_2 = subs(A, [theta, d, a, alfa], [0, 0, 0, alfa2]);
disp('A_2')
disp(A_2)
syms alfa3 
A_3 = subs(A, [theta, d, a, alfa], [0, d3, 0, alfa3]);
disp('A_3')
disp(A_3)
syms alfa4
A_4 = subs(A, [theta, d, a, alfa], [0, d4, 0, alfa4]);
disp('A_4')
disp(A_4)
A_5 = subs(A, [theta, d, a, alfa], [0, d5, 0, 0]);
disp('A_5')
disp(A_5)
syms theta6
A_6 = subs(A, [theta, d, a, alfa], [theta6, d6, 0, 0]);
disp('A_6')
disp(A_6)

T = A_1*A_2*A_3*A_4*A_5*A_6;
T=simplify(T);s
disp(T)

deg = pi / 180;

%T_1 = vpa(subs(T, [ theta1 alfa2 alfa3 alfa4 theta6 ], [30*deg 45*deg 30*deg 40*deg 15*deg ]));
%disp(T_1)

%% Deklaracja zmiennych 
%[ mm ]
links_lenght = [ 311, 2090, 1050, 168, 30];
% [ rad ]
deg = pi / 180;
given_angles = [30*deg 45*deg 30*deg 40*deg 15*deg 0 ];
%% Reprezentacja DH:
DH = [
 Link([given_angles(1), links_lenght(1) ,0, 0],'modified'), ...
 Link([0, 0, 0, given_angles(2)],'modified'), ...
 Link([0, links_lenght(2), 0, given_angles(3)],'modified'), ...
 Link([0, links_lenght(3), 0, given_angles(4)],'modified'), ...
 Link([0, links_lenght(4), 0, 0],'modified'), ...
 Link([given_angles(5), links_lenght(5), 0, 0],'modified')
];
%% Forward kinematic 
Manipulator = SerialLink(DH);
Manipulator.plot(given_angles)

