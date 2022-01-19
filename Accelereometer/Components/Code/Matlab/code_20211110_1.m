clear all
close all

start=1;

%% Accelerometer
A_original = readmatrix('code_21-11-18_1542_001.xlsx');
A = A_original(start:end,:); %cut tail if needed
Sync = A(:,9)-mean(A(:,9));
%% Force Plate
M_original = readmatrix('test_nov_18.csv');
M_250hz = downsample(M_original,4);
M = M_250hz(start:end,:); 
Fz_2 = M(:,12)-mean(M(:,12));

%% Find the Lag
s1=Sync;
s2=Fz_2;
lag= find_lag(s1,s2);


%% Let's Sync
A = A(lag:end,:);
%% All signals
Fs = 250; %Sample freq [Hz]

%plate
t_plate = M(:,1);
t_plate_timeline = linspace(0,(length(t_plate))*(1/Fs),(length(t_plate)));

foot_1 = M(:,2:9);
F_1 = M(:,2:4); %force (Fx, Fy, Fz)
Fz_1 = M(:,4); %<----------------------------------
M_1 = M(:,5:7); %momentum (Mx, My, Mz)
CoP_1 = M(:,8:9); %CopX and CopY

foot_2 = M(:,10:17);
F_2 = M(:,10:12);
Fz_2 = M(:,12); %<---------------------------------- = to Sync
M_2 = M(:,13:15); %momentum (Mx, My, Mz)
CoP_2 = M(:,16:17); %CopX and CopY

%accelerometers
t_device = A(:,1); %time line
t_acc = linspace(0,(length(t_device))*(1/Fs),(length(t_device)));

Acc = A(:,2:7);
AccY = A(:,[3 6]);
AccY1= A(:,3);
AccY2= A(:,6);
Sync_new = A(:,9)-mean(A(:,9));

Swing = A(:,8);
if isnan(Swing(1))
   Swing(1)=0;
end
for i = 1:length(Swing)
    if isnan (Swing(i))
        Swing(i)=Swing(i-1);
    elseif Swing(i)== 1
        Swing(i)= 0.15;
    else
        Swing(i)= -0.15;
    end
end

%% Final graph
Fz_1_scaled = Fz_1*0.0008;
inizio=16000;
fine=21615;

figure
plot(AccY(inizio:fine));hold on 
plot(Swing(inizio:fine));hold on 
plot(Sync(inizio:fine));hold on
plot(Fz_1_scaled(inizio:fine));
title('Acceleration');
xlabel("[Sample Number]");
ylabel("[g]");
legend('y1','y2','Swing');



figure
plot(t_acc',AccY);hold on 
plot(t_acc',Swing);hold on 
plot(t_acc',Sync_new);hold on
plot(t_plate_timeline', Fz_1_scaled);
title('Acceleration');
xlabel("[Sample Number]");
ylabel("[g]");
legend('y1','y2','Swing');


















%% freq analysis
% [P,f] = freq_analysis(signal,Fs);
% figure
% stem(f,P) 
% title('Filtered signal Spectrum')
% xlabel("freq [Hz]");
% ylabel("Amplitude [dB]");


%% Filter
% %passband filter
% f_min=0.1;
% f_max=0.4;
% fpass = [f_min f_max];

%lowpass
% fpass = 0.2;
% 
% lpf_signal = lowpass(signal,fpass,Fs);
% 
% figure
% plot(t,lpf_signal);
% title('Acceleration');
% xlabel("time [sec]");
% ylabel("Acceleration [g]");
% 
% 
% [P_lpf,f_lpf] = freq_analysis(lpf_signal,Fs);
% figure
% stem(f_lpf,P_lpf) 
% title('Filtered signal Spectrum')
% xlabel("freq [Hz]");
% ylabel("Amplitude [dB]");

%% standard deviation
% movStd = dsp.MovingStandardDeviation;
% sd = movStd(x(:,1));
% 
% figure
% plot(t,sd);


