clear;

N1 = 40;
N2 = 40;
L = 1.0;
delta = L / (N1-1);
sigma = 1;
Ri = 0.15;
Re = 0.45;

[K M] = MatMembrane(N1,N2,sigma,delta,Ri,Re);
[V D] = eig(K,M);

lam = diag(D);
ome = sqrt(lam);

j = 1;
zz=reshape(V(:,j),N1,N2);
contourf(zz');
