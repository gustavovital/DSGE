// =========================================================
// Based on Gauthier Vermandel
// Implemented by gustavoovital

// ===================== Variables =========================
var 
c       ${C}$       (long_name='Consumption')
k       ${K}$       (long_name='Capital')
y       ${Y}$       (long_name='Production')
r       ${R}$       (long_name='Returns')
i       ${I}$       (long_name='Investment')
w       ${W}$       (long_name='Wage')
z       ${Z}$       (long_name='Capital Remuneration')
h       ${H}$       (long_name='Hours of labor')
e_a     ${e_a}$     (long_name='Produtivity shock')
e_g     ${e_g}$     (long_name='Government shock')
e_c     ${e_c}$     (long_name='Comsumption shock')
e_i     ${e_i}$     (long_name='Investment shock');


// ===================== Parameters ========================
parameters

alpha       ${\alpha}$      (long_name='Share of capital - production function')
beta        ${\beta}$       (long_name='Houlsehold discount factor')
delta       ${\delta}$      (long_name='Depratiation of capital')
rho_a       ${\rho_a}$      (long_name='AR(1) shock produtivity')
rho_g       ${\rho_g}$      (long_name='AR(1) shock government')
rho_c       ${\rho_c}$      (long_name='AR(1) shock comsumption')
rho_i       ${\rho_i}$      (long_name='AR(1) shock investment')
gy          ${gy}$          (long_name='Government Spending')
sigma_c     ${\sigma_c}$    (long_name='Comsumption risk')
chi         ${\chi}$        (long_name='Labour parameter')
sigma_l     ${\sigma_l}$    (long_name='Desutility of labor');  

// ====================== Calibration =======================
alpha       =   0.36;
beta        =   0.99;
delta       =   0.025;
rho_a       =   0.95;
rho_c       =   0.95;
rho_g       =   0.95;
rho_i       =   0.95;
sigma_c     =   1;
sigma_l     =   1;
gy          =   0.2;

// ====================== shocks ============================
varexo

n_a     ${n_a}$     (long_name='Produtivity shock')
n_g     ${n_g}$     (long_name='Government shock')
n_c     ${n_c}$     (long_name='Comsumption shock')
n_i     ${n_i}$     (long_name='Investment shock');

// ======================== Model ===========================
model;

[name='Euler Equation']
beta*r = (e_c/e_c(+1)) * (c(+1)/c)^sigma_c;

[name='Labour supply']
w = chi * (h^sigma_l )*(c^sigma_c);

[name='Relation bounds and assets']
r/e_i = (1-delta)/e_i(+1) + z(+1);

[name='Law of motion of capital']
e_i*i = k-(1-delta)*k(-1);

[name='tecnology']
y = e_a*(k(-1)^alpha)*(h^(1-alpha));

[name='minimization costs']
z = alpha*y/k(-1);
w = (1-alpha)*y/h;

[name='Identity']
y = c + i + gy*steady_state(y)*e_g;

[name='Shocks']
log(e_a) = rho_a*log(e_a(-1)) + n_a;
log(e_g) = rho_g*log(e_g(-1)) + n_g;
log(e_c) = rho_c*log(e_c(-1)) + n_c;
log(e_i) = rho_i*log(e_i(-1)) + n_i;

end;

// ======================== STEADY STATE ============================

steady_state_model;

e_a =   1;
e_g =   1;
e_c =   1;
e_i =   1;
r   =   1/beta;
z   =   r - (1-delta);
h   =   1/3;
k   =   h*(z/alpha)^(1/(alpha-1));
y   =   k^alpha * h^(1 - alpha);
w   =   (1 - alpha)*y/h;
i   =   delta*k;
c   =   (1 - gy)*y - i;
chi =   w/(h^sigma_l * c^sigma_c);

end;

// =======================  CHECK ==============================

shocks;
	var n_a;  stderr 0.01;
	var n_g;  stderr 0.01;
	var n_c;  stderr 0.01;
	var n_i;  stderr 0.01;
end;

resid(1);
steady;

stoch_simul(irf=60) y c k i h w r z;
