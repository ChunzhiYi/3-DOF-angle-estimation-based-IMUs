function [ quat_3 ] = quat_mul( quat_1 ,quat_2 )
%UNTITLED7 Summary of this function goes here
%   quaternion multiple quat_1*quat_2 
    quat_mat = [quat_1(1) -quat_1(2) -quat_1(3) -quat_1(4)
                quat_1(2) quat_1(1) quat_1(4) -quat_1(3)
                quat_1(3) -quat_1(4) quat_1(1) quat_1(2)
                quat_1(4) quat_1(3) -quat_1(2) quat_1(1)];
    quat_3=quat_mat*quat_2;


end

