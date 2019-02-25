function Cnew = RandomFailFinos(nc,C,a,Centup)

Cnew = C;
for i=1:nc
  if(C(i) == 2)
   numrand = rand();
   if(numrand < a)
    Cnew(i) = Centup;
   end
  end
end

end
