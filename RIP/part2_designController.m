clc;clear all;close all;
load('model.mat');
%% find matrix K with LQR
sys=ss(A,B,C,D);

Q=[
    10 0   0   0 ;
    0  60  0   0 ;
    0  0   0   0 ;
    0  0   0   1 ;
    ];

R=0.5;

[K,~,~] = lqr(sys,Q,R);

% Without figure save
Ts=1/200; % sample time used to create figures
power_noise=0;%1*10^-8;
theta_d=1; % desired location
x0=[0;0;0;0]; % intial condition
simTime=10;
sim('part2_LQR1_sim');

fig=figure(1);clf;
plot(sim_data.time,sim_data.Data(:,1));hold all;
plot(sim_data.time,sim_data.Data(:,2));hold all;
plot(sim_data.time,sim_data.Data(:,3));hold all;
plot(sim_data.time,sim_data.Data(:,4));hold all;
ylim([-3 3]);
legend('\theta','\alpha','\theta_{speed}','\alpha_{speed}');

fig=figure(2);clf;
plot(input_data.time,input_data.Data(:,1));
ylim([-5 5]);

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