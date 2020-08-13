% 中等规模的DSGE @许文立，安徽大学经济学院/CIMERS
% 2019-2-24

function [ys,check]=dsge_steadystate(ys,exo)
% function [ys,check] = msacale_dsge_baseline_steadystate(ys,exo)
% 用数值算法来为msacale_dsge_baseline.mod计算稳态值
% 输入: 
%   - ys        [vector] 内生变量稳态值的初值向量
%   - exo       [vector] 外生变量值的向量
%
% 输出: 
%   - ys        [vector] 内生变量的稳态值向量
%   - check     [scalar] set to 0 if steady state computation worked and to
%                    1 of not (allows to impos restriction on parameters)
global M_ 

% read out parameters to access them with their name
NumberOfParameters = M_.param_nbr;
for ii = 1:NumberOfParameters
  paramname = deblank(M_.param_names(ii,:));
  eval([ paramname ' = M_.params(' int2str(ii) ');']);
end
% initialize indicator
check = 0;

delta1=1/betta-(1-delta0);

% 稳态表达式

A=1;
Z=1;
v=1;
pssi=psis;
tauc=taucs;
taun=tauns;
tauk=tauks;
pi=pi_target;
i=1/betta*(1+pi)-1;
u=1;
R=(1+tauc)/(1-tauk)*(1/betta-(1-delta0));
pi_star=(((1+pi)^(1-epsilonp)-fip*(1+pi)^(etap*(1-epsilonp)))/(1-fip))^(1/(1-epsilonp))-1;
v_p=(1-fip)*((1+pi_star)/(1+pi))^(-epsilonp)/(1-fip*(1+pi)^(epsilonp*(1-etap)));
mc=(epsilonp-1)/epsilonp*(1+pi_star)/(1+pi)*(1-fip*betta*(1+pi)^(epsilonp*(1-etap)))/(1-fip*betta*(1+pi)^((1-epsilonp)*(etap-1)));
w=(1-alfa)*mc*(alfa*mc/R)^(alfa/(1-alfa));
w_star=w*((1-fiw*(1+pi)^((epsilonw-1)*(1-etaw)))/(1-fiw))^(1/(1-epsilonw));
N_d=((epsilonw-1)/epsilonw/psis*(1-taun)/(1+tauc)/(1-b)*(1-betta*b)*((1-omegga)*(alfa*mc/R)^(alfa/(1-alfa))/v_p-delta0*(alfa*mc/R)^(1/(1-alfa)))^(-1)*(w/w_star)^(-epsilonw*ka)*((1-fiw*betta*(1+pi)^(epsilonw*(1+ka)*(1-etaw)))/(1-fiw*betta*(1+pi)^((epsilonw-1)*(1-etaw))))*w_star)^(1/(1+ka));
K_hat=(alfa*mc/R)^(1/(1-alfa))*N_d;
K=K_hat;
I=delta0*K;
Y=A*K_hat^alfa*N_d^(1-alfa)/v_p;
G=omegga*Y;
C=Y-G-I;
lamb=1/C*(1-betta*b)/(1-b)/(1+tauc);
mu=(1+tauc)*lamb;
x1=lamb*mc*Y/(1-fip*betta*(1+pi)^((1-etap)*epsilonp));
x2=lamb*Y/(1-fip*betta*(1+pi)^((etap-1)*(1-epsilonp)));
h1=psis*(w/w_star)^(epsilonw*(1+ka))*N_d^(1+ka)/(1-fiw*betta*(1+pi)^(epsilonw*(1+ka)*(1-etaw)));
h2=(1-taun)*lamb*(w/w_star)^epsilonw*N_d/(1-fiw*betta*(1+pi)^((epsilonw-1)*(1-etaw)));
Welfare=1/(1-betta)*(log(C-b*C)-pssi*N_d^(1+ka)/(1+ka));

check=0;


for iter = 1:length(M_.params) %update parameters set in the file
  eval([ 'M_.params(' num2str(iter) ') = ' M_.param_names(iter,:) ';' ])
end

NumberOfEndogenousVariables = M_.orig_endo_nbr; %auxiliary variables are set automatically
for ii = 1:NumberOfEndogenousVariables
  varname = deblank(M_.endo_names(ii,:));
  eval(['ys(' int2str(ii) ') = ' varname ';']);
end
