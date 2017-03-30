sys_tf = tf([1],[1 7 12]);
%%
Ac=[-7 -12;
    1 0 ]
Bc = [1; 0];

[V,D,W] = eig(Ac);
Bc'*W
%%
Ao = Ac';
Co=Bc';

[V,D,W] = eig(Ao);
Co*V
