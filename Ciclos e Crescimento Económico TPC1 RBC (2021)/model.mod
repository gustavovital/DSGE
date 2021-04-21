// variaveis endogenas
var 
b k n y c i r w l;

// variaveis exogenas
varexo 
eb;

// parametros
// psi e calculado abaixo para ser compativel com nss=1/3
parameters 
alph bet dlt rho sigb psi mu;
alph    = 0.33;
bet     = 0.99;
dlt     = 0.025;
rho     = 0.95;  
sigb    = 0.01;
mu      = 0.9; 

// valores para o estado estacionario
nss  = 1/3;
lss = 1 - nss;
rss  = 1/bet - 1;
knss = ( alph/(rss+dlt) )^(1/(1-alph));
kss = knss*nss;
yss  = (kss^alph)*(nss^(1-alph));
wss  = (1-alph)*yss/nss;
iss  = dlt*kss;
css  = yss-iss;
psi  = ((kss/nss)^alph)*(1/(css*(-(1-nss)^(-mu))));

// modelo
model; 

// processo tecnologico
log(b) = rho*log(b(-1)) - sigb*eb;

// juros = Pmg do Capital
r = alph*b(+1)*(k(+1)/n(+1))^(alph-1) - dlt;

// Euler - escolha intertemporal de consumo
c(+1) = bet*c*(1+r);

// lazer X consumo (intratemporal)
psi*c*(-(1-n)^(-mu)) = (1-alph)*b*(k/n)^alph;

// funcao de producao Cobb-Douglas
y = (k(-1)^alph)*((exp(b)*n)^(1-alph));

// equacao de acumulacao de capital
k = (1-dlt)*k(-1) + i;

// restricao de recursos
y = c + i;

// salario = Pmg do Trabalho
w = (1-alph)*(y/n);

// relação lazer x trabalho
n + l = 1;

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
b = 1;
eb = 0;
l = lss;
end;

// choque (inovacao tecnologica)
shocks;
var eb = 0.1;
end;

// inicio das simulacoes no estado estacionario
steady;

// simulacao
stoch_simul(irf = 100);