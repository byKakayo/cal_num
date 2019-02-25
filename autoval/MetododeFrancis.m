function [V, D] = MetododeFrancis(A,tol,maxit)

n = size(A,1);
V = eye(n);
err = inf;
k = 0;

while (err > tol && k < maxit)
  [Q R] = qr(A);
  A = R*Q
  V = V*Q;
  err = max(max(abs(tril(A,-1))));
  k = k + 1;
end

 D = diag(diag(A));

end
