clear all
close all

% Accelerometer
base = readmatrix('baseline.xlsx');
A = readmatrix('5lb.xlsx');
B = readmatrix('6lb.xlsx');
C = readmatrix('8lb.xlsx');
D = readmatrix('10lb.xlsx');

%load cell
base_lc = base(600:1500,end);
A_lc = A(6300:7200,end);
B_lc=B(600:1500,end);
C_lc=C(600:1500,end);
D_lc=D(600:1500,end);

mbase=mean(base_lc);
mA=mean(A_lc);
mB=mean(B_lc);
mC=mean(C_lc);
mD=mean(D_lc);





figure
plot(base_lc,'k'); hold on
plot(A_lc,'r'); hold on
plot(B_lc,'b'); hold on
plot(C_lc,'g'); hold on
plot(D_lc);



Weight = ([0 5 6 8 10]/ 2.205)*9.98; %N
Output = [mbase mA mB mC mD]; %Volt

x=Weight;
y=Output;
p = polyfit(x,y,1);
y1 = polyval(p,x);

figure
plot(Weight, Output,'*'); hold on
plot(x,y1)
legend("measured points", "calibration curve");
xlabel("Load [N]");
ylabel("Load Cell Output [Volt]");

