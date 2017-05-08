clc;clear all;close all;
%% specifications

Rm = 2.6; % Motor Armature Resistance [ohm]
Kt = 0.00767 ; % Motor Torque Constant [Nm/A]
Km = 0.00767; % Motor Back EMF Constant [V/(rad/s)]
Kg = 70; % Motor Gear Ratio  (The output is slower)
Mum = 0.69; % Motor Efficiency 
Mug = 0.9; % Gearbox Efficiency 
Beq = 0.004; % Equivalent Viscous Damping Coefficient [N m s / rad]
g = 9.81; % Acceleration of the gravity ]m/s^2]
Jeq = 0.0044; % Arm Inertia [kg m^2] (at the rotating axis!)
r = 0.145; % Arm Length [m]
L =0.305; % Rod Length [m] 
m = 0.210; % Rod Mass [kg]

%% intermediate variables
a= Jeq + m*r^2;
b=m*L*r;
c=(4/3)*m*L^2;
d=m*g*L;
E=a*c - b^2;
G=(Mum*Mug*Kt*Km*Kg^2+Beq*Rm)/Rm;
%% lin system
A=[ 
    0 0 1 0;
    0 0 0 1;
    0 b*d/E -c*G/E 0;
    0 a*d/E -b*G/E 0;
    ];

B=[ 
    0;
    0;
    c*(Mum*Mug*Kt*Kg)/(Rm*E);
    b*(Mum*Mug*Kt*Kg)/(Rm*E)
  ];

C=eye(2,4);
D=zeros(2,1);
%% simulate the model
sys=ss(A,B,C,D);

fig=figure;
pzmap(sys);
saveas(fig,'./report/img/part1_analysis/zplot.png');

fig=figure;
step(ss);
saveas(fig,'./report/img/part1_analysis/step.png');

fig=figure;
impulse(ss);
saveas(fig,'./report/img/part1_analysis/impulse.png');
%% save the matrices and the model to use in other matlab files
save('model.mat','A','B','C','D');