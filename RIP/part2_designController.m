clc;clear all;close all;
load('model.mat');
% Running this file will simulate the entire process of selecting the
% proper matrix values starting from the default values.
%% parameters for simulation
Ts=1/200; % sample time used to create figures
power_noise=0;%1*10^-8;
theta_d=1; % desired location
x0=[0;0;0;0]; % intial condition
simTime=10;
sys=ss(A,B,C,D);
%% default values for QR

Q=[
    4 0   0   0 ;
    0  20  0   0 ;
    0  0   0   0 ;
    0  0   0   0 ;
    ];

R=1.5;

[K,~,~] = lqr(sys,Q,R);

sim('part2_LQR1_sim');

name='1_default_QR';

part2_plotter( sim_data,input_data,name );
%% lower R, increase voltage send to motor

Q=[
    4 0   0   0 ;
    0  20  0   0 ;
    0  0   0   0 ;
    0  0   0   0 ;
    ];

R=0.5;

[K,~,~] = lqr(sys,Q,R);

sim('part2_LQR1_sim');

name='2_lower_R';

part2_plotter( sim_data,input_data,name );
%% increase theta

Q=[
    10 0   0   0 ;
    0  20  0   0 ;
    0  0   0.1   0 ;
    0  0   0   0.1 ;
    ];

R=0.5;

[K,~,~] = lqr(sys,Q,R);

sim('part2_LQR1_sim');

name='3_increase_theta';

part2_plotter( sim_data,input_data,name );
%% increase alpha

Q=[
    10 0   0   0 ;
    0  60  0   0 ;
    0  0   0.1   0 ;
    0  0   0   0.1 ;
    ];

R=0.5;

[K,~,~] = lqr(sys,Q,R);

sim('part2_LQR1_sim');

name='4_increase_alpha';

part2_plotter( sim_data,input_data,name );
%% increase alpha dot

Q=[
    10 0   0   0 ;
    0  60  0   0 ;
    0  0   0.1   0 ;
    0  0   0   0.1 ;
    ];

R=0.5;

[K,~,~] = lqr(sys,Q,R);

sim('part2_LQR1_sim');

name='5_increase_alpha_dot';

part2_plotter( sim_data,input_data,name );
%% Final values for QR

Q=[
    10 0   0   0 ;
    0  60  0   0 ;
    0  0   0.1   0 ;
    0  0   0   1 ;
    ];

R=0.5;

[K,~,~] = lqr(sys,Q,R);

sim('part2_LQR1_sim');

name='final';

part2_plotter( sim_data,input_data,name );

%% only use this when you want to save stuff
% Ts=1/100; % sample time used to create figures
% theta_d=0.3; % desired location
% x0=[0.5;0;0;0]; % intial condition
% simTime=10;
% sim('part2_LQR1_sim');
% name='default_QR_with_desired'; % fill out the name you want here
% 
% fig=figure(1);clf;
% plot(sim_data.time,sim_data.Data(:,1));hold all;
% plot(sim_data.time,sim_data.Data(:,2));hold all;
% plot(sim_data.time,sim_data.Data(:,3));hold all;
% plot(sim_data.time,sim_data.Data(:,4));hold all;
% legend('\theta','\alpha','\theta_{speed}','\alpha_{speed}');
% saveas(fig,['./report/img/part2_LQR1/' name '_states.png']);
% 
% fig=figure(2);clf;
% plot(input_data.time,input_data.Data(:,1))
% saveas(fig,['./report/img/part2_LQR1/' name '_inputs.png']);