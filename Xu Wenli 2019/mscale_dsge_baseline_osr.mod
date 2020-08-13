%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 中等规模的DSGE @许文立，安徽大学经济学院/CIMERS
% 2019-2-24
% 简单最优规则OSR
% 模型主要扩展了CEE（2005，JPE)，SW(2007,AER)和Sims（2017），
% 模型的主要特征包括：
% （1）物资资本积累；
% （2）价格粘性；
% （3）工资粘性；
% （4）价格和工资的指数化；
% （5）消费习惯；
% （6）投资调整成本；
% （7）可变资本利用程度；
% （8）固定生产成本；
% （9）泰勒规则性货币政策；
% （10）四种财政政策：
%      （a）顺周期性财政支出政策；
%      （b）增值税；
%      （c）累进劳动所得税；
%      （d）累进资本所得税；
% （11）九种冲击：
%      （a）财政支出政策冲击；
%      （b）增值税冲击；
%      （c）劳动所得税冲击；
%      （d）资本所得税冲击；
%      （e）货币政策冲击；
%      （f）生产率冲击；
%      （g）投资的边际效率冲击；
%      （h）跨期偏好冲击；
%      （i）期内偏好冲击（劳动供给冲击）；
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            第一步：声明内生变量和外生变量                 %

% 用var声明内生变量，并以分号“;”结束。
% 用varexo声明外生变量，并以分号“;”结束。
% 模型中包含29个内生变量{lamb mu C i pi R u Z I v pssi w 
% w_star h1 h2 N_d K_hat K mc pi_star x1 x2 Y G A v_p
% tauc taun tauk}。
% 包含9个外生变量{e_g e_tauc e_taun e_tauk e_i e_a e_z e_v 
% e_pssi}。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

var lamb mu C i pi R u Z I v pssi w w_star h1 h2 N_d K_hat K 
    mc pi_star x1 x2 Y G A v_p 
    tauc taun tauk;
%Y_obs C_obs I_obs N_d_obs R_obs pi_obs

varexo e_g e_i e_a e_z e_v e_pssi
       e_tauc e_taun e_tauk; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            第二步：声明参数并对参数赋值                 %

% 用parameters声明参数，并以分号“;”结束。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

parameters betta b alfa delta0 delta1 delta2 pi_target ki fiw epsilonw ka
           etaw epsilonp etap fip  rhoi fipi fiy rhoa rhoz rhog rhov rhopsi
           psis rhotauc taucs rhotaun tauns rhotauk tauks omegga fin fik;
%F

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    第三步：声明模型                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

model;

[name='方程1：预算约束的拉格朗日乘数']

(1+tauc)*lamb=v/(C-b*C(-1))-betta*b*v(1)/(C(1)-b*C);

[name='方程2：资本可利用程度']

lamb*(1-tauk)*R=mu*(delta1+delta2*(u-1));

[name='方程3：债券欧拉方程']

lamb=betta*lamb(1)*(1+i)*(1+pi(1))^(-1);

[name='方程4：tobin q']

(1+tauc)*lamb=mu*Z*(1-ki/2*(I/I(-1)-1)^2-ki*(I/I(-1)-1)*I/I(-1))+betta*mu(1)*Z(1)*ki*(I(1)/I-1)*(I(1)/I)^2;

[name='方程5：资本欧拉的方程']

mu=betta*(lamb(1)*(1-tauk(1))*R(1)*u(1)+mu(1)*(1-delta0-delta1*(u(1)-1)-delta2/2*(u(1)-1)^2));

[name='方程6：h1']

h1=v*pssi*(w/w_star)^(epsilonw*(1+ka))*N_d^(1+ka)+fiw*betta*(1+pi)^(-etaw*epsilonw*(1+ka))*(1+pi(1))^(epsilonw*(1+ka))*(w_star(1)/w_star)^(epsilonw*(1+ka))*h1(1);

[name='方程7：h2']

h2=(1-taun)*lamb*(w/w_star)^epsilonw*N_d+fiw*betta*(1+pi)^(etaw*(1-epsilonw))*(1+pi(1))^(epsilonw-1)*(w_star(1)/w_star)^epsilonw*h2(1);

[name='方程8：最优工资定价']

w_star=epsilonw/(epsilonw-1)*h1/h2;

[name='方程9：最优要素需求比']

w/R=(1-alfa)/alfa*(K_hat(-1)/N_d);

[name='方程10：边际成本']

mc=w/((1-alfa)*A*(K_hat(-1)/N_d)^alfa);

[name='方程11：x1']

x1=lamb*mc*Y+fip*betta*(1+pi)^(-etap*epsilonp)*(1+pi(1))^epsilonp*x1(1);

[name='方程12：x2']

x2=lamb*Y+fip*betta*(1+pi)^(etap*(1-epsilonp))*(1+pi(1))^(epsilonp-1)*x2(1);

[name='方程13：最优通胀']

1+pi_star=epsilonp/(epsilonp-1)*(1+pi)*x1/x2;

[name='方程14：总资源约束']

Y=C+I+G;

[name='方程15：资本演化方程']

K=Z*(1-ki/2*(I/I(-1)-1)^2)*I+(1-delta0-delta1*(u-1)-delta2/2*(u-1)^2)*K(-1);

[name='方程16：生产函数']

Y*v_p=A*K_hat(-1)^alfa*N_d^(1-alfa);

[name='方程17：有效资本服务']

K_hat=u*K;

[name='方程18：价格扩散方程']

