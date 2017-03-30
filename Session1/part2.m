load ex1_data;
% A=diag(rand(1,7));
sys1 = ss(A,B,C,D);
%%
% a) controllability
control = zeros(7,21);
for l=1:7
    k=3*l;
    control(:,k:k+2) = A^(k-1)*B;
end
controllability = rank(control)

[V,D,W] = eig(A);
B'*W
% for k=1:7
%     B(:,1)'*V(:,k) 
%     B(:,2)'*V(:,k)
%     B(:,3)'*V(:,k)
% end


%%
% b) observable
observe = zeros(21,7);
for l=1:7
    k=3*l;
    observe(k:k+2,:) = C*A^(k-1);
end
controllability = rank(observe);

[V,D,W] = eig(A);
C*V

%% C)
% which modes are not controllable -> 4 and 5
% which modes are not observable -> 4 and 7

% if eigenvalues that are not obs are stable -> detectable
% if eigenvalues that are not con are stable -> stabilisable

%% D)
minreal(sys1)




