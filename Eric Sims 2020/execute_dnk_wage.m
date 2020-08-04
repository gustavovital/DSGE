% By Eric Sims

addpath C:\dynare\4.6.1\matlab


clear all
close all

%% set parameters
epsip = 11;
epsiw = 11;
phip = 0.75;
phiw = 0.75;
sigma = 1;
chi = 1;
beta = 0.99; 
Ls = 1; %targeted labor supply
Ys = Ls;

%% solve for steady state wage and mrs
pws = (epsip-1)/epsip;
ws = pws;
mrss = (epsiw-1)/epsiw * ws; 

% solve for labor supply parameter
psi = mrss;

% exogenous process parameters
rhoA = 0.9;
sA = 0.01;

% policy parameters
rhoR = 0.8;
thetapi = 1.5;
sR = 0.0025;


%%
save param_dnk_wage beta epsip epsiw phip phiw sigma chi beta psi rhoA rhoR thetapi sA sR

dynare dnk_wage noclearall nolog

figure
subplot(2,2,1)
plot(100*y_eA,'-k','Linewidth',2)
title('log(Y)')

subplot(2,2,2)
plot(400*pi_eA,'-k','Linewidth',2)
title('log(\Pi)')

subplot(2,2,3)
plot(400*r_eA,'-k','Linewidth',2)
title('log(R)')

subplot(2,2,4)
plot(100*ld_eA,'-k','Linewidth',2)
title('log(L_{d})')
legend('Productivity Shock')

figure
subplot(2,2,1)
plot(100*y_eR,'-k','Linewidth',2)
title('log(Y)')

subplot(2,2,2)
plot(400*pi_eR,'-k','Linewidth',2)
title('log(\Pi)')

subplot(2,2,3)
plot(400*r_eR,'-k','Linewidth',2)
title('log(R)')

subplot(2,2,4)
plot(100*ld_eR,'-k','Linewidth',2)
title('log(L_{d})')
legend('Monetary Shock')
