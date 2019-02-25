function Kglo = rigidez(nbars, nv, conec, modu, coord)
% nbars nro de barras, nv nro de nos
% modu(1:nbars) valor de E*A em cada barra
% coord coordenadas dos nos

Kglo=zeros(2*nv); % Zerar a matriz
for k=1:nbars
  Kbarra=zeros(4);
  ia = conec(k,1);  ib = conec(k,2);
  Xa = coord(ia,:); Xb = coord(ib,:);
  d = (Xb-Xa)';
  L0 = norm(d);
  aux = modu(k)/(L0^3);
  Mat = aux*d*d';
  Kbarra = [ Mat -Mat ; -Mat Mat ];

  % Indices globais em que temos que montar a Kbarra
  % Lembrar: 2 * (i - 1) + j
  loc2glo=[ 2*ia-1; 2*ia ; 2*ib-1; 2*ib ];

  % Montar a matriz da barra na matriz global
  for i=1:4
    for j=1:4
      iglo=loc2glo(i);
      jglo=loc2glo(j);
      Kglo(iglo,jglo) = Kglo(iglo,jglo) + Kbarra(i,j);
    end
  end
end

end
