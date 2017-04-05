clc;clear all;close all;
load ex1_data;

Ts=1;
sys1 = ss(A,B,C,D,1);

%% a)
eig(A)

%% b)

%% c)
tzero(A,B,C,D)

%% d)

zz=tzero(A,B,C,D)
zeta=zz(1); % choose one of the transmission zeros 

M=[zeta*eye(length(A))-A -B; C D]; 
z=null(M); 

x0=z(1:length(A),1); 
u0=z(length(A)+1:length(z),1);

%% e) we have 3 inputs so there are 3 polynomials in the num of the transfer function

[num,den]=ss2tf(A,B,C,D,1);
disp(roots(num(1,:)));

figure(1);clf;
pzmap(sys1);

%%