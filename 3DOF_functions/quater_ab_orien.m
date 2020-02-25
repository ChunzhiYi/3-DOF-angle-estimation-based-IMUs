function [q_s_g] = quater_ab_orien(gyr,acc, mag, quat_initial, num_seg, fs)
%for details, please refer to "Estimating Three-Dimensional Body Orientation 
%Based on an Improved Complementary Filter for Human Motion Tracking"
%   gyr, angular rates of IMU
%   acc, accelerations of IMU
%   mag, the magnetic field measurements of IMU
%   quat_initial, the initial value of the integration
%   num_seg, number of lower-limb segments
%   fs, sampling frequency
%   the return value, q_s_g is a quaternion that represents the absolute
%   orientation of IMU, 4XN
 beta=1.5; % weighted coeficient on acc
 N = [50*sin(pi/3) , 0 , 50*cos(pi/3)]'; % magnetic field vector in the global frame 
 G = [0, 0  , -9.8]'; % gravity acceleration in the global frame
 coe = coe_fus(mag,acc,gyr,num_seg);
 e = length(gyr(:,1));
 b = 1;
 q_FQA1(:,1) = quat_initial;
 for i = b:1:e
    q_FQA1(:,i-b+2) = FQA_quat(mag(i,:)' , acc(i,:)');
    norm_mag = norm(N - quat_rotmat(q_FQA1(:,i-b+2))*mag(i,:)') + beta * norm(G - quat_rotmat(q_FQA1(:,i-b+2))*acc(i,:)');
    k = com_coe_cal(coe , norm_mag);
    q_inte(:,i-b+1) = integrate_quat(gyr(i,:)' , q_FQA1(:,i-b+1) , fs);
    q_s_g(:,i-b+1) = Complementary_quat( q_inte(:,i-b+1) , q_FQA1(:,i-b+2), 0.1*k);                        
    q_s_g(:,i-b+1) = q_s_g(:,i-b+1) / norm(q_s_g(:,i-b+1));
 end
end

