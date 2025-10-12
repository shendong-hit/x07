%%加载整机初始参数
%坐标系为右手螺旋，往前为x，往左为y，往上为z
Aircraft.mass=5897;%kg
Aircraft.I=[71579,0,1673;
            0,89937,0;
            1673,0,28960];       %短舱均水平时的整机转动惯量矩阵
Aircraft.position_mc=[7.41 0 2.07]';%短舱均水平状态时的整机前的质心位置

nacelle1.mass=1808/2;
nacelle1.length=1.4225;
nacelle1.position_till=[7.62 4.9 2.54 ]';%发动机短舱旋转点相对于机身头部顶点位置
nacelle1.ia=5/57.3;%短舱中轴线偏离Z轴的角度,中轴线在其左为正，在其右为负
nacelle1.length_mc=0.8;
nacelle1.I=[8 0 0;
            0 55 0;
            0 0 55];%短舱水平相对自身质心的转动惯量矩阵
nacelle1.tillangle=30;%短舱倾转的角度，向上为正，90°时为垂起状态；

%%后续增加倾转舱