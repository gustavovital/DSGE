// Baseado em Eric Sims 

// variaveis endogenas
var 
z k n y c i r w;

// variaveis exogenas
varexo 
ez;

// parametros
// psi e calculado abaixo para ser compativel com nss=1/3
parameters 
alph bet dlt rho sigz psi;
alph    = 0.33;
bet     = 0.99;
dlt     = 0.025;
rho     = 0.95;  
sigz    = 0.01;

// valores para o estado estacionario
nss  = 1/3;
rss  = 1/bet - 1;
knss = ( alph/(rss+dlt) )^(1/(1-alph));
kss = knss*nss;
yss  = (kss^alph)*(nss^(1-alph));
wss  = (1-alph)*yss/nss;
iss  = dlt*kss;
css  = yss-iss;
psi  = ((1-nss)*wss/nss)/(knss^alph-dlt*knss);


// modelo
model; 

// processo tecnologico
log(z) = rho*log(z(-1)) - sigz*ez;

// juros = Pmg do Capital
r = alph*z(+1)*(k(+1)/n(+1))^(alph-1) - dlt;

// Euler - escolha intertemporal de consumo
c(+1) = bet*c*(1+r);

// lazer X consumo (intratemporal)
psi*c/(1-n) = (1-alph)*z*(k/n)^alph;

// funcao de producao Cobb-Douglas
y = (k(-1)^alph)*((exp(z)*n)^(1-alph));

// equacao de acumulacao de capital
k = (1-dlt)*k(-1) + i;

// restricao de recursos
y = c + i;

// salario = Pmg do Trabalho
w = (1-alph)*(y/n);

end;
// final do modelo

// valores iniciais no estado estacionario
initval;
y = yss;
c = css;
i = iss;
n = nss;
k = kss;
r = rss;
w = wss;
z = 1;
ez = 0;
end;

// choque (inovacao tecnologica)
shocks;
var ez = 0.1;
end;

// inicio das simulacoes no estado estacionario
steady;

// simulacao
stoch_simul(irf = 100);