load ex1_data;
% A=diag(rand(1,7));
sys1 = ss(A,B,C,D);
%%
% a) what are the poles of the system:
poles = eig(A);
pzmap(sys1);

% b) Is the system stable?
% no, there are poles on the right size

%%
% c) what are the transmission zeros
transmission_zeros=tzero(sys1);
z=transmission_zeros(4);

Y = [
    eye(7,7).*z-A -B;
    C D
 ];
nullspace = null(Y);
%  lsim(SYS,U,T,X0)
k=10;
input_sys1 = zeros(3,k);
for k=1:10
    input_sys1(:,k) =  nullspace(8:10).*(z^k);
end
t=linspace(0,10,k);

lsim(sys1,input_sys1,t,nullspace(1:7)) ;

%% e) transfer function
transfer_function = tf(sys1)';
figure(1);clf;
subplot(2,1,1);
pzplot(transfer_function(1,1))
subplot(2,1,2);
pzplot(transfer_function)

% roots(transfer_function.Numerator{1,1})
