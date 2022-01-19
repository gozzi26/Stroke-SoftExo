clear all
close all

M_original = readmatrix('test_nov_18.csv');
M = downsample(M_original,4);
t_plate=M(:,1);
y=M(:,2:17);
Fs = 250; %Sample freq [Hz]
t = linspace(0,(length(t_plate))*(1/Fs),(length(t_plate)));

%% Select signal
foot_1 = y(:,1:8);
F_1 = y(:,1:3); %force (Fx, Fy, Fz)
M_1 = y(:,4:6); %momentum (Mx, My, Mz)
CoP_1 = y(:,7:8); %CopX and CopY

foot_2 = y(:,9:16);
F_2 = y(:,9:11);
M_2 = y(:,12:14); %momentum (Mx, My, Mz)
CoP_2 = y(:,7:8); %CopX and CopY

%% plot
figure
plot(t,F_1)

figure
plot(t,F_2)

