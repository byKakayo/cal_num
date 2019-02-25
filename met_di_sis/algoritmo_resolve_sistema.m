clear;

disp('sistema exemplo Ax = b');
A = [4 2 -4; 2 10 4; -4 4 9]
b = [0;6;5]
disp('x = [1,0,1]');

% Decomposição LU

function [L,U] = decomp_lu(A)
	n = size(A,1);
	L = eye(n);
	U = zeros(n);

	for k=1:n
		for j=k:n
			U(k,j) = A(k,j) - L(k,1:k-1)*U(1:k-1,j);
		end
		for i=k+1:n
			L(i,k) = ( A(i,k) - L(i,1:k-1)*U(1:k-1,k))/U(k,k);
		end
	end
end


% forward subs

function y = forwsubs(L, b)
	n = length(b);
	y = zeros(n,1);

	for i=1:n
		y(i) = (b(i) - L(i,1:i-1)*y(1:i-1,1))/L(i,i);
	end
end


% backward subs

function x = backsubs(U, y)
	n = length(y);
	x = zeros(n,1);

	for i=n:-1:1
		x(i) = (y(i) - U(i,i+1:n)*x(i+1:n,1))/U(i,i);
	end
end


% resolve sistema Ax = b

function x = resolve_lu(A, b)
	tic
	[L U] = decomp_lu(A);
	y = forwsubs(L, b);
	x = backsubs(U, y);
	toc
end


% decomposição Cholesky

function H = decomp_chol(A)
	n = size(A,1);
	H = tril(A);

	for k=1:n-1
		H(k,k) = sqrt(H(k,k));
		H(k+1:n,k) = H(k+1:n,k)/H(k,k);

		for j=k+1:n
			H(j:n,j) = H(j:n,j) - H(j:n,k)*H(j,k);
		end
	end
	
	H(n,n) = sqrt(H(n,n));
end


% resolve sistema Ax = b

function x = resolve_chol(A, b)
	tic
	H = decomp_chol(A);
	y = forwsubs(H,b);
	x = backsubs(H',y);
	toc
end
