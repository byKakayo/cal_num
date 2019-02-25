function [e1 e2] = calculabase1(a,b)
e1 = a/norm(a);
p = (e1'*b)*e1;
e2 = (b-p)/norm(b-p);
end

