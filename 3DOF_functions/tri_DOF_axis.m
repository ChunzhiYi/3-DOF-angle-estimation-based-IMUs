function [j1, j2, j3, j4, q_corr] = tri_DOF_axis(gyr1,gyr2, mag1, mag2, acc1, acc2,  quaternion_lower,quaternion_upper)
%estimate the coordinates of three joint axes
%   mag1, mag2 --- the readings of magnetometers
%   gyr1, gyr2 --- the readings of gyroscopes
%   acc1, acc2 --- the readings of accelerometers
%   j1, j2 --- the coordinates of the main axis described in sensor-fixed frames [s1] and [s2]
%   j3, j4 --- the other two rotational axes of a 3-DoF joint described in
%              [s1] and [s2] respectively
%   q_corr --- the unification quaternion
iteration = 0;
j3 = [0 0 0]';
j4 = [0 0 0]';
fi = [1,1,1,1]';
phi = fi;
fi_new = [200,200,200,200]';
f_acc = 0.2;
f_mag = 0.5;
k_coe_initial = [f_mag f_acc]';
tic;
while iteration <= 6 
%% estimate the main axis

   j1j2fi = singleDOF_axis(gyr1,gyr2,fi, j3,j4);
   j1 = j1j2fi(1:3,1);
   j2 = j1j2fi(1:3,2);
   if sign(j2(3)) < 0 
        j2 = -j2;
   end
   fi = j1j2fi(:,3);
 
%% unification of reference frames [g1]-->[g2] according to j1 and j2, variables: f_mag, f_acc

    [kt_acc, thetat] =  uni_quater(acc1,acc2,quaternion_lower,quaternion_upper);
    [kt_mag, thetat_mag] =  uni_quater(mag1,mag2,quaternion_lower,quaternion_upper);
    [k_coe, q_corr] = unification(thetat_mag, thetat, k_coe_initial, quaternion_lower, quaternion_upper, j1,j2, kt_mag, kt_acc);
    k_coe_inital = k_coe;
        
    
%% estimate the other two axes of the joint, whole calculation performed in [g2]

   [phi, j3, j4] =  twoDOF_axis(quaternion_lower,quaternion_upper, phi, fi, q_corr, gyr1, gyr2, j1, j2);

  

    
iteration = iteration + 1;
end
toc;
disp(['iteration time:', num2str(toc)]);
end

