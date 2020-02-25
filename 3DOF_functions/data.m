clear all;
load gh0421_delsys;
%load gh0421_tread;
b = 20000
e = 20520;
for i = b:1:e
    shankacc1(i-b+1,:) = shankacc(i,:);
    shankgyr1(i-b+1,:) = shankgyr(i,:);
    shankmag1(i-b+1,:) = shankmag(i,:);
    
    footacc1(i-b+1,:) = footacc(i,:);
    footgyr1(i-b+1,:) = footgyr(i,:);
    footmag1(i-b+1,:) = footmag(i,:);
    
    thighacc1(i-b+1,:) = thighacc(i,:);
    thighgyr1(i-b+1,:) = thighgyr(i,:);
    thighmag1(i-b+1,:) = thighmag(i,:);
    
    pelacc1(i-b+1,:) = pelacc(i,:);
    pelgyr1(i-b+1,:) = pelgyr(i,:);
    pelmag1(i-b+1,:) = pelmag(i,:);
end

load gh0421_walking_hip;
hip_flev = hip_flev';
hip_abdv = hip_abdv';
hip_inrv = hip_inrv';
load gh0421_walking_knee;
kne_flev = kne_flev'/5*7;
kne_abdv = -kne_abdv'/8;
kne_inrv = kne_inrv'/4;
load gh0421_walking_ankle;
ank_plat = ank_inrot'*0.8;
ank_abd = ank_abd';
ank_inr = ank_plad';


