// =========================================================
// Based on Gauthier Vermandel
// Implemented by gustavoovital

// ===================== Variables =========================
var 
c       ${C}$   (long_name='Consumption')
k       ${K}$   (long_name='Capital')
a       ${A}$   (long_name='Tecnology')
y       ${Y}$   (long_name='Production')
i       ${I}$   (long_name='Investiment')
g       ${G}$   (long_name='Government Spend');

// ===================== Parameters ========================
parameters

alpha   ${\alpha}$  (long_name='Share of capital - production function')
beta    ${\beta}$   (long_name='Houlsehold discount factor')
delta   ${\delta}$  (long_name='Depratiation of capital')
rho_a   ${\rho_a}$  (long_name='AR(1) produtivity shock')
rho_g   ${\rho_g}$  (long_name='AR(1) government shock')
Css     ${C_{ss}}$  (long_name='Steady State comsuption')
Kss     ${K_{ss}$   (long_name='Steady State capital')
Yss     ${Y_{ss}}$  (long_name='Steady State Output')
Iss     ${I_{ss}}$  (long_name='Steady State Investiment')
gamma   ${\gamma}$  (long_name='Trend Factor')
gy      ${g^y}$     (long_name='Government Spend');     

// ====================== shocks ============================
varexo

e_a     ${e_a}$       (long_name='Produtivity shock')
e_g     ${e_g}$       (long_name='Government shock');

// ====================== Calibration =======================
alpha   =   0.40;
beta    =   0.99;
delta   =   0.025;
rho_a   =   0.95;
rho_g   =   0.95;
gamma   =   1.0078;
gy      =   0.2;
Kss     =   (gamma/beta - 1 + delta)*(1/alpha)^(1/(alpha-1));
Iss     =   (gamma - 1 - delta)*Kss;
Yss     =   Kss^alpha;
Css     =   (1 - gy)*Yss - Iss; 

// ======================== Model ===========================
model(linear);
    [name='Euler']
    c = -beta/gamma * Kss^(alpha-1) * (a(+1) - (1-alpha)*k) + beta*(alpha*Kss^(alpha-1) + (1-delta))*c(+1);

    [name='Production']
    y = a + alpha*k(-1);    
    
    [name='Identity']
    Yss*y = Css*c + Iss*i + gy*Yss*g;
    
    [name='Investiment']
    Iss*i = gamma*Kss*k - (1 - delta)*Kss*k(-1);
    
    [name='Produtivity Shock']
    a = rho_a*a(-1) + e_a;

    [name='Governement shock']
    g = rho_g*g(-1) + e_g;
end;

// ========================= Shocks =========================
shocks;
    var e_a; stderr .01;
    var e_g; stderr .01;
end;

// ========================= Checks =========================
check;

// ====================== Simulations =======================
stoch_simul(irf=25) c k a y i g;