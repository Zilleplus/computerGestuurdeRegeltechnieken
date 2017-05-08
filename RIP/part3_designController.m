clc;clear all;close all;
load('model.mat');
%% find matrix K with LQR
sys=ss(A,B,C,D);

Q=[
    5 0   0    0 ;
    0  60 0   0 ;
    0  0   0   0 ;
    0  0   0   1 ;
    ];

R=0.9;

[K,~,~] = lqr(sys,Q,R);

%% Without figure save
Ts=1/200; % sample time used to create figures
power_noise=0;%1*10^-8;
theta_d=1; % desired location
x0=[0;0;0;0]; % intial condition
Omgc=2*(2*pi); % use 2 Hz as cut off frequency
simTime=10;
sim('part3_LQR2_sim');

fig=figure(1);clf;
plot(sim_data.time,sim_data.Data(:,1));hold all;
plot(sim_data.time,sim_data.Data(:,2));hold all;
plot(sim_data.time,sim_data.Data(:,3));hold all;
plot(sim_data.time,sim_data.Data(:,4));hold all;
legend('\theta','\alpha','\theta_{speed}','\alpha_{speed}');

fig=figure(2);clf;
plot(input_data.time,input_data.Data(:,1))

fig=figure(3);clf;
plot(sim_data.time,sim_data.Data(:,3));hold all;
plot(sim_data_estimator.time,sim_data_estimator.Data(:,3)); hold all;
plot(sim_data.time,sim_data.Data(:,4));hold all;
plot(sim_data_estimator.time,sim_data_estimator.Data(:,4)); hold all;
legend('\theta_{speed}','estimator \theta_{speed}','\alpha_{speed}', ...
    'estimator \alpha_{speed}');