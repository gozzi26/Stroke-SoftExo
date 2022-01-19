function [Lag] = find_lag(s1,s2)


figure
ax(1) = subplot(2,1,1);
plot(s1)
ylabel('s_1')
axis tight

ax(2) = subplot(2,1,2);
plot(s2)
ylabel('s_2')
axis tight

linkaxes(ax,'x')

%Compute the cross-correlations between the three pairs of signals. 
%Normalize them so their maximum value is 1.
[C21,lag21] = xcorr(s1,s2);
C21 = C21/max(C21);

%The locations of the maximum 
%values of the cross-correlations indicate time leads or lags.
[M21,I21] = max(C21);
t21 = lag21(I21);

%Plot the cross-correlations. In each plot display the location of the maximum.
figure
plot(lag21,C21,[t21 t21],[-1.5 1.5],'r:')
text(t21+100,0.5,['Lag: ' int2str(t21)])
ylabel('C_{21}')
axis tight
title('Cross-Correlations')

s1 = s1(t21:end);


figure
ax(1) = subplot(2,1,1);
plot(s1)
ylabel('s_1')
axis tight

ax(2) = subplot(2,1,2);
plot(s2)
ylabel('s_2')
axis tight
linkaxes(ax,'x')

Lag = t21;
end

