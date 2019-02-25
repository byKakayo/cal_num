function idum = plotsimple2(xx,conec,xmin,xmax,ymin,ymax,str)
%% plota estado xx
[nb aux] = size(conec);
for i=1:nb
	xyloc(1,1) = xx(2*conec(i,1)-1);
	xyloc(1,2) = xx(2*conec(i,1));
	xyloc(2,1) = xx(2*conec(i,2)-1);
	xyloc(2,2) = xx(2*conec(i,2));
        plot(xyloc(:,1),xyloc(:,2),str);
        hold on;
end
hold off;
axis([xmin xmax ymin ymax]);
end
