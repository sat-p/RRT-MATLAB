function [p i] = near_point(a,branch)
[m n] = size(branch);
a = repmat(a,m,1);
bran = branch(:,1:2);
diff = a-bran;
dist = diff(:,1).^2+diff(:,2).^2;
len = sort(dist);
i = find(dist == len(1));
p = bran(i(1),:);

