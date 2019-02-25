function [x, num_iter] = iterativo(A, b, x0, MAXIT, TOLr, method) 

[n, m] = size(A);
if(n ~= m) 
  error('System is not square\n')
end

flag_grad = 0;

if(strcmp(method,'Direct'))
  M = A;
elseif(strcmp(method,'Jacobi')) % Jacobi 
  M = diag(diag(A));
elseif (strcmp(method,'Gauss-Seidel')) % Gauss-Seidel 
  M = tril(A);
elseif(strcmp(method,'Gradients')) % Gradientes
  M = eye(n);
  flag_grad = 1;
elseif(strcmp(method,'luinc')) % LU incompleta
 opts.type = 'crout';
 opts.droptol = 1e-2;
 [l, u] = ilu(A,opts);
 M = l*u;
else
  error('Method not recognized\nOptions are:\n Direct\n Jacobi\n Gauss-Seidel\n Gradients\n luinc\n');
end

xold = x0;
beta = 1.0;
for iter=1:MAXIT
  r = A*xold - b; norm(r)
  d = - M \ r;
  if(flag_grad) beta = r'*r / (r'*A*r); end
  xnew = xold + beta*d;
  if(norm(xnew-xold,inf) < TOLr) break ; end
  xold = xnew; 
end
x = xnew;
num_iter = iter;


