function [ref,mag1,mag2,acc1,acc2,gyr1,gyr2] = data_import(joint_num)

addpath(genpath('D:\MATLAB 2019\MATLAB 2019a Install\bin\3DOF_functions'));
load data_cal;
if joint_num == 1 % thigh
    acc1 = pelacc1;
    gyr1 = pelgyr1;
    mag1 = pelmag1;
    acc2 = thighacc1;
    gyr2 = thighgyr1;
    mag2 = thighmag1;
    ref(:,1) = hip_flev;
    ref(:,2) = hip_abdv;
    ref(:,3) = hip_inrv;
else if joint_num == 2 % knee
        acc1 = thighacc1;
        gyr1 = thighgyr1;
        mag1 = thighmag1;
        acc2 = shankacc1;
        gyr2 = shankgyr1;
        mag2 = shankmag1;
        ref(:,1) = kne_flev;
        ref(:,2) = kne_abdv;
        ref(:,3) = kne_inrv;
    else if joint_num == 3 % ankle
            acc1 = shankacc1;
            gyr1 = shankgyr1;
            mag1 = shankmag1;
            acc2 = shankacc1;
            gyr2 = shankgyr1;
            mag2 = shankmag1;
            ref(:,1) = ank_plat;
            ref(:,2) = ank_abd;
            ref(:,3) = ank_inr;
         end
end
end

end

