function [] = pat(branch,k)
point = [40 60 0]; %final goal point
while k~= 0
    b = branch(k,:);
    point = [point;b];
    k = b(3);
end
plot(point(:,2),point(:,1),'k', 'LineWidth', 2);