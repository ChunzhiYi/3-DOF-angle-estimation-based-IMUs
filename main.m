    clear all;
    addpath(genpath('D:\MATLAB 2019\MATLAB 2019a Install\bin\adding_programme_data\3DOF_angle'));
    addpath(genpath('D:\MATLAB 2019\MATLAB 2019a Install\bin\3DOF_functions'));
    joint_num = 1; % denotes which lower-limb joint
    [ref,mag1,mag2,acc1,acc2,gyr1,gyr2] = data_import(joint_num);
    fs = 100/1.35;
 %  No phase lag Filter
    [n,Wn]=buttord(1/fs,39/fs,1.9985,200);
    [x,y]=butter(n,Wn);
    acc1(:,1) = filtfilt(x,y,acc1(:,1))*9.8;
    acc1(:,2) = filtfilt(x,y,acc1(:,2))*9.8;
    acc1(:,3) = filtfilt(x,y,acc1(:,3))*9.8;
    gyr1(:,1) = filtfilt(x,y,gyr1(:,1));
    gyr1(:,2) = filtfilt(x,y,gyr1(:,2));
    gyr1(:,3) = filtfilt(x,y,gyr1(:,3));
    mag1(:,1) = filtfilt(x,y,mag1(:,1));
    mag1(:,2) = filtfilt(x,y,mag1(:,2));
    mag1(:,3) = filtfilt(x,y,mag1(:,3));
    
    acc2(:,1) = filtfilt(x,y,acc2(:,1))*9.8;
    acc2(:,2) = filtfilt(x,y,acc2(:,2))*9.8;
    acc2(:,3) = filtfilt(x,y,acc2(:,3))*9.8;
    gyr2(:,1) = filtfilt(x,y,gyr2(:,1));
    gyr2(:,2) = filtfilt(x,y,gyr2(:,2));
    gyr2(:,3) = filtfilt(x,y,gyr2(:,3));
    mag2(:,1) = filtfilt(x,y,mag2(:,1));
    mag2(:,2) = filtfilt(x,y,mag2(:,2));
    mag2(:,3) = filtfilt(x,y,mag2(:,3));
    
    %% estimate the joint position vectors o1 o2
     %  acc1 and acc2 denote the acceleration of each segment;
     %  w1 and w2 denote the angular rates of each segment;
     %  fs denotes the sampling frequency;
     %  the return value, o1o2, is a 3X2 matrix 
        o1o2 =  joint_position_o1o2(acc1',acc2',gyr1',gyr2',fs);
        o1 = o1o2(:,1);
        o2 = o1o2(:,2);
    
    %% estimate the absolute orientation of IMUs, [s1] --> [g1] & [s2] --> [g2]
     %  FQA_quat -- using 'FQA' to fuse mag and acc and estimate
     %  quaternion, 'X.Yun A Simplified Quaternion-Based Algorithm for Orientation...'
     %  quater_ab_orien -- dynamicall fuse FQA_quat and angular rates to estimate absolute orientaion
        % upper
        b = 2;
        quat_initial = FQA_quat(mag1(b-1,:)' , acc1(b-1,:)'); 
                       % length of Thighacc and thighmag are longer than that of thighgyr
        num_seg = 1;
        quaternion_upper = quater_ab_orien(gyr1,acc1, mag1, quat_initial, num_seg, fs);
        
        % lower
        quat_initial = FQA_quat(mag2(b-1,:)' , acc2(b-1,:)'); 
                       % length of shankacc and shankmag are longer than that of shankgyr
        num_seg = 2;
        quaternion_lower = quater_ab_orien(gyr2,acc2, mag2, quat_initial, num_seg, fs);
        
    %% estimate the three rotianal axes of the 3-DoF joint

        [j1, j2, j3, j4, q_corr] = tri_DOF_axis(gyr1,gyr2, mag1, mag2, acc1, acc2, quaternion_lower,quaternion_upper);
        
        
    %% estimate the angles around the main axis

        [theta, q_dis_j2] = main_axis_angles(j1, j2, o1, o2, quaternion_lower, quaternion_upper, q_corr);
        
    %% estimate the quaternion q~^{b1}_b2 and decouple it into angles around j3 and j4

        angle = decouple(j2, j3, j4, q_dis_j2, quaternion_lower, quaternion_upper, q_corr, joint_num);

    %% plot data
        % red curves are reference, blude curves are estimates
        A = data_plot(ref,angle,joint_num);



    
        
        
    
    
    