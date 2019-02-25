
function [A b] = SetBCTemp(A, N, omega)
	nunk = N*N;
	b = zeros(nunk,1);

	h = 1.0/(N-1);

	% Paredes verticais
	for j=1:N
		Ic = ij2n(1,j,N); A(Ic,Ic) = 1; b(Ic) = 0;
		Ic = ij2n(N,j,N); A(Ic,Ic) = 1; b(Ic) = (sin(2*pi*omega*(j-1)*h))^2;
	end

	% Paredes horizontais
	for i=1:N
		x = (i-1)*h;
		TB = 4*(1-x)*x;
		Ic = ij2n(i,1,N); A(Ic,Ic) = 1; b(Ic) = TB;
		Ic = ij2n(i,N,N); A(Ic,Ic) = 1; b(Ic) = TB;
	end
end


