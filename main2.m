% addpath rtb common smtb
clearvars
clc
close all
%% Deklaracja zmiennych 
%[ mm ]
links_lenght = [ 311, 2090, 1050, 168, 30];
% [ rad ]
deg = pi / 180;
given_angles = [30*deg 10*deg -60*deg -30*deg 15*deg 0 ];


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
forward_kinematic = Manipulator.fkine(given_angles);
figure()
subplot(121)
Manipulator.plot(given_angles);
%% Inverse kinematic 
inverse_kinematic = Manipulator.ikcon(forward_kinematic,given_angles);
subplot(122)
Manipulator.plot(inverse_kinematic);
disp(inverse_kinematic/deg);