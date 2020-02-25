function [ rot ] = quat_rotmat( quat )
%UNTITLED5 Summary of this function goes here
%  quternion translate into rotation matrix
   rot = [ quat(1)^2 + quat(2)^2 - quat(3)^2 - quat(4)^2 ,2*quat(2)*quat(3) + 2*quat(1)*quat(4) , 2*quat(2)*quat(4)-2*quat(1)*quat(3)
          2*quat(2)*quat(3)-2*quat(1)*quat(4) , quat(1)^2 - quat(2)^2 + quat(3)^2 - quat(4)^2 , 2*quat(3)*quat(4)-2*quat(1)*quat(2)
          2*quat(2)*quat(4)+2*quat(1)*quat(3) , 2*quat(3)*quat(4)-2*quat(1)*quat(2) , quat(1)^2 - quat(2)^2 - quat(3)^2 + quat(4)^2 ];
          
           


end

