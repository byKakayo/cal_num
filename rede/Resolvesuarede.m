%CONDUTÂNCIA
clear ; 

n = 10;
m = 15;
CH = 0.1;
CV = 1.0;

a = 0.4;
Centup = 0.01;
[nv nc conec C coords] = RedeHidraBairro(n, m, CH, CV);
Cnew = RandomFail(nc, C, a, Centup);

A = Assembly(nv, nc, conec, Cnew);

natm = nv;
Pref = 0.0;
nB = 1;
QB = 10.0;
[Atilde b] = BuildSystem(nv,A, QB,nB,Pref,natm);

pressure = Atilde \ b; 

desbal = A * pressure;

% Plot the solution
%flag = 1;
%PlotaRede(coords, conec, pressure, Cnew, flag, -1, n+1, -1, m+1, '-ro');
paux=reshape(pressure,n,m);
contourf(paux',15);
%surf(paux)

% Equivalente conductivity
Ceq = QB / (pressure(nB) - Pref);

% Brute force approach
%K = zeros(nc);
%for i=1:nc  
%  for j=1:nc
%    if(i == j)
%      K(i,j) = Cnew(i);
%    end
%  end
%end

K = diag(Cnew);

D = zeros(nc,nv);
for k=1:nc
  p = conec(k,1);
  q = conec(k,2);
  D(k,p) = 1;
  D(k,q) = -1;
end

% Vetor das vazoes
J = abs(K * D * pressure);

potencia = pressure' * D' * K * D * pressure;





