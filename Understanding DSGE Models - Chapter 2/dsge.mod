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
C = c;
L = l;
W = w;
R = r;
I = i;
K = k;
Y = y;
end;
    
//simulações
steady;
check;
model_diagnostics;
model_info;
shocks;

var e;
stderr 0.01;
end;
stoch_simul;    