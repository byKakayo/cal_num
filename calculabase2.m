function B = calculabase2(A)
# Orthogonalizes the columns of A by Gram-Schmidt
[m,n]=size(A);
B = A; 
for k=1:n
 V=B(:,1:k-1)'*B(:,k);
 B(:,k)=B(:,k)-B(:,1:k-1)*V;
 rkk=norm(B(:,k));
 B(:,k)=B(:,k)/rkk;
end
end
