clear ;

% Carregar dados

% Conectividades
load('conec.txt');
[nb aux] = size(conec);

% Coordenadas dos nos
load('coord.txt');
[nv aux] = size(coord);

% Properties materiais
% Consideramos que todas as barras
% tem o mesmo modulo de Young e area
A = 1.0e-5;
E = 1.0e11;
EA = E*A;
modu = EA*ones(nb,1);

% Visualizar trelica nao deformada
xx = coo2x(coord);
plotsimple2(xx,conec,-1,11,-4,2,'-ro');

% Montar matriz de Rigidez global
tic
Kglo = rigidez(nb, nv, conec,modu,coord);
tassembly = toc

% Modificar sistema para impor restricoes e forcas
Ktilde = Kglo;
iden = eye(2*nv);
b = zeros(2*nv,1);

% Mudando o sistema para impor as restricoes
% Restringir deslocamente horizontal e vertical
% dos nos 1 e 2
Ktilde(1:4,:) = iden(1:4,:);
Ktilde(41:44,:) = iden(41:44,:);

[L U] = lu(Ktilde);


b(42) = b(42) - 1000.0;

% Resolver o sistema de equacoes com barra
% ou aplicar um metodo iterativo
tic
aux = L \ b;
desloc = U \ aux;
tsolve = toc;


% Plotar configuracao deformada
% exagerando um pouco os deslocamentos
hold on;
plotsimple2(xx+4*desloc,conec,-1,11,-4,2,'-bo');
disp(size(desloc));
