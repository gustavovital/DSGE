// =========================================================
// Based on Gauthier Vermandel
// Implemented by gustavoovital

// ===================== Variables =========================
var 
c       ${C}$   (long_name='Consumption')
k       ${K}$   (long_name='Capital')
a       ${A}$   (long_name='Tecnology');

// ===================== Parameters ========================
parameters

alpha   ${\alpha}$  (long_name='Share of capital - production function')
beta    ${\beta}$   (long_name='Houlsehold discount factor')
delta   ${\delta}$  (long_name='Depratiation of capital')
rho     ${\rho}$    (long_name='AR(1) shock')
Css     ${C_{ss}}$  (long_name='Steady State comsuption')
Kss     ${K_{ss}$   (long_name='Steady State capital'); 

// ====================== shocks ============================
varexo

e       ${e}$       (long_name='Produtivity shock');

// ====================== Calibration =======================
alpha   =   0.40;
beta    =   0.99;
delta   =   0.025;
rho     =   0.95;
Kss     =   (1/beta - 1 + delta)*(1/alpha)^(1/(alpha-1));
Css     =   Kss^alpha - delta*Kss;

// ======================== Model ===========================
model(linear);
    [name='Euler']
    c = c(+1) - beta*alpha*Kss*(a(+1) + (alpha-1)*k);
    [name='Constraint']
    k = Kss^(alpha-1) * (a + alpha*k(-1)) + (1 - delta)*k(-1) - Css*c/Kss;
    [name='Produtivity Shock']
    a = rho*a(-1) + e;
end;

// ========================= Shocks =========================
shocks;
    var e; stderr .007;
end;

// ========================= Checks =========================
check;

// ====================== Simulations =======================
stoch_simul(irf=40, nodisplay) c k a;