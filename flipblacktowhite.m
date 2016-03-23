function [newimage] = flipblacktowhite(BW)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
sizeBW = size(BW);
newimage = zeros(sizeBW);
for i = 1:sizeBW(1)
    for j = 1:sizeBW(2)
        if BW(i,j) == 1
            newimage(i,j) = 0;
        else
            newimage(i,j) = 1;
        end
    end
end

