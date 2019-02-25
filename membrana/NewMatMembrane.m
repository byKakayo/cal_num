function [K M] = MatMembrane(N1,N2,sigma,delta,Ri,Re)
  nunk = N1*N2;
  K = zeros(nunk,nunk);
  M = K;
  for i=2:N1-1
    for j=2:N2-1
      Ic = ij2n(i,   j,   N1);  K(Ic,Ic) =  4;
      Ie = ij2n(i+1, j,   N1);  K(Ic,Ie) = -1;
      Iw = ij2n(i-1, j,   N1);  K(Ic,Iw) = -1;
      In = ij2n(i,   j+1, N1);  K(Ic,In) = -1;
      Is = ij2n(i,   j-1, N1);  K(Ic,Is) = -1;
    end
  end
  K = sigma*K/(delta^2);
  mask = CriaMask(N1,N2,Ri,Re,delta);
  for i=1:N1
    for j=1:N2
      Ic=ij2n(i,j,N1);
      if (mask(i,j) == 1)
         K(Ic, Ic) = 0;
      end
      rhoij = 1.0;
      eij = 1.0;
      M(Ic,Ic)=rhoij*eij;
    end
  end
  K = sparse(K);
  M = sparse(M);
end
