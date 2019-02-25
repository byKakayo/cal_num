function [nv, nc, conec, C, coord] = RedeHidraBairro(n,m,CH,CV)

% funcao que constroi o grafo de malha retangular uniforme
%  ("n" pontos horizontais "m" pontos verticais)
%
%   REDE
%
%   X-----X-----X-----X-----X-----X
%   |     |     |     |     |     |
%   X-----X-----X-----X-----X-----X
%   |     |     |     |     |     |
%   X-----X-----X-----X-----X-----X
%   |     |     |     |     |     |
%   n+1---X-----X-----X-----X-----X
%   |     |     |     |     |     |
%   1-----2-----3-----4-----5-----n
%      I    II    III
%
%   INDEXACAO da matriz conec:
%     As (n-1)*m primeiras linhas sao as conectividades horizontais.
%     Na linha (n-1)*m+1 iniciam-se as conectividades verticais,
%     dadas sequencialmente por:
%     (1,n+1), (2,n+2), ... , (n,n+n), ... , (n+1,n+n+1), ... , (n-1)*m + (m-1)*n.

nv = n*m;
nc = (n-1)*m + (m-1)*n;

for i=1:n
  for j=1:m
    ig = i + (j-1)*n;
    coord(ig,1) = i;
    coord(ig,2) = j;
  end
end

% Loop sobre canos horizontais
for j=1:m
  for i=1:n-1
  k = (j-1)*(n-1) + i;
  conec(k,1) = (j-1)*n + i;
  conec(k,2) = (j-1)*n + i+1;
  C(k,1) = CH;
  end
end

% Loop sobre canos verticais
for i=1:n
  for j=1:m-1
  k = (n-1)*m + (j-1)*n + i;
  conec(k,1) = i + (j-1)*n;
  conec(k,2) = i + j*n;
  C(k,1) = CV;
  end
end

return

end
