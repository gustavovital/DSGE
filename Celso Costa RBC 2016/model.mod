//RBC model - Chapter 2 (UNDERSTANDING DSGE MODELS)
//note: W and R are real in the simulation

var Y ${Y}$ (long_name='Output')
    I ${I}$ (long_name='Investiment')
    C ${C}$ (long_name='Consumption')
    R ${R}$ (long_name='Nominal Interest Rate')
    K ${K}$ (long_name='Capital')
    W ${W}$ (long_name='Wage')
    L ${L}$ (long_name='Labor')
    A ${A}$ (long_name='Tecnology');

varexo e n;

parameters sigma phi alpha beta delta rhoa;
sigma = 2;
phi = 1.5;
alpha = 0.35;
beta = 0.985;
delta = 0.025;
rhoa = 0.95;
model(linear);
#Pss = 1;
#Rss = Pss*((1/beta)-(1-delta));
#Wss = (1-alpha)*(Pss^(1/(1-alpha)))*((alpha/Rss)^(alpha/(1-alpha)));
#Yss = ((Rss/(Rss-delta*alpha))^(sigma/(sigma+phi)))*(((1-alpha)^(-phi))*((Wss/Pss)^(1+phi)))^(1/(sigma+phi));
#Kss = alpha*(Yss/Rss/Pss);
#Iss = delta*Kss;
#Css = Yss - Iss;
#Lss = (1-alpha)*(Yss/Wss/Pss);
//1-Labor supply
sigma*C + phi*L = W;
//2-Euler equation
(sigma/beta)*(C(+1)-C)=Rss*R(+1);
//3-Law of motion of capital
K = (1-delta)*K(-1)+delta*I;
//4-Production function
Y = A + alpha*K(-1) + (1-alpha)*L;
//5-Demand for capital
R = Y - K(-1);
//6-Demand for labor
W = Y - L ;
//7-Equilibrium condition
Yss*Y = Css*C + Iss*I;
//8-Productivity shock
A = rhoa*A(-1) + e;
end;

steady;

check;
model_diagnostics;
model_info;

shocks;

var e;
stderr 0.01;
end;

stoch_simul;
