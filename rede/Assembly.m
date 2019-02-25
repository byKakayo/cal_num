function A = Assembly(nv, nc, conec, C)

A = zeros(nv);
for k=1:nc
  aux = C(k);
  p = conec(k,1);
  q = conec(k,2);
  A(p,p) = A(p,p) + aux;
  A(q,q) = A(q,q) + aux;
  A(p,q) = A(p,q) - aux;
  A(q,p) = A(q,p) - aux;
end 

end
