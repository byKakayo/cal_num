function [A b] = SetBCTempSim(A, N, TL, TR, TB, TT)
  nunk = N*N;
  b = zeros(nunk,1);
  % Paredes verticais
  for j=1:N
    Ic = ij2n(1,j,N); 
    b(:) = b(:) - A(:,Ic)*TL;
    b(Ic) = TL;
    A(:,Ic) = 0; 
    A(Ic,Ic) = 1;
    
    Ic = ij2n(N,j,N); 
    b(:) = b(:) - A(:,Ic)*TR;
    b(Ic) = TR;
    A(:,Ic) = 0; 
    A(Ic,Ic) = 1;
  end
  % Paredes horizontais
  for i=1:N
    Ic = ij2n(i,1,N); 
    b(:) = b(:) - A(:,Ic)*TB;
    b(Ic) = TB;
    A(:,Ic) = 0; 
    A(Ic,Ic) = 1;
    
    Ic = ij2n(i,N,N); 
    b(:) = b(:) - A(:,Ic)*TT;
    b(Ic) = TT;
    A(:,Ic) = 0; 
    A(Ic,Ic) = 1;
  end
end


