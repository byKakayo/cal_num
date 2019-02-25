for i=1:n
  xnew(i)=b(i);
  for j=1:n
    if (j != i)
      xnew(i)=xnew(i)-A(i,j)*xold(j);
    end
    end
  xnew(i)=xnew(i)/A(i,i);
end
