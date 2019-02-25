clear ;

% Definimos a rede nominal
% Isto e apenas um exemplo que eu escolhi
n = 10; m = 10;
CH = 2; CV = 2;
[nv nc conec C coord] = RedeHidraBairro(n,m,CH,CV);
C(1)  = 20; C(2)   = 20; C(3)  = 20;
C(94) = 20; C(104) = 20; C(114)= 20;
C(31) = 20; C(32)  = 20; C(33) = 20;

a = 0.1; % Probabilidade de falha de um cano fino
Centup = 0.2;

% Loop de realizacoes
som = 0;
N = 4000;
for i=1:N
    Cnew = RandomFailFinos(nc,C,a,Centup); 
    P = ResolveRede(nv,nc,conec,Cnew);
    pmin = min(P);
    if(pmin < 1.15)
      som = som + 1;
    end
    nreal(i) = i;
    prob(i) =  som / i;
end

disp('A probabilidade estimada e:');
disp(som / N)
plot (nreal,prob)
