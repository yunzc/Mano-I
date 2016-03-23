%imageprocessingtest
I = imread('yun.png');
BW = im2bw(I,0.8);
sizeBW = size(BW);
coordtowrite = [];
%started with 2 since 1-1 = 0
tic;
for i = 2:sizeBW(1)-1
    for j = 2:sizeBW(2)-1
        upvalue = BW(i-1,j);
        leftvalue = BW(i,j-1);
        rightvalue = BW(i,j+1);
        downvalue = BW(i+1,j);
        if BW(i,j) == 0 && (upvalue == 1 || leftvalue == 1 || rightvalue == 1 || downvalue == 1)
            new = [i j];
            coordtowrite = [coordtowrite ; new];
        end
    end
end
toc;
%do it again for other direction (horizontal then vertical)
% previous_value = 1;
% tic;
% for i = 1:sizeBW(2)
%     for j = 1:sizeBW(1)
%         if BW(j,i) ~= previous_value
%             new = [j i];
%             yn = ismember(coordtowrite,new,'rows');
%             zeromatrix = zeros(size(yn));
%             %see if there is are any 1s in the ismemeber vector 1 indicates
%             %exsistence
%             if yn == zeromatrix
%                 coordtowrite = [coordtowrite ; new];
%             end
%         end
%         previous_value = BW(j,i);
%     end
% end
sortpoints = sortbyorder(coordtowrite);
%basically resolution
select_points = sortpoints(1:10:end,:);
finalsize = size(select_points);
maxX = max(select_points(:,1));
minX = min(select_points(:,1));
maxY = max(select_points(:,2));
minY = min(select_points(:,2));
for i = 1:finalsize(1)
    select_points(i,1) = select_points(i,1)-minX;
    select_points(i,2) = select_points(i,2)-minY;
end
if (maxY-minY) > 2*(maxX-minX)
    scalefacor = 14/(maxY-minY);
else
    scalefactor = 6/(maxX-minX);
end
%^this is dues to the limitation of Mano I 
finalwrite = scalefactor*select_points;
sizer = size(finalwrite);
figure;
for i=1:sizer(1)
    x = finalwrite(i,1);
    y = finalwrite(i,2);
    scatter(x,y)
    hold on 
    pause(0.1);
end





        
