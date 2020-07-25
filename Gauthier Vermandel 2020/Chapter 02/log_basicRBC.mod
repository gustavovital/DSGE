var y c k a;
varexo e_a;
parameters  alpha beta delta gamma rho Css Kss;

% Calibration
alpha		= 0.40;				% capital share in production 
beta    	= 0.99;				% discount factor
delta    	= 0.025;			% depreciation rate
rho			= 0.95;				% shock autocorrelation
gamma		= 1.005;				% Trend growth factor

% steady states
Kss			= ((gamma/beta-(1-delta))/alpha)^(1/(alpha-1));
Css			= Kss^alpha - (1-delta-gamma)*Kss;

% Model
model(linear);
	% Budget constraint // resource constraint
	Css*c + gamma*Kss*k = (Kss^alpha)*( a + alpha*k(-1) ) + (1-delta)*Kss*k(-1);
	% Euler equation
	c-c(+1) = -beta/gamma*alpha*(Kss^(alpha-1))*(a(+1) - (1-alpha)*k);
	% production
	y = a + alpha*k(-1);
	% productivity shock
	a = rho*a(-1)+e_a;
end;

varobs y;

estimated_params;
	stderr	e,	0.007,	0,	inf;
			rho,	0.95,	0,	1;
end;

estimation(datafile='mydata.mat');
