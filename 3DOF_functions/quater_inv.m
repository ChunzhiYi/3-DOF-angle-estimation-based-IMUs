function [ quat_inv ] = quater_inv( quat )
%UNTITLED3 Summary of this function goes here
%   calculate quaternion inverse
   quat_pi = [quat(1) -quat(2) -quat(3) -quat(4)]';
   quat_inv= quat_pi/(norm(quat_pi));

end

