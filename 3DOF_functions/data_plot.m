function [A] = data_plot(ref,angle,joint_num)
%UNTITLED7 此处显示有关此函数的摘要
%   此处显示详细说明
t_hip = 1:1:length(ref(:,1));
t_hip = t_hip*5/length(ref(:,1));
t1_hip = 1:1:length(angle(1,:));
t1_hip = t1_hip*5/length(angle(1,:));

if joint_num == 1  % thigh
    figure(1);
    subplot(311);
    plot(t_hip,ref(:,1),'r',t1_hip,angle(1,:),'b');
    axis([0 ,5 ,-20 , 30]);
    title('Hip Flexion/Extension');
    subplot(312);
    plot(t_hip,ref(:,2),'r',t1_hip,angle(2,:),'b');
    axis([0 , 5 ,-11,3]);
    title('Hip Abduction/Adduction');
    subplot(313);
    plot(t_hip,ref(:,3),'r',t1_hip,angle(3,:),'b');
    axis([0 , 5 ,20,38]);
    title('Hip Intra/Extra Rotation');
else if joint_num == 2 % knee

        figure(1);
        subplot(311);
        plot(t_hip,ref(:,1),'r',t1_hip,angle(1,:),'b');
        axis([0 , 5 ,-10,65]);
        title('Knee Flexion/Extension');
        subplot(312);
        plot(t_hip,ref(:,2),'r',t1_hip,angle(2,:),'b');
        axis([0 , 5 ,-4,0.5]);
        title('Knee Abduction/Adduction');
        subplot(313);
        plot(t_hip,ref(:,3),'r',t1_hip,angle(3,:),'b');
        axis([0 , 5 ,-15,-6]);
        title('Knee Intra/Extra Rotation');
else if joint_num == 3 % ankle
        figure(1);
        subplot(311);
        plot(t_hip,ref(:,1),'r',t1_hip,angle(1,:),'b');
        axis([0 , 5 ,-14,10]);
        title('Ankle Flexion/Extension');
        subplot(312);
        plot(t_hip,ref(:,2),'r',t1_hip,angle(2,:),'b');
        axis([0 , 5 ,-5.5,1]);
        title('Ankle Abduction/Adduction');
        subplot(313);
        plot(t_hip,ref(:,3),'r',t1_hip,angle(3,:),'b');
        axis([0 , 5 ,0,32]);
        title('Ankle Intra/Extra Rotation');
end
end
end
A = 'Plotted Angles';
end

