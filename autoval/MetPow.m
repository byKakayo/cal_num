clear ;

n = 5;
C = rand(n);
[Q R] = qr(C'*C);
d = [1:n];
D = diag(d);
A = Q*D*Q';

option = 1; % Metodo das potencias
%option = 2; % Metodo das potencias inversas
%option = 3 % Metodo das potencias inversas com deslocamento

if(option == 1)
  M = A;
elseif(option == 2) 
  M = inv(A);
elseif(option == 3)
  q  = 1.4;
  M = inv(A- q*eye(n));
end

x = rand(n,1);
y = x / norm(x);
lam = y'*M*y;
for k=1:10000
  x = M*y;
  y = x / norm(x);
  lamnew = y'*M*y;
  if(abs(lamnew - lam) < 1e-14) 
   break ;
  end
  lam = lamnew
end

if(option == 1)
 lam
elseif (option == 2)
 1/lam
elseif (option == 3)
 1/lam + q
end




