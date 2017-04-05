clc;clear all;close all;
load ex2_data.mat;
%% 
ss_or=ss(A,B2,C2,D1);
R=eye(2); % size(B2) = 3     2
Q=eye(3)*1000;
%% a)

%  are  Algebraic Riccati Equation solution. 
%      X = are(A, B, C) returns the stablizing solution (if it
%      exists) to the continuous-time Riccati equation:
%  
%             A'*X + X*A - X*B*X + C = 0
%      assuming B is symmetric and nonnegative definite and C is
%      symmetric.

X = are(A,B2*inv(R)*B2',Q);

%% b)

% lqr  Linear-quadratic regulator design for state space systems. 
%     [K,S,E] = lqr(SYS,Q,R,N) calculates the optimal gain matrix K
%     such that:
%  
%       * For a continuous-time state-space model SYS, the state-feedback
%         law u = -Kx  minimizes the cost function
%  
%               J = Integral {x'Qx + u'Ru + 2*x'Nu} dt
%  
%         subject to the system dynamics  dx/dt = Ax + Bu
%  
%       * For a discrete-time state-space model SYS, u[n] = -Kx[n] minimizes
%  
%               J = Sum {x'Qx + u'Ru + 2*x'Nu}
%  
%         subject to  x[n+1] = Ax[n] + Bu[n].
%  
%     The matrix N is set to zero when omitted.  Also returned are the
%     the solution S of the associated algebraic Riccati equation and
%     the closed-loop eigenvalues E = EIG(A-B*K).
%  
%     [K,S,E] = lqr(A,B,Q,R,N) is an equivalent syntax for continuous-time
%     models with dynamics  dx/dt = Ax + Bu

[K,S,E] = lqr(ss_or,Q,R);



%%
% check if they are equal
norm(X-S)

%% c) plug it back into the system
figure;
B1_ = B1*[1 0; 0 0;];
ss_mod=ss(A-B2*K,B1_,C2,D1);
impulse(ss_mod);