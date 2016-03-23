function [sortinorder] = sortbyorder(a)
%sortbyorder
%   sort list by a starting point and then sort by distance to previous
%   point 
b = a;
sizeofb = size(b);
for i=1:sizeofb(1)-1
    mindist = ((b(i,1)-b(i+1,1)).^2+(b(i,2)-b(i+1,2)).^2).^0.5;
    for j=i+1:sizeofb(1)
        dist = ((b(i,1)-b(j,1)).^2+(b(i,2)-b(j,2)).^2).^0.5; 
        if dist < mindist
            mindist = dist;
            tempx = b(j,1);
            tempy = b(j,2);
            b(j,1) = b(i+1,1);
            b(j,2) = b(i+1,2);
            b(i+1,1) = tempx;
            b(i+1,2) = tempy;
        end
    end
end
sortinorder = b;
end

