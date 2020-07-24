%% Based on Gauthier Vermandel

%% Start Dynare
addpath C:\dynare\4.6.1\matlab

%% Run Model
clear; clc;
dynare model

%% Ploting IRF by hand
figure
subplot(3,1,1)
plot(1:40,oo_.irfs.k_e, 'b-');
title('Capital IRF of a shock of Tecnology')
subplot(3,1,2)
plot(1:40,oo_.irfs.c_e, 'b-');
title('Comsumption IRF of a shock of Tecnology')
subplot(3,1,3)
plot(1:40,oo_.irfs.a_e, 'b-');
title('Produtivity IRF of a shock of Tecnology')