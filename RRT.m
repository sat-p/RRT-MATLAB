clear
clc
%% arina 
x = [-5 110];
y = [-5 110];
scatter(x,y,'.');
%% intial and goal points
hold on
gx = [59,61,61,59];
gy = [39,39,41,41];
% gx = [89,91,91,89];
% gy = [89,89,91,91];
ip = [10,80];
scatter(ip(2),ip(1),'*');
patch(gx,gy,'r')
%% obstacles
x1 = [20,80,80,50,50,70,70,20];
y1 = [20,20,60,60,50,50,30,30];
x2 = [10,30,30,20,20,10];
y2 = [50,50,60,60,90,90];
patch(x1,y1,'g')
patch(x2,y2,'g')
%%
r = 0;
range = 1;
branch = [ip,r];  %all points in tree


%%
for i=1:10000
    a = randsample(95,2); % generate random point
    a = a';
    [b,k] = near_point(a,branch); % check nearest point in tree
    g = checkobs(a,b); % check obstacle collision
    if g==0 
        continue;   % if collision go back to for loop
    end
    f = checkgoal(a,b); % check intersection with goal point
    if f==0
        plot(x1,y1);
        pat(branch,k);  % back track the best path
        return;
    end
    x = a(2)-b(2);
    m = (a(1)-b(1))/x ;  %slop
    t = atan(m);
    if x<0
        t = pi+t;
        y = b(1)+range*sin(t);
        x = b(2)+range*cos(t);
    else
        y = b(1)+range*sin(t);
        x = b(2)+range*cos(t);
    end
    c = [y x];
    c = [c k(1)];
    branch = [ branch;c]; %adding point in branch
    y1 = [y b(1)];
    x1 = [x b(2)];
    %scatter(a(2),a(1))
     plot(x1,y1,'m'); %ploting new point
%      pause(.00001)
end

