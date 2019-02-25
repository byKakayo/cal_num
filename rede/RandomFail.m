function Cnew = RandomFail(nc,C,a,Centup)

Cnew = C;
for ic=1:nc
  numrand = rand();
  if(numrand < a)
    Cnew(ic) = Centup;
  end
end

end
