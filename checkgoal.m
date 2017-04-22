function f = checkgoal(a,b) 
%give 0 if it collids

% g1 = [55,65,65,55];
% g2 = [35,35,45,45];
g1 = [59.5,60.5,60.5,59.5];
g2 = [39.5,39.5,40.5,40.5];
% g1 = [89,91,91,89];
% g2 = [89,89,91,91];
c1 = [a(2) b(2)];
c2 = [a(1) b(1)];
f = polyxpoly(c1,c2,g1,g2);
f = isempty(f);

