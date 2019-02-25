function [K M] = MatMembrane(N1,N2,sigma,delta)
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
    K = K/(delta^2);
  for i=1:N1
    for j=1:N2
      xi=(i-1)*delta;
      yj=(j-1)*delta;
      Ic=ij2n(i,j,N1);
      if ((i==1 || i==N1) || (j==1 || j==N2))
         K(Ic,:)=0; K(:,Ic)=0; K(Ic,Ic)=1e9;
      end
%      if (i>=j)
%         K(Ic,:)=0; K(:,Ic)=0; K(Ic,Ic)=1e9;
%      end
      rhoij = 1.0;% Programar outro, e.g. rhoij = 1 + xi*yj; 
      eij = 1.0;
      M(Ic,Ic)=rhoij*eij;
    end
  end
  K = sparse(K);
  M = sparse(M);
end
