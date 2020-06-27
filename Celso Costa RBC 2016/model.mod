// VARIAVEIS ENDOGENAS

var A R W Y I C L K;

// VARIAVEIS EXOGENAS

varexo e;

// PARAMETROS

parameters sigma phi alpha beta delta rho;

sigma = 2;
phi = 1.5;
alpha = 0.35;
beta = 0.985;
delta = 0.025;
rho = 0.95;

// ESTADO ESTACIONARIO

Ass = 1;
Pss = 1;
Rss = Pss*(1/beta - (1 - delta));
Wss = (1 - alpha)*Pss^(1/(1-alpha))*(alpha/Rss)^(alpha/(1-alpha));
Yss = (Rss/Rss - delta*alpha)^(sigma/(sigma + phi)) * (Wss/Pss * ((Wss/Pss)/(1 - alpha)))^(1/(sigma + phi));
Iss = (delta*alpha/Rss)*Yss;
Css = 1/(Yss^(phi/sigma))*((1 - alpha)^(-phi) * (Wss/Pss)^(1+phi))^(1/sigma);
Kss = alpha*(Yss/(Rss/Pss));
Lss = (1 - alpha)*(Yss/(Wss/Pss));

// MODELO

model;

C^sigma * L^phi = W;
C(+1) / C = beta*((1-delta) + R(+1));
K(+1) = (1-delta)*K + I;
Y = A*K^alpha * L^(1-alpha);
K = alpha * Y/R;
L = (1-alpha)*Y/W;
Y = C + I;
log(A) = rho*log(A(-1)) + e; 
 
end;

// INITIAL GUESS

initval;
A = Ass;
R = Rss;
W = Wss;
Y = Yss;
I = Iss;
C = Css;
L = Lss;
K = Kss;
e = 0;
end;

model_info;
model_diagnostics;

resid;
steady(maxit=10000);

check;

