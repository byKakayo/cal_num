function [out] = fl(p)

b = 2;
t = 11;
m = -1021;
M = 1024;
% valores 2, 53, -1021, 1024 correspondem a double

ndig_frac=1024;
if (abs(p) > b^M - b^(M-t))
  disp('overflow');
end

if (p == 0)
  disp('zero');
  out = 0;
  return
end

if (abs(p) < b^(m-1))
  disp('underflow');
  out = 0;
  return
end

if (p>0)
 s = 1;
elseif (p<0)
 s = -1;
end
p = abs(p);

n = floor(p);
f = p - n;

% parte inteira 
i = 1;
de(i) = 0;
while ( n ~= 0 )
q = floor(n/b);
r = n - q*b;
de(i) = r;
i = i + 1;
n = q;
end

ndig_int = i - 1;

% parte fracionaria
pdnn = 0;
for i=1:ndig_frac
    g = f*b;
    digf = floor(g);
    if (digf > 0 && pdnn==0)
       pdnn=i;
    end
    df(i) = digf;
    m = g - floor(g);
    f = m;
end

% exponente e
if (ndig_int > 0)
 e = ndig_int;
else
 e = - (pdnn - 1);
end
% mantissa m
if (ndig_int >= t)
   for i=1:t
    m(i)=de(ndig_int+1-i);
   end
elseif (ndig_int > 0)
   for i=1:ndig_int
    m(i)=de(ndig_int+1-i);
   end
   for i=1:t-ndig_int
    m(ndig_int+i)=df(i);
   end
else
   for i=1:t
    j=pdnn-1+i;
    if (j <= ndig_frac)
     m(i)=df(pdnn-1+i);
    else
     m(i)=0;
    end
   end
end
% para ver resultados parciais descomentar
%de
%df(1:pdnn+t-1)
%size(df)
%s
%m
%e
% reconstrucao do numero em base b
% truncando a ndig_frac digitos apos a virgula (para imprimir na tela)
out = 0;
for k=1:t
    out = out + m(k)*b^(-k);
end
out = s * out * b^e;

return

end
