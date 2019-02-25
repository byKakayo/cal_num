function A = MatAssTemp(N)
  nunk = N*N;
  A = zeros(nunk,nunk);
  for i=2:N-1 
    for j=2:N-1
      Ic = ij2n(i,   j,   N);  A(Ic,Ic) =  4;
      Ie = ij2n(i+1, j,   N);  A(Ic,Ie) = -1;
      Iw = ij2n(i-1, j,   N);  A(Ic,Iw) = -1;
      In = ij2n(i,   j+1, N);  A(Ic,In) = -1;
      Is = ij2n(i,   j-1, N);  A(Ic,Is) = -1;
    end
  end
  A = sparse(A);
end
