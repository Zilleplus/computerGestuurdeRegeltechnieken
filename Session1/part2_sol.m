load ex1_data;
Ts=1;
sys1 = ss(A,B,C,D,Ts);

%% a) controllability

C_= ctrb(A,B);
disp(['rank of the controllability matrix should be 7 but is ' num2str(rank(C_))]);
[V,d]=eig(A');
disp(B'*V);

%% b) observability
OO=obsv(A,C);
disp(['rank of the observability matrix should be 7 but is ' num2str(rank(OO))]);
[V,d]=eig(A); C*V


%% c)

%% d)
sys=ss(A,B,C,D,-1); 
sysm=minreal(sys); 
[Am,Bm,Cm,Dm]=ssdata(sysm);
