function [ k ] = com_coe_cal( coefi  , norm_mag)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    k = coefi(1)* (norm_mag-coefi(3)) + coefi(2);

end

