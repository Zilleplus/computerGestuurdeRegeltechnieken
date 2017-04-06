clc;clear all;close all;
load ex2_data.mat;
%% a)
ss_or=ss(A,B2,C2,D1);
R=eye(2); % size(B2) = 3     2
Q=eye(3);
[K,S,E] = lqr(ss_or,Q,R);

spec = eig(A-B2*K);
K1_ = place(A',C2',spec-0.1);
L1=K1_'; % page 165 equivalent problems...

disp(norm(sort(spec-0.1) - sort(eig(A-L1*C2))));

K2_ = place(A',C2',spec.*10);
L2=K2_'; % page 165 equivalent problems...

disp(norm(sort(spec.*10) - sort(eig(A-L2*C2))));
%% b)

L=L1; % change me to L1(slow) or L2(fast) 
std_dev=1; % change me to add more/less noise

A_diff = (A-L*C2);
B_diff = [B1 -L];
C_diff=eye(3);
D_diff = zeros(3,4);

ss_diff=ss(A_diff,B_diff,C_diff,D_diff);

t = 0:0.01:5;
w=std_dev.*randn(2,size(t,2));
v=std_dev.*randn(2,size(t,2));

x0=[0 0 0]'-[1 1 1]';

figure(1);clf;
lsim(ss_diff,[w;v],t,x0);