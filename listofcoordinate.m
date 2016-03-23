traceoutline
listcoor = finalwrite;

sizelist = size(listcoor);
numrow = sizelist(1);
figure
prevx = 0;
prevy = 0;
for i=1:numrow
    x = listcoor(i,1)+11;
    y = listcoor(i,2)-sin(0.35*pi)*9;
    dist = ((x-prevx).^2+(y-prevy).^2).^0.5;
    scatter(x,y)
    hold on;
    [r,zeta] = coordinatetopolar(x,y);
    [thetawrite,phiwrite] = disttoangfunction(r);
    if dist > 1.8
        writePosition(s2,0.3);
        %liftup
        writePosition(s1,phiwrite);
        zetawrite = (zeta*360/2/pi+63)/180;
        writePosition(s3, zetawrite);
        pause(0.25);
        writePosition(s2,0.25);
        pause(0.25);
        writePosition(s2,0.2);
        pause(0.25);
        writePosition(s2,thetawrite);
        pause(0.15);
    else
        writePosition(s1,phiwrite);
        zetawrite = (zeta*360/2/pi+63)/180;
        writePosition(s3, zetawrite);
        writePosition(s2,thetawrite);
        pause(0.15); 
    end
    prevx = x;
    prevy = y;
end

