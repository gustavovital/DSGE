function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = mscale_dsge_baseline.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(30, 1);
lhs = (1+y(44))*y(18);
rhs = y(27)/(y(20)-params(2)*y(1))-params(2)*params(1)*y(56)/(y(50)-y(20)*params(2));
residual(1) = lhs - rhs;
lhs = y(18)*(1-y(46))*y(23);
rhs = y(19)*(params(5)+params(6)*(y(24)-1));
residual(2) = lhs - rhs;
lhs = y(18);
rhs = params(1)*y(48)*(1+y(21))*T(1);
residual(3) = lhs - rhs;
lhs = (1+y(44))*y(18);
rhs = y(19)*y(25)*T(4)+T(6)*T(7);
residual(4) = lhs - rhs;
lhs = y(19);
rhs = params(1)*(y(48)*(1-y(62))*y(52)*y(53)+y(49)*T(9));
residual(5) = lhs - rhs;
lhs = y(31);
rhs = y(27)*y(28)*T(11)*T(12)+T(13)*T(14)*T(16)*y(58);
residual(6) = lhs - rhs;
lhs = y(32);
rhs = y(33)*y(18)*(1-y(45))*T(17)+T(18)*T(19)*T(20)*y(59);
residual(7) = lhs - rhs;
lhs = y(30);
rhs = y(31)*params(10)/(params(10)-1)/y(32);
residual(8) = lhs - rhs;
lhs = y(29)/y(23);
rhs = T(21)*T(22);
residual(9) = lhs - rhs;
lhs = y(36);
rhs = y(29)/T(24);
residual(10) = lhs - rhs;
lhs = y(38);
rhs = y(18)*y(36)*y(40)+T(25)*T(26)*y(60);
residual(11) = lhs - rhs;
lhs = y(39);
rhs = y(18)*y(40)+T(27)*T(28)*y(61);
residual(12) = lhs - rhs;
lhs = 1+y(37);
rhs = y(38)*T(29)/y(39);
residual(13) = lhs - rhs;
lhs = y(40);
rhs = y(20)+y(26)+y(41);
residual(14) = lhs - rhs;
lhs = y(35);
rhs = y(26)*y(25)*T(3)+T(30)*y(10);
residual(15) = lhs - rhs;
lhs = y(40)*y(43);
rhs = T(32)*T(33);
residual(16) = lhs - rhs;
lhs = y(34);
rhs = y(24)*y(35);
residual(17) = lhs - rhs;
lhs = y(43);
rhs = (1-params(15))*((1+y(37))/(1+y(22)))^(-params(13))+params(15)*T(34)*T(35)*y(14);
residual(18) = lhs - rhs;
lhs = (1+y(22))^(1-params(13));
rhs = (1-params(15))*(1+y(37))^(1-params(13))+params(15)*(1+y(3))^(params(14)*(1-params(13)));
residual(19) = lhs - rhs;
lhs = y(29)^(1-params(10));
rhs = (1-params(9))*y(30)^(1-params(10))+T(36)*T(37)*T(38);
residual(20) = lhs - rhs;
lhs = y(21);
rhs = (1-params(16))*(steady_state(4))+params(16)*y(2)+(1-params(16))*(params(17)*(y(22)-params(7))+params(18)*(log(y(40))-log(y(11))))+x(it_, 2);
residual(21) = lhs - rhs;
lhs = log(y(41));
rhs = (1-params(21))*log(y(40)*params(31))+params(21)*log(y(12))+x(it_, 1);
residual(22) = lhs - rhs;
lhs = log(y(42));
rhs = params(19)*log(y(13))+x(it_, 3);
residual(23) = lhs - rhs;
lhs = log(y(25));
rhs = params(20)*log(y(4))+x(it_, 4);
residual(24) = lhs - rhs;
lhs = log(y(27));
rhs = params(22)*log(y(6))+x(it_, 5);
residual(25) = lhs - rhs;
lhs = log(y(28));
rhs = (1-params(23))*log(params(24))+params(23)*log(y(7))+x(it_, 6);
residual(26) = lhs - rhs;
lhs = y(44);
rhs = (1-params(25))*params(26)+params(25)*y(15)+x(it_, 7);
residual(27) = lhs - rhs;
lhs = y(45);
rhs = (1-params(27))*(params(28)+params(32)*log(T(39)))+params(27)*y(16)+x(it_, 8);
residual(28) = lhs - rhs;
lhs = y(46);
rhs = (1-params(29))*(params(30)+params(33)*log(T(40)))+params(29)*y(17)+x(it_, 9);
residual(29) = lhs - rhs;
lhs = y(47);
rhs = y(27)*(log(y(20)-params(2)*y(1))-y(28)*T(12)/(1+params(11)))+params(1)*y(63);
residual(30) = lhs - rhs;

end
