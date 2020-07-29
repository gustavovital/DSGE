%% Start Dynare
addpath C:\dynare\4.6.1\matlab

%% Pre config
clear; clc;

%% Run model
dynare model

irfs = oo_;
save('irfs', 'irfs');
%% Run model
dynare model2
irfs2 = oo_;
save('irfs2', 'irfs2');

%% Compare habit formation
clear; clc;

load('irfs');
load('irfs2');

%% Graphs
figure;
subplot(2,4,1)
plot(irfs.irfs.y_n_c);
hold on
plot(irfs2.irfs.y_n_c);
subplot(2,4,2)
plot(irfs.irfs.c_n_c);
hold on
plot(irfs2.irfs.c_n_c);
subplot(2,4,3)
plot(irfs.irfs.i_n_c);
hold on
plot(irfs2.irfs.i_n_c);
subplot(2,4,4)
plot(irfs.irfs.k_n_c);
hold on
plot(irfs2.irfs.k_n_c);
subplot(2,4,5)
plot(irfs.irfs.r_n_c);
hold on
plot(irfs2.irfs.r_n_c);
subplot(2,4,6)
plot(irfs.irfs.w_n_c);
hold on
plot(irfs2.irfs.w_n_c);
subplot(2,4,7)
plot(irfs.irfs.h_n_c);
hold on
plot(irfs2.irfs.h_n_c);
subplot(2,4,8)
plot(irfs.irfs.z_n_c);
hold on
plot(irfs2.irfs.z_n_c);
