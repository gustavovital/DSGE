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
    T = dnk_wage.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(24, 1);
lhs = params(8)*y(7)^params(7);
rhs = T(1)*y(10);
residual(1) = lhs - rhs;
lhs = 1;
rhs = y(11)*y(32)*T(2);
residual(2) = lhs - rhs;
lhs = y(13);
rhs = params(1)*(y(9)/y(1))^(-params(6));
residual(3) = lhs - rhs;
lhs = y(14);
rhs = params(2)/(params(2)-1)*y(15)/y(16);
residual(4) = lhs - rhs;
lhs = y(15);
rhs = y(17)*y(18)+y(32)*params(4)*T(3)*y(33);
residual(5) = lhs - rhs;
lhs = y(16);
rhs = y(18)+y(32)*params(4)*T(4)*y(34);
residual(6) = lhs - rhs;
lhs = y(19);
rhs = y(17)*y(20);
residual(7) = lhs - rhs;
lhs = y(21);
rhs = params(3)/(params(3)-1)*y(22)/y(23);
residual(8) = lhs - rhs;
lhs = y(22);
rhs = y(10)*T(5)*y(8)+y(32)*params(5)*T(6)*y(35);
residual(9) = lhs - rhs;
lhs = y(23);
rhs = T(5)*y(8)+y(32)*params(5)*T(7)*y(36);
residual(10) = lhs - rhs;
lhs = 1;
rhs = (1-params(4))*y(14)^(1-params(2))+params(4)*y(12)^(params(2)-1);
residual(11) = lhs - rhs;
lhs = y(19)^(1-params(3));
rhs = (1-params(5))*y(21)^(1-params(3))+T(8)*T(9);
residual(12) = lhs - rhs;
lhs = y(18);
rhs = y(9);
residual(13) = lhs - rhs;
lhs = y(18)*y(24);
rhs = y(25);
residual(14) = lhs - rhs;
lhs = y(25);
rhs = y(20)*y(8);
residual(15) = lhs - rhs;
lhs = y(7);
rhs = y(8)*y(26);
residual(16) = lhs - rhs;
lhs = y(26);
rhs = (1-params(5))*(y(21)/y(19))^(-params(3))+T(10)*T(11)*y(6);
residual(17) = lhs - rhs;
lhs = y(24);
rhs = (1-params(4))*y(14)^(-params(2))+T(12)*y(5);
residual(18) = lhs - rhs;
lhs = log(y(20));
rhs = params(9)*log(y(4))+params(12)*x(it_, 1);
residual(19) = lhs - rhs;
lhs = log(y(11));
rhs = (1-params(10))*(-log(params(1)))+params(10)*log(y(2))+(1-params(10))*params(11)*log(y(12))+params(13)*x(it_, 2);
residual(20) = lhs - rhs;
lhs = y(27);
rhs = log(y(18));
residual(21) = lhs - rhs;
lhs = y(28);
rhs = log(y(12));
residual(22) = lhs - rhs;
lhs = y(30);
rhs = log(y(11));
residual(23) = lhs - rhs;
lhs = y(29);
rhs = log(y(8));
residual(24) = lhs - rhs;

end
