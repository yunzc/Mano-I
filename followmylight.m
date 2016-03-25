%The robot will follow my light, my guidance, the far reach of octotech 
cam = webcam('Integrated Webcam');
preview(cam)
figure;
light = 1;
while light==1
    X = 0;
    Y = 0;
    img = snapshot(cam);
    sizeimg = size(img);
    for i=1:sizeimg(1)
        for j =1:sizeimg(2)
            if img(i,j,1)> 250
                X = i;
                Y = j;
                %break
            end
        end
    end
    if X == 0 && Y == 0
        light = 0;
    end
    %scale for Mano 
    x = -X + sizeimg(1);
    y = -Y + sizeimg(2);
    scale = 1;
    if 7/sizeimg(1)<12/sizeimg(2)
        scale = 7/sizeimg(1);
    else
        scale = 12/sizeimg(2);
    end
    xwrite = x*scale;
    ywrite = y*scale
    xmano = -xwrite+16
    ymano = y*scale-sin(0.2*pi)*9;
    scatter(xmano,ymano)
    hold on
    [r,zeta] = coordinatetopolar(xmano,ymano);
    [thetawrite,phiwrite] = disttoangfunction(r);
    writePosition(s2,thetawrite);
    writePosition(s1,phiwrite);
    zetawrite = (zeta*360/2/pi+63)/180;
    writePosition(s3, zetawrite);
    pause(0.5);
    
end
clear cam