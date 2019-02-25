clear ;

% Problem definition:

% Geometry
%N1 = 27;
%N2 = 63;
%L = 2.7;

N1 = 15;
N2 = 15;
L = 1.0;
delta = L / (N1-1);

% Parametros fisicos
sigma = 1.0; %Tensao da membrana

% Assembly mass and stiffness matrizes
[K M] = MatMembrane(N1,N2,sigma,delta);

% Compute generalized eigenvalues and eigevectors
[V D] = eig(K,M);

% Plot
j = 6; %Eigenmode to be plotted
zz=reshape(V(:,j),N1,N2);
%surf(zz);
%contourf(zz');

#for i=1:1000
#  surf(zz*sin(0.1*i));
#  axis([0 N1 0 N2 -.24 .24]); 
#  pause; 
#end

lam = diag(D);
ome = sqrt(lam);

[x y1]=emedia(0.01,100,lam,3e-2);
[x y2]=emedia(0.01,100,lam,7e-2);
[x y3]=emedia(0.01,100,lam,2e-1);
loglog(x,y1,'linewidth',2, x,y2,'linewidth',2, x,y3,'linewidth',2)
