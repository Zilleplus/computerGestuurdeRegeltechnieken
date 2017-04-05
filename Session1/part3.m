sys_tf = tf([1],[1 7 12]);
%%
Ac=[-7 -12;
    1 0 ]
Bc = [1; 0];

[V,D,W] = eig(Ac);
disp(['controllable?']);
disp(Bc'*W);
disp(['observable?']);
a=1; % doesnt work with 3 and 4
[1 a]*V
%% the same can be done here, but i am to lazy to type it out
Ao = Ac';
Co=Bc';

[V,D,W] = eig(Ao);
Co*V
