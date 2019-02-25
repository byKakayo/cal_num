clear ;

D = [-3 0 ; 0 1];
A = D;


hold on ;
v = [0.4 ; 0.6];

h = quiver(0.0, 0.0, v(1),v(2))
set (h, "color", "b","maxheadsize", 0.01);

hold on ;
v1 = A*v;
h1 = quiver(0.0, 0.0, v1(1),v1(2))
set (h1, "color", "r", "maxheadsize", 0.01);

hold on ;
v2 = A*v1;
h2 = quiver(0.0, 0.0, v2(1),v2(2))
set (h2, "color", "c", "maxheadsize", 0.01);

hold on ;
v3 = A*v2;
h3 = quiver(0.0, 0.0, v3(1),v3(2))
set (h3, "color", "g", "maxheadsize", 0.01);

hold on ;
v4 = A*v3;
h4 = quiver(0.0, 0.0, v4(1),v4(2))
set (h4, "color", "m", "maxheadsize", 0.005);

hold on ;
v5 = A*v4;
h5 = quiver(0.0, 0.0, v5(1),v5(2))
set (h5, "color", "m", "maxheadsize", 0.005);



