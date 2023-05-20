function [y] = fgv1(x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% a pont kordinátánként végzi a műveletet
y = exp(sqrt(log(x.^4+1)));
end