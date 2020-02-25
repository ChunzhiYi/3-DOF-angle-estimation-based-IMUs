function [theta,q_dis_j2] = main_axis_angles(j1, j2, o1, o2, quaternion_lower, quaternion_upper,q_corr)

 % j1  [s1]--->[b1]
   j1_x = j1;
   j1_z = cross(j1,o1);
   j1_z = j1_z/norm(j1_z);
   j1_y = cross(j1_z,j1_x);
   j1_y = j1_y/norm(j1_y);
   R_s1_b1_j1 = [j1_x , j1_y , j1_z];
 % j2  [s2]--->[b2]
   j2_x = j2;
   j2_z = cross(j2,o2);
   j2_z = j2_z/norm(j2_z);
   j2_y = cross(j2_z,j2_x);
   j2_y = j2_y/norm(j2_y);
   R_s2_b2_j2 = [j2_x , j2_y , j2_z];
   b = 1;
   e = length(quaternion_lower(1,:));
 for i = b:1:e
 % [s1]--->[g] lower segment
     R_s1_g = quat_rotmat(quaternion_lower(:,i-b+1));
 % [s2]--->[g] upper segment
     R_s2_g = quat_rotmat(quaternion_upper(:,i-b+1));
 % Çó½â½Ç¶È
    R_b1_b2 = (R_s1_b1_j1)' * R_s1_g * quat_rotmat(q_corr(:,i-b+1)) * (R_s2_g)' * R_s2_b2_j2;
    theta1(:,i-b+1) = real(acos(R_b1_b2(2,2))/pi*180);
    theta2(:,i-b+1) = real(acos(-R_b1_b2(3,3))/pi*180);
    theta3(:,i-b+1) = real(asin(R_b1_b2(2,3))/pi*180);
    theta4(:,i-b+1) = real(asin(-R_b1_b2(3,2))/pi*180);
    q_dis_j2 =  [cos(theta4(:,i-b+1)/2) ; -sin(theta4(:,i-b+1)/2) * j2] ;
 end
 theta = theta4;

end

