clc;clear all;close all;
load ex2_data.mat;
%% a)
ss_or=ss(A,B2,C2,D1);
R=eye(2); % size(B2) = 3     2
Q=eye(3);
[K,S,E] = lqr(ss_or,Q,R);

spec = eig(A-B2*K);
K_ = place(A',C2',spec-0.1);
L=K_';

%%


