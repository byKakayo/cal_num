function [Atilde b] = BuildSystem(nv, A, QB, nB, Pref, natm)

Atilde = A;
Atilde(natm,:) = 0.0;
Atilde(natm,natm) = 1.0;
b = zeros(nv,1);
b(natm) = Pref;
b(nB) = QB;

end
