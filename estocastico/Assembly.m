function A = Assembly(nv, nc, conec, C)
   A = zeros(nv);
   for k=1:nc
     p = conec(k,1);
     q = conec(k,2);
     aux = [C(k) -C(k) ; -C(k) C(k)];
     A([p q],[p q]) =  A([p q],[p q]) + aux;
   end
end
