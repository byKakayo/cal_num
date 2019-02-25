clear ;
% Dados do problema
N = 81;  % Numero de pontos em cada direcao
nunk = N*N; % Numero de incognitas

omega = 3;

tic
A = MatAssTemp(N);
[A b] = NewSetBCTemp(A, N, omega);
tas = toc; % Medimos tempo para montagem

tic
T0 = zeros(nunk,1);
[T, num_iter] = iterativo(A, b, T0, 10000, ...
			  1.0e-6, 'luinc');
tsol = toc; % Medimos tempo para resolver
% Plotar resultados
Taux=reshape(T,N,N);
surf(Taux);
