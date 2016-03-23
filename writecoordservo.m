%coordinatewrite with servo 

keeplooping = true;
while keeplooping    
    prompt1 = 'xCoordinate: ';
    x = input(prompt1);
    prompt2 = 'yCoordinate: ';
    y = input(prompt2);
    [r,zeta] = coordinatetopolar(x,y);
    [thetawrite,phiwrite] = disttoangfunction(r);
    writePosition(s2,thetawrite);
    writePosition(s1,phiwrite);
    display(zeta);
    zetawrite = (zeta*360/2/pi+63)/180
    writePosition(s3, zetawrite);
end