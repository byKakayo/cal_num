clear ;

N = 41;  % Numero de pontos em cada direcao
H = 1.0; % Tamanho do lado

% Setear as condicoes na borda
Told = zeros(N,N);
for j=1:N
  Told(1,j) = 0.0; 
  Told(N,j) = 0.0;
end
for i=1:N
  Told(i,1) = 0.0; 
  Told(i,N) = 20.0; 
end

tic
Tnew = Told;
for k=1:100000 %Loop de iteracoes
  for i=2:N-1 %Loop nos horizontais
    for j=2:N-1 %Loop nos verticais
      Tnew(i,j) = 0.25 * (...
                          Tnew(i-1,j) + Tnew(i+1,j) + ...
                          Tnew(i,j-1) + Tnew(i,j+1) ...
                          );
    end
  end
  if(norm(Tnew-Told,inf,'rows') < 1.0e-8) break ; end
  Told = Tnew;
end
toc

contourf(Tnew',15);
