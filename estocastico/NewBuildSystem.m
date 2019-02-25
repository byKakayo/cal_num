function [Atilde b] = NewBuildSystem(nv,A,houseconsumo)
	 
  Atilde = A;

  % Cada casa consumira houseconsumo
  b = -houseconsumo * ones(nv,1);

  % Colocamos o reservatorio sempre no no 1
  Atilde(1,:)=0; Atilde(1,1)=1; 
  b(1) = 5;

end
