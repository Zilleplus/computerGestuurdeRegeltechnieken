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

%% with tested parameters
Ts=1/200; % sample time used to create figures
var_noise_theta=1*10^-8;
var_noise_alpha=1*10^-8;

theta_d=1; % desired location
x0=[0;0;0;0]; % intial condition
fc=3;
Omgc=fc*(2*pi); % use 2 Hz as cut off frequency
simTime=10;
sim('part3_LQR2_sim');

part3_plot( sim_data,sim_data_estimator,input_data,'normal_parameters' );

%% with noise derived from tests
Ts=1/200; % sample time used to create figures
var_noise_theta=1*10^-4;
var_noise_alpha=1*10^-6;

theta_d=1; % desired location
x0=[0;0;0;0]; % intial condition
fc=2;
Omgc=fc*(2*pi); % use 2 Hz as cut off frequency
simTime=10;
sim('part3_LQR2_sim');

part3_plot( sim_data,sim_data_estimator,input_data,'noise_experiments' );