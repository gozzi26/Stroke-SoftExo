clear all
close all

start=1;

% Accelerometer
A_original = readmatrix('code_21-11-29_1623_003');
A = A_original(start:end,:); %cut tail if needed


Fs = 100; %Sample freq [Hz]

t_device = A(:,1); %time line
t_acc = linspace(0,(length(t_device))*(1/Fs),(length(t_device)));

Acc = A(:,2:5);
Acc_R = A(:,2:3); %Heel Strike 1 
Acc_R_x = A(:,2);
Acc_R_y = A(:,3);

Acc_L = A(:,4:5); %Heel Strike 2
Acc_L_x = A(:,4);
Acc_L_y = A(:,5);

Acc_y = A(:,[3 5]);

%plate
Fz_R= (A(:,6) - mean(A(:,6)))*0.7;
Fz_L= (A(:,7) - mean(A(:,7)))*0.7;

%algorithm
Swing_Direct= A(:,8);

if isnan(Swing_Direct(1))
   Swing_Direct(1)=0;
end
for i = 1:length(Swing_Direct)
    if isnan (Swing_Direct(i))
        Swing_Direct(i)=Swing_Direct(i-1);
    elseif Swing_Direct(i)== 1
        Swing_Direct(i)= 0.1;
    else
        Swing_Direct(i)= 0;
    end
end


% Final graph

t_lim =[2.5 14];
ampl_lim=[-0.27 0.27];

figure
plot(t_acc',Acc_R_x,'b');hold on
% plot(t_acc',Acc_L_x,'r');hold on
plot(t_acc',Swing_Direct,'k','LineWidth',2);
% plot(t_acc',Fz_L)
xlabel("[Sec]");
%ylabel("[g]");
legend('Acceleration X - Right','Swing - Direct');
% xlim (t_lim);
% ylim (ampl_lim);


% figure;
% 
% subplot (3,1,2)
% plot(t_acc',Acc_R_y,'b');
% xlabel("[Sec]");
% ylabel("[g]");
% legend('Acceleration Y - Right');
% xlim (t_lim);
% ylim (ampl_lim);
% 
% subplot (3,1,3)
% plot(t_acc',Acc_R_x,'r');
% xlabel("[Sec]");
% ylabel("[g]");
% legend('Acceleration X - Right');
% xlim (t_lim);
% ylim (ampl_lim);
% 
% 
% figure
% subplot(2,1,1)
% plot(t_acc',Acc_R_y,'r'); hold on
% plot(t_acc',Acc_L_y,'b'); hold on
% plot(t_acc',Fz_R);
% xlabel("[Sec]");
% legend('Acceleration Y - Right','Acceleration Y - Left','Fz - R');
% xlim (t_lim);
% ylim (ampl_lim);
% 
% subplot(2,1,2)
% plot(t_acc',Acc_R_x,'r'); hold on
% plot(t_acc',Acc_L_x,'b'); hold on
% plot(t_acc',Fz_L);
% xlabel("[Sec]");
% legend('Acceleration X - Right','Acceleration X - Left','Fz - Left');
% xlim (t_lim);
% ylim (ampl_lim);

