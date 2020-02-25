function [ euler ] = quat_euler_yzx( q )
%quternion translate to euler angles YZX
%   Detailed explanation goes here
    R_11 = q(1)^2+q(2)^2-q(3)^2-q(4)^2;
    R_31 = 2*q(2)*q(4)+2*q(1)*q(3);
    R_21 = 2*(q(2)*q(3)-q(1)*q(4));
    R_22 = q(1)^2-q(2)^2+q(3)^2-q(4)^2;
    R_23 = 2*(q(3)*q(4)+q(1)*q(2));
    afa = atan2(R_22,-R_23);
    beta = asin(R_31);
    sita = atan2(R_11,-R_31);
    euler = [afa,beta,sita]';
    
    %����three_axis_test�е�ʵ�飬���㷨�������ŷ���ǰ�YZX˳�����ν���

end

