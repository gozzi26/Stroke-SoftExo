clear all
close all

A_original = readmatrix('code_22-01-17_1117.xlsx');
A=A_original;
t = A(:,1); %time line
AccX_R = A(:,2); 
AccY_R = A(:,3);
Gyro_L = A(:,4)-mean(A(:,4));
AccY_L = A(:,5);
FP_1 = A(:,6)-mean(A(:,6));
FP_2 = A(:,7)-mean(A(:,7));
Swing = A(:,8);
lc = A(:,9);
Gyro_R =(A(:,10)-mean(A(:,10)))*0.5;

t_lim =[37 61];
ampl_lim=[-0.8 0.8];

figure(1)
% plot(t,AccX_R,'b'); hold on
plot(t,AccY_R,'k'); hold on
% plot(t,AccX_L); hold on
% plot(t,AccY_L); hold on
% plot(t,FP_1,'r'); hold on
% plot(t,FP_2); hold on
% plot(t,Hit_1); hold on
% plot(t,Swing,'LineWidth',2); hold on
plot (t, Gyro_R);
% yline(0.2,'--');
% yline(0,'--');
% title('Treshold Recognition Test')
xlim (t_lim);
ylim (ampl_lim);
legend('Acceleration AP direction - Right', 'Gyro - Right','Angular Velocity - Right');
xlabel("Time [sec]");
ylabel("Acceleration [g]");


%,'ForcePlate R',


figure(2)
% plot(t,AccX_R,'b'); hold on
plot(t,AccY_R,'k'); hold on
% plot(t,AccX_L); hold on
% plot(t,AccY_L); hold on
% plot(t,FP_1,'r'); hold on
% plot(t,FP_2); hold on
% plot(t,Hit_1); hold on
plot(t,Swing,'LineWidth',2); hold on
plot (t, Gyro_R);
% yline(0.2,'--');
% yline(0,'--');
% title('Treshold Recognition Test')
xlim (t_lim);
ylim (ampl_lim);
legend('Acceleration AP direction - Right','Force Plate - Right', 'Angular Velocity - Right');
xlabel("Time [sec]");
ylabel("Acceleration [g]");


figure(3)
% plot(t,AccX_R,'b'); hold on
% plot(t,AccY_R,'k'); hold on
% plot(t,AccX_L); hold on
% plot(t,AccY_L); hold on
plot(t,FP_1,'r'); hold on
% plot(t,FP_2); hold on
% plot(t,Hit_1); hold on
plot(t,Swing,'LineWidth',2); hold on
% plot (t, Gyro_R);
% yline(0.2,'--');
% yline(0,'--');
% title('Treshold Recognition Test')
xlim (t_lim);
ylim (ampl_lim);
legend('Force Plate - Right','Swing');
xlabel("Time [sec]");
ylabel("Acceleration [g]");

