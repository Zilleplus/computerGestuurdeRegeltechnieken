clc;clear all;close all;
load ex2_data.mat;
%%
% simulate intial system
ss_or=ss(A,B2,C2,D1);
figure(1);
pzmap(ss_or);

%% a) Should the derivation here include the matrix C1?? as we can chose these
% X = lyap(A,B,C) solves the Sylvester equation:
%         A*X + X*B + C = 0

% pole placement with K1
G=rand(2,3);
spectrum=[-3 1 0; -1 -3 0; 0 0 -1];
% eig(spectrum)
X = lyap(A,-spectrum,-B2*G);
K1=G*inv(X);

ss_k1=ss(A-B2*K1,B2,C2,D1);
figure(2);subplot(1,2,1);
pzmap(ss_k1);

% pole placement with K1
rng(1);
G=rand(2,3);
spectrum=[-10 2.5 0; -2.5 -10 0; 0 0 -12.1];
% eig(spectrum)
X = lyap(A,-spectrum,-B2*G);
K2=G*inv(X);

ss_k2=ss(A-B2*K2,B2,C2,D1);
figure(2);subplot(1,2,2);
pzmap(ss_k2);

%% b) 
B1_ = B1*[1 0; 0 0;];
figure(3);
ss_k1_mod=ss(A-B2*K1,B1_,C2,D1);
impulse(ss_k1);
figure(4);
ss_k1_mod=ss(A-B2*K2,B1_,C2,D1);
impulse(ss_k2);