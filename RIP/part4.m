clc;clear all;close all;
load('model.mat');
%% find matrix K with LQR
sys=ss(A,B,C,D);

Q=[
    10 0   0    0 ;
    0  60 0   0 ;
    0  0   0   0 ;
    0  0   0   1 ;
    ];

% R=0.9;
R=0.5;

[K,~,~] = lqr(sys,Q,R);

%% Without figure save
Ts=1/200; % sample time used to create figures
power_noise=0;%1*10^-8;
theta_d=1; % desired location
x0=[0;0;0;0]; % intial condition
%%
Omgc=2*(2*pi); % use 2 Hz as cut off frequency