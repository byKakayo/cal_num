n = 5;
A = rand(n);
[Q R] = qr(A);
d = [1:n];
D = diag(d);
B = Q*D*Q';

[V, Lam] = MetododeFrancis(B,1.0e-6,100);


