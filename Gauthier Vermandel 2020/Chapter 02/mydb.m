%% Chapter 2 of DSGE course - Gauthier Vermandel
% Based on Gauthier Vermandel

%% Getting data from OECD
[my_mat, ~, T] = call_dbnomics('OECD/QNA/USA.B1_GS1.LNBQRSA.Q');

%% Changes in the data
gross_y = my_mat(:, 2);
ln_y = log(gross_y);

%% Removing the trend by OLS
X = [ones(length(ln_y), 1) (1:length(ln_y))'];
OLS = X\ln_y;
trend_y = X*OLS;
gama = 1 + OLS(2); %% valor estimado de gamma

%% Gap
ln_gap = ln_y - trend_y;
y = ln_gap - mean(ln_gap);

%% Figures
figure;
subplot(2,1,1);
plot(T,ln_y,T,trend_y);
title('Real GDP 1940-now');
subplot(2,1,2);
plot(T,y);
hold on
yline(0, 'r-.');
title('Real GDP variations around the trend');

%% Saving data
save mydata.mat y;

%% Estimation through Dynare
%  Start Dynare
addpath C:\dynare\4.6.1\matlab

%% Run dynare
dynare model

%% Plot graphs
load mydata;
figure
subplot(3,1,1);
plot(T,oo_.SmoothedVariables.y)
title('Output')
subplot(3,1,2);
plot(T,oo_.SmoothedVariables.k)
title('Capital')
subplot(3,1,3);
plot(T,oo_.SmoothedVariables.a)
title('Productivity')

%% Reversing 
subplot(2,1,1);
plot(T,exp(trend_y+oo_.SmoothedVariables.y))
title('Output')
subplot(2,1,2);
plot(T,exp(trend_y+oo_.SmoothedVariables.k))
title('Capital')