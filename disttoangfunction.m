function [thetawrite, phiwrite] = disttoangfunction(r)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
theta0 = -30;
h = 5;
L = 9.9;
R = 10.1;
m = 1;
pi = 3.14159;
syms thetaraw
sol = vpasolve(R*cos(asin((r+m*sin(thetaraw)-L*cos(thetaraw))/(R)))-m*cos(thetaraw)-L*sin(thetaraw)==h,thetaraw);
thetadeg = sol*360/2/pi; 
phiraw = (asin((-L*cos(sol)+m*sin(sol)+r)/R))*360/2/pi;
thetawritedeg = thetadeg - theta0;
phiwritedeg = 94-(phiraw -thetadeg);
thetawrite = double(thetawritedeg/180);
phiwrite = double(phiwritedeg/180);

end

