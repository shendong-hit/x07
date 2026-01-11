%绘图需用功率和可用功率
figure;
x=out.Velocity.signals.values;
y1=out.Pc.signals.values;
plot(x,y1/1000,'-');
hold on;
len=length(x);
y2=Pa/1000*ones(len,1);
plot(x,y2,'-');
xlabel('速度m/s');
xlim([45,110]);
ylabel('功率KW');
legend('需用功率','可用功率');
grid on;



%%升阻比随速度变化关系
figure;
x=out.Velocity.signals.values;
y1=out.LD.signals.values;
plot(x,y1,'-');
hold on;
xlabel('速度m/s');
xlim([45,110]);
ylim([6,15]);
ylabel('升阻比');
grid on;



%绘图飞行包线
figure;
y1=out.LeftHeight.signals.values;
x1=out.VLeft.signals.values;
plot(x1,y1,'-blue');
hold on;
y2=out.RightHeight.signals.values;
x2=out.VRight.signals.values;
plot(x2,y2,'-blue');
plot([x1(end),x2(end)],[3000,3000],'-blue');
xlabel('速度m/s');
ylabel('高度/m');
ylim([0,3200]);
grid on;

%绘图上升速度
figure;
hold on;
x=out.simout.Time+45;
for i=1:6
VClimb=reshape(out.simout.Data(i,:,:),52,1);
plot(x,VClimb);
end
grid on;
ylim([0,25]);
xlabel('速度m/s');
ylabel('爬升速度m/s');
legend('1km','2km','4km','6km','8km','10km');

%绘图下降速度和下降角
x_Fu=out.Velocity.signals.values;
VDescend_Fu=out.VDescend.signals.values;
DescendAngle_Fu=atan2(VDescend,x_Fu)*57.3;
x_Em=out.Velocity.signals.values;
VDescend_Em=out.VDescend.signals.values;
DescendAngle_Em=atan2(VDescend_Em,x_Em)*57.3;
figure;
hold on;
plot(x_Fu,VDescend_Fu);
plot(x_Em,VDescend_Em);
legend('满载','空载');
xlabel('速度m/s');
ylabel('下降速度m/s');
grid on;

figure;
hold on;
plot(x_Em,DescendAngle_Em);
plot(x_Fu,DescendAngle_Fu);
legend('满载','空载');
xlabel('速度m/s');
ylabel('下滑角°');
grid on;
