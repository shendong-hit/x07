
% %%旋翼气动力计算模块
% %input
% 1、rou --密度
% 2、c_rotor-桨叶弦长 假定c为常数，翼型固定
% 3、r_rotor-桨盘半径
% 4、N-叶素段数
% 5、beta,dbeta-挥舞角和挥舞角速率
% 6、phi-桨叶方位角
% 7、Omega-桨叶旋转角速度
% 8、yita_e-桨根失效系数，yita_B 桨叶失效系数  阻力计算不受影响
% 9、Vx,Vy,Vz-桨毂三向速度（相对于机体坐标系）前x为正，上y为正，右z为正
% 10、k-桨叶数
% 11、theta0,theta1-桨根安装角和相对桨尖的扭转角

% %output
% 1、T，H，S-垂向力，水平力，侧向力
% 与机体坐标系平行的旋转坐标系下的
% 2、Mx,My,Mz-相对于整机质心的三向力矩



e_rotor=r_rotor*yita_e;
B_rotor=r_rotor*yita_B;
dr=(r_rotor)/N;
for i=1:N
    r=i*dr;
    ut=Omega*r_rotor+Vx*sin(phi)+Vz*cos(phi);
    up=vi+r*dbeta+Vy+(Vx*cos(phi)-Vz*sin(phi))*sin(beta);
    U=sqrt(up*up+ut*ut);
    psai=atan2(up,ut);

    alpha=theta0+r/r_rotor*theta1-psai;
    %TBD 根据攻角去查询Cl和Cd
    if r>=e_rotor&&r<=B_rotor
        dL=0.5*rou*U*U*Cl*c_rotor*dr;%Cl可以
    else
        dL=0;
    end
    dD=0.5*rou*U*U*Cd*c_rotor*dr;

    dy=dL*cos(psai)-dD*sin(psai);
    dx=dL*sin(psai)+dD*cos(psai);
   
    dT=k*dy;  %升力系数
    dQ=k*dx*r*cos(beta); %扭矩系数
    dP=dQ*Omega;%功率系数
    T=T+dT;
    Q=Q+dQ;
    P=P+dP;




end

