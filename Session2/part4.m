clc;clear all;close all;
load ex2_data.mat;
%%
R=eye(2,2);
Q=eye(2,2);
N=eye(2,2);

%  lqe  Kalman estimator design for continuous-time systems.
%     Given the system
%         x = Ax + Bu + Gw            {State equation}
%         y = Cx + Du + v             {Measurements}
%     with: E{ww'} = Q,    E{vv'} = R,    E{wv'} = N
[L,P,E] = lqe(A,B1,C2,Q,R,N);

%%
% simulate the estimator difference

A_diff = (A-L*C2);
B_diff = [B1 -L];
C_diff=eye(3);
D_diff = zeros(3,4);

ss_diff=ss(A_diff,B_diff,C_diff,D_diff);

t = 0:0.01:5;
std_dev=1;
w=std_dev.*randn(2,size(t,2));
v=std_dev.*randn(2,size(t,2));

figure(1);clf;
lsim(ss_diff,[w;v],t);
