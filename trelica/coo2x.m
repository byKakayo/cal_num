function x = coo2x(coord)

nv=length(coord);
for i=1:nv
 x(2*i-1,1)=coord(i,1);
 x(2*i,1)  =coord(i,2);
end

end
