%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 中等规模的DSGE @许文立，安徽大学经济学院/CIMERS
% 参数文件
% @Wenli XU @CMERS 2019-2-24
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
clear all;
close all;
addpath C:\dynare\4.6.1\matlab

% execute a dynare file
% specify parameters

%%
% 参数赋值
betta=0.995;
b=0.7;
alfa=0.33;
delta0=0.025;
delta2=0.05;
pi_target=0.02;
ki=4;
epsilonw=3;
epsilonp=3;
ka=2;
etaw=0.2;
etap=0.2;
fiw=0.75;
fip=0.66;
%F=0;
rhoi=0.8;
fipi=1.5;
fiy=0.2;
rhoa=0.92;
rhoz=0.94;
rhog=0.72;
rhov=0.9;
rhopsi=0.7;
psis=6;
rhotauc=0.72;
taucs=0.15;
rhotaun=0.72;
tauns=0.05;
rhotauk=0.72;
tauks=0.125;
omegga=0.2;
fin=0.5;
fik=0.5;
delta1=1/betta-(1-delta0);


%% save as .mat file,naming param_mscale_dsge_baseline
save param_mscale_dsge_baseline

%% noclearall:not automatically erase all previous output; 
% nolog:tells dynare to not produce a log file, because of causing crashes
% when we are doing loops.
dynare mscale_dsge_baseline_est noclearall nolog

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 保存模拟数据
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
load('mscale_dsge_baseline_osr_results.mat', 'oo_')

Y_obs=oo_.irfs.Y_e_a;
C_obs=oo_.irfs.C_e_a;
I_obs=oo_.irfs.I_e_a;
N_d_obs=oo_.irfs.N_d_e_a;
R_obs=oo_.irfs.R_e_a;
pi_obs=oo_.irfs.pi_e_a;
save msnk_baseline Y_obs C_obs I_obs N_d_obs R_obs pi_obs;
