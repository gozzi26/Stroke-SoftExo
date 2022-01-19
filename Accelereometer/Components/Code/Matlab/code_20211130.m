clear all
close all

%% Accelerometer
A_original = readmatrix('code_21-11-30_1629_001.xlsx');
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

t_lim =[30 50];
% ampl_lim=[-0.27 0.27];

figure
% plot(t,AccX_R); hold on
% plot(t,AccY_R); hold on
plot(t,AccX_L); hold on
plot(t,AccY_L); hold on
% plot(t,FP_1); hold on
% plot(t,FP_2); hold on
% plot(t,Hit_1); hold on
% plot(t,Swing);
% xlim (t_lim);
% ylim (ampl_lim);
legend('1','2');