v_p=(1-fip)*((1+pi_star)/(1+pi))^(-epsilonp)+(1+pi(-1))^(-etap*epsilonp)*(1+pi)^epsilonp*fip*v_p(-1);

[name='方程19：通胀演化方程']

(1+pi)^(1-epsilonp)=(1-fip)*(1+pi_star)^(1-epsilonp)+(1+pi(-1))^(etap*(1-epsilonp))*fip;

[name='方程20：工资演化方程']

w^(1-epsilonw)=(1-fiw)*w_star^(1-epsilonw)+(1+pi(-1))^(etaw*(1-epsilonw))*fiw*(1+pi)^(epsilonw-1)*w(-1)^(1-epsilonw);

[name='方程21：货币政策-泰勒规则']

i=(1-rhoi)*steady_state(i)+rhoi*i(-1)+(1-rhoi)*(fipi*(pi-pi_target)+fiy*(log(Y)-log(Y(-1))))+e_i;

[name='方程22：财政支出政策']

log(G)=(1-rhog)*log(omegga*Y)+rhog*log(G(-1))+e_g;

[name='方程23：生产率冲击']

log(A)=rhoa*log(A(-1))+e_a;

[name='方程24：投资效率冲击']

log(Z)=rhoz*log(Z(-1))+e_z;

[name='方程25：跨期偏好冲击']

log(v)=rhov*log(v(-1))+e_v;

[name='方程26：期内偏好冲击']

log(pssi)=(1-rhopsi)*log(psis)+rhopsi*log(pssi(-1))+e_pssi;

[name='方程27：增值税冲击']

tauc=(1-rhotauc)*taucs+rhotauc*tauc(-1)+e_tauc;

[name='方程28：劳动所得税冲击']

taun=(1-rhotaun)*(tauns+fin*log(w*N_d/(steady_state(w)*steady_state(N_d))))+rhotaun*taun(-1)+e_taun;

[name='方程29：资本所得税冲击']

tauk=(1-rhotauk)*(tauks+fik*log(R*K_hat(-1)/(steady_state(R)*steady_state(K_hat))))+rhotauk*tauk(-1)+e_tauk;

/*
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%      观测方程
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[name='方程30：产出的观测方程']

Y_obs=log(Y)-log(Y(-1));

[name='方程31:消费的观测方程']

C_obs=log(C)-log(C(-1));

[name='方程32:投资的观测方程']

I_obs=log(I)-log(I(-1));

[name='方程33:通胀的观测方程']

pi_obs=pi-steady_state(pi);

[name='方程34:利率的观测方程']

R_obs=R-steady_state(R);

[name='方程35:劳动的观测方程']

N_d_obs=log(N_d)-log(N_d(-1));


[name='方程36:福利函数']
Welfare=v*(log(C-b*C(-1))-pssi*N_d^(1+ka)/(1+ka))+betta*Welfare(1);
*/
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     第四步 声明初值或稳态（忽略）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

initval;
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
% Welfare=1/(1-betta)*(log(C-b*C)-pssi*N_d^(1+ka)/(1+ka));
end;


resid;                            
check;
steady;
model_diagnostics;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     第五步 声明冲击
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

shocks;
var e_a;
stderr 0.01;
end;

/*
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     第六步 声明估计参数的先验分布
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

estimated_params;
rhoo,beta_pdf,0.72,0.05;
stderr e_a,inv_gamma_pdf,0.01,inf;
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     第七步 声明观测变量
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

varobs Y_obs C_obs I_obs N_d_obs R_obs pi_obs;
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     第八步 模拟或估计
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%estimation(datafile=,mode_compute=6,mh_replic=2000,mh_jscale=0.8,mode_check,bayesian_irf,forecast=20);

%stoch_simul(order=2,nograph);

optim_weights;
pi 0.5;
Y 0.5;
end;

osr_params fipi fiy;

osr_params_bounds;
fipi,0,100;
fiy,0,100;
end;

osr(opt_algo=9);

% make loop silent
options_.nofunctions=1;
options_.nocorr=1;
options_.noprint=1;
options_.irf=0;
options_.silent_optimizer=1;

options_.osr.opt_algo=9;

% find position of variables in variable_weights
y_pos=strmatch('Y',M_.endo_names,'exact');
pi_pos=strmatch('pi',M_.endo_names,'exact');

% find position of variables in M_.endo_names
y_pos_M_.endo_names=strmatch('Y',M_.endo_names,'exact');
pi_pos_M_.endo_names=strmatch('pi',M_.endo_names,'exact');

weight_grid=0:0.01:1;
n_grid_points=length(weight_grid);
var_y=NaN(n_grid_points,1);
var_pi=NaN(n_grid_points,1);
for grid_iter=1:n_grid_points
    M_.osr.variable_weights(pi_pos,pi_pos) = weight_grid(grid_iter);
    M_.osr.variable_weights(y_pos,y_pos) = (1-weight_grid(grid_iter));
    oo_.osr = osr(M_.endo_names,M_.osr.param_names,M_.osr.variable_indices,M_.osr.variable_weights);
    if oo_.osr.error_indicator==0
        var_y(grid_iter)=oo_.var(y_pos_M_.endo_names,y_pos_M_.endo_names);
        var_pi(grid_iter)=oo_.var(pi_pos_M_.endo_names,pi_pos_M_.endo_names);
    end
end

figure
plot(var_y,var_pi)
xlabel('standard deviation of Y')
ylabel('standard deviation of \pi')
title('monetary policy frontier')
