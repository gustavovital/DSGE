// resolução de um rbc simples

// variaveis endogenas
var C L W R I K Y A;

// variaveis exogenas
varexo e;

// parametros
parameters sigma varpi alpha beta delta rho;

sigma = 2;
varpi = 1.5;
alpha = 0.35;
beta = 0.985;
delta = 0.025;
rho = 0.95;

//estado estacionario
Rss = 1/beta -(1-delta);
Wss = (1-alpha)*(alpha/Rss)^(alpha/(1-alpha));
Yss = (Rss/(Rss - delta*alpha))^(sigma/(sigma+varpi)) * (Wss*(Wss/(1-alpha))^varpi)^(1/(sigma+varpi));
Iss = (delta*alpha / Rss)*Yss;
Css = 1/(Yss^(varpi/sigma)) * ((1-alpha)^(-varpi) * Wss^(1+varpi))^(1/sigma);
Kss = alpha*(Yss/Rss);
Lss = (1-alpha)*(Yss/Wss);

//modelo
model;
C^sigma * L^varpi = W; // oferta de trabalho
C(+1)/C = beta*((1 - delta) + R(+1)); // eq de euler
K(+1) = (1 - delta)*K + I; //movimento do capital
Y = A*K^alpha * L^(1 - alpha); // funcao de producao 
K = alpha*Y/R; //demanda por capital
L = (1 - alpha)*Y/W; // demanda por trabalho
Y = C + I; // condicao de equilibrio
A = (1 - rho) + rho*A(-1) + e;
end;

//valores no estado estacionario
initval;
C = Css;
L = Lss;
W = Wss;
R = Rss;
I = Iss;
K = Kss;
Y = Yss;
end;
    
//simulações
//steady;
