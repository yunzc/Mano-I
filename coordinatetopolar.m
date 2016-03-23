function [r, theta] = coordinatetopolar(x,y)
%UNTITLED Summary of this function goes here
%   convert cartesian coordinates to polar
r = (x.^2 + y.^2).^0.5;
theta = asin(y/x);
end

