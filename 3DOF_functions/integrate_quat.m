function [ q_oumiga ] = integrate_quat( oumiga , q_initi , fs)                %q_initi 4X1向量 ， oumiga 3X1向量
% 用角速度成四元数得到四元数的导数，再积分得到四元数的方式
 
   q_initi = q_initi/norm(q_initi);
%   derivative * time + initial quaternion state
    oumiga_quat = [ 0 ; oumiga];


    q_oumiga = 0.5/fs * quat_mul(q_initi,oumiga_quat) + q_initi;

    



end

