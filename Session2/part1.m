clc;clear all;close all;
load ex2_data.mat;
rng(1);
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

% pole placement with K2
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
ss_k1_mod=ss(A-B2*K1,B1_,C2,D1);
ss_k2_mod=ss(A-B2*K2,B1_,C2,D1);

% -- help
% For state-space models only:
%     [y,t,x] = impulse(sys)
%     (length of t) × (number of outputs) × (number of inputs)
% --

% red=k1 -3+-j and -1
% bleu=k2 -10+-j2.5 and -12.1
figure(3); %right half is zero as an impulse to input 2 has no use
impulse(ss_k1_mod,'r',ss_k2_mod,'b');