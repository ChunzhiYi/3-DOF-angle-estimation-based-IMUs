function [ ori] = FQA_quat( m,a )
%FQA method, output of which is quaternion
%   »∆y÷· pitch «„–±Ω« elevation
    if norm(a)~=0
         a = a/norm(a);
    else
        a = [0 0 0]';
    end
    sn_sita=a(1);
    cs_sita=sqrt(1-sn_sita^2);
    q_a=[0 0 0 0]';
    if cs_sita<0.01
        q_a = sin(pi/6)*[0 0 1 0]'+cos(pi/6)*[1 0 0 0]';
        rot_a = quat_rotmat(q_a);
        m = rot_a*m;
        a = rot_a*a;
        a = a/norm(a);
        sn_sita=a(1);
        cs_sita=sqrt(1-sn_sita^2);
    end
    
    sn_hf = sign(sn_sita)*sqrt((1-cs_sita)/2);
    cs_hf = sqrt((1+cs_sita)/2);
    q_e = cs_hf*[1 0 0 0]'+ sn_hf*[0 0 1 0]';
%   »∆x÷· roll πˆ∂ØΩ«
   
    sn_fi = -a(2)/cs_sita;
    cs_fi = -a(3)/cs_sita;
    if cs_fi>1
        cs_fi=1;
    end
    if cs_fi<-1
        cs_fi = -1;
    end
    if sn_fi >1
        sn_fi = 1;
    end
    if sn_fi<-1
        sn_fi = -1;
    end
    sn_fi_hf = sign(sn_fi)*sqrt((1-cs_fi)/2);
    cs_fi_hf = sqrt((1+cs_fi)/2);
    q_r = cs_fi_hf*[1 0 0 0]'+sn_fi_hf*[0 1 0 0]';
%   »∆z÷· azimuth ∑ΩŒªΩ«
    rot_r=quat_rotmat(q_r);
    rot_e=quat_rotmat(q_e);
    m_e = rot_e*(rot_r*m);
    if sqrt(m_e(1)^2+m_e(2)^2)~=0
    M = [m_e(1);m_e(2)]/sqrt(m_e(1)^2+m_e(2)^2);
    else 
        M = [1;1]/sqrt(2);
    end
    a_e = rot_e*(rot_r*a);
    a_e = a_e/norm(a_e);
   % m_e = m_e - (dot(m_e , a_e))*a_e;
    cs_pusai = M(1);
    sn_pusai = -M(2);
    sn_pusai_hf = sign(sn_pusai)*sqrt((1-cs_pusai)/2);
    cs_pusai_hf = sqrt((1+cs_pusai)/2);
    q_a = cs_pusai_hf*[1 0 0 0]'+ sn_pusai_hf*[0 0 0 1]';
%   FQA ‰≥ˆ
    q_FQA = quat_mul(q_a,q_e);
    q_FQA = quat_mul(q_FQA,q_r);
    if norm(q_a) == 0
        q_FQA = quat_mul(q_FQA,q_a);
    else
        q_FQA = q_FQA;
    end
    ori = q_FQA;



end

