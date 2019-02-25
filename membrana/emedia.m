function [x y] = emedia(om1,om2,lam,beta)

  x = linspace(om1,om2,1501);
  dd = (om2-om1)/1500;
  for j=1:1501
    ome = om1 + (j-1)*dd;
    s = sqrt(lam)./(sqrt((lam - ome^2).^2 + (beta*ome)^2));
    y(j) = 0.25*norm(s)^2;
    
    if (y(j) > 10000) 
      y(j) = 10000;
    end
  end

end
