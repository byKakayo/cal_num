function P = ResolveRede(nv,nc,conec,C)
	 
  A = Assembly(nv,nc,conec,C);
 
  houseconsumo = 0.1;
  [Atilde b] = NewBuildSystem(nv,A,houseconsumo);

  P = sparse(Atilde) \ b;

end
