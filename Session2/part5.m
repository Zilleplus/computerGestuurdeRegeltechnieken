clc;clear all;close all;
load ex2_data.mat;
%% find feekback k via lqr
ss_or=ss(A,B2,C2,D1);
R=eye(2); % size(B2) = 3     2
Q=eye(3);
[K,S,E] = lqr(ss_or,Q,R);

%% find estimator L via kallman filter

R=eye(2,2);
Q=eye(2,2);
N=eye(2,2);

%  lqe  Kalman estimator design for continuous-time systems.
%     Given the system
%         x = Ax + Bu + Gw            {State equation}
%         y = Cx + Du + v             {Measurements}
%     with: E{ww'} = Q,    E{vv'} = R,    E{wv'} = N
[L,P,E] = lqe(A,B1,C2,Q,R,N);

%% combine K and L into compensator

A_compensator = [A-B2*K B2*K; zeros(size(A-L*C2,1),size(A-B2*K,2)) A-L*C2 ];
B_compensator = [B1 B1; B1 -L];
% u=-K*x_est=-K(xk-xk_tilde)=-K*xk + K*xk_tilde
C_compensator = [C1 zeros(2,3);-K K];
D_compensator = zeros(4,4);

ss_compensator=ss(A_compensator,B_compensator,C_compensator,D_compensator);

t = 0:0.01:5;
std_dev=1;
w=std_dev.*randn(2,size(t,2));
v=std_dev.*randn(2,size(t,2));

figure(1);clf;
lsim(ss_compensator,[w;v],t);

%% what are the poles of the closed loop system?
disp('The poles of the closed loop system are:');
disp(eig(A_compensator));