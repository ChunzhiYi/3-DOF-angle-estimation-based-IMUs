function [ q_oumiga ] = integrate_quat( oumiga , q_initi , fs)                %q_initi 4X1���� �� oumiga 3X1����
% �ý��ٶȳ���Ԫ���õ���Ԫ���ĵ������ٻ��ֵõ���Ԫ���ķ�ʽ
 
   q_initi = q_initi/norm(q_initi);
%   derivative * time + initial quaternion state
    oumiga_quat = [ 0 ; oumiga];


    q_oumiga = 0.5/fs * quat_mul(q_initi,oumiga_quat) + q_initi;

    



end

