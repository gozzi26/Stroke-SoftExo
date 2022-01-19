clear all
close all

% Accelerometer
A_original = readmatrix('code_21-12-2_1644.xlsx');
A=A_original;
t = A(:,1); %time line
AccX_R = A(:,2); 
AccY_R = A(:,3);
AccX_L = A(:,4);
AccY_L = A(:,5);
FP_1 = A(:,6)-mean(A(:,6));
FP_2 = A(:,7)-mean(A(:,7));
Hit_1 = A(:,8);
Swing = A(:,9);

t_lim =[50 70];
% ampl_lim=[-0.27 0.27];

figure
subplot(3,1,1)
 plot(t,AccX_R,'b'); hold on
%plot(t,AccY_R); hold on
% plot(t,AccX_L); hold on
% plot(t,AccY_L); hold on
plot(t,FP_1,'r'); hold on
% plot(t,FP_2); hold on
% plot(t,Hit_1); hold on
% plot(t,Swing);
% yline(0.1,'--','Threshold');
% title('Treshold Recognition Test')
xlim (t_lim);
% ylim (ampl_lim);
% legend('Acceleration Y - Right Foot','Detection Signal');
xlabel("Time [sec]");
ylabel("Acceleration [g]");

subplot(3,1,2)
%plot(t,AccX_R); hold on
plot(t,AccY_R,'k'); hold on
% plot(t,AccX_L); hold on
% plot(t,AccY_L); hold on
plot(t,FP_1,'r'); hold on
% plot(t,FP_2); hold on
% plot(t,Hit_1); hold on
% plot(t,Swing);
% yline(0.1,'--','Threshold');
% title('Treshold Recognition Test')
xlim (t_lim);
% ylim (ampl_lim);
% legend('Acceleration Y - Right Foot','Detection Signal');
xlabel("Time [sec]");
ylabel("Acceleration [g]");

subplot(3,1,3)
plot(t,AccX_R,'b'); hold on
plot(t,AccY_R,'k'); hold on
% plot(t,AccX_L); hold on
% plot(t,AccY_L); hold on
plot(t,FP_1,'r'); hold on
% plot(t,FP_2); hold on
% plot(t,Hit_1); hold on
% plot(t,Swing);
yline(0.2,'--');
yline(-0.2,'--');
% title('Treshold Recognition Test')
xlim (t_lim);
% ylim (ampl_lim);
% legend('Acceleration Y - Right Foot','Detection Signal');
xlabel("Time [sec]");
ylabel("Acceleration [g]");


figure
subplot(2,1,1)
plot(t,AccX_R,'b'); hold on
plot(t,AccY_R,'k'); hold on
% plot(t,AccX_L); hold on
% plot(t,AccY_L); hold on
plot(t,FP_1,'r'); hold on
% plot(t,FP_2); hold on
% plot(t,Hit_1); hold on
% plot(t,Swing);
yline(0.15,'--');
yline(-0.15,'--');
% title('Treshold Recognition Test')
xlim (t_lim);
% ylim (ampl_lim);
% legend('Acceleration Y - Right Foot','Detection Signal');
xlabel("Time [sec]");
ylabel("Acceleration [g]");

subplot(2,1,2)
% plot(t,AccX_R,'b'); hold on
% plot(t,AccY_R,'k'); hold on
plot(t,AccX_L,'g'); hold on
plot(t,AccY_L,'k'); hold on
% plot(t,FP_1,'r'); hold on
plot(t,FP_2,'r'); hold on
% plot(t,Hit_1); hold on
% plot(t,Swing);
yline(0.15,'--');
yline(-0.15,'--');
% title('Treshold Recognition Test')
xlim (t_lim);
% ylim (ampl_lim);
% legend('Acceleration Y - Right Foot','Detection Signal');
xlabel("Time [sec]");
ylabel("Acceleration [g]");









