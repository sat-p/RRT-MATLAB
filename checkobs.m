function f = checkobs(a,b)  
%gives 0 if cuts the obs
y = [a(1) b(1)];
x = [a(2) b(2)];
x1 = [20,80,80,50,50,70,70,20];
y1 = [20,20,60,60,50,50,30,30];
x2 = [10,30,30,20,20,10];
y2 = [50,50,60,60,90,90];
if inpolygon(a(2),a(1),x1,y1) % check random point is inside
    f=0;
    return
end
if inpolygon(a(2),a(1),x2,y2) % check random point is inside
    f=0;
    return
end
p = polyxpoly(x1,y1,x,y); % check random point is cooides
f = isempty(p);
if f==1
    p = polyxpoly(x2,y2,x,y);
    f = isempty(p);
end