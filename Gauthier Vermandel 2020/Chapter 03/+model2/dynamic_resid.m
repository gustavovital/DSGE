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
    T = model2.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(12, 1);
lhs = params(2)*y(10);
rhs = T(1)*T(3);
residual(1) = lhs - rhs;
lhs = y(12);
rhs = T(4)*T(5);
residual(2) = lhs - rhs;
lhs = y(10)/y(18);
rhs = (1-params(3))/y(22)+y(20);
residual(3) = lhs - rhs;
lhs = y(18)*y(11);
rhs = y(8)-(1-params(3))*y(2);
residual(4) = lhs - rhs;
lhs = y(9);
rhs = T(7)*T(8);
residual(5) = lhs - rhs;
lhs = y(13);
rhs = y(9)*params(1)/y(2);
residual(6) = lhs - rhs;
lhs = y(12);
rhs = y(9)*(1-params(1))/y(14);
residual(7) = lhs - rhs;
lhs = y(9);
rhs = y(7)+y(11)+params(8)*(steady_state(3))*y(16);
residual(8) = lhs - rhs;
lhs = log(y(15));
rhs = params(4)*log(y(3))+x(it_, 1);
residual(9) = lhs - rhs;
lhs = log(y(16));
rhs = params(5)*log(y(4))+x(it_, 2);
residual(10) = lhs - rhs;
lhs = log(y(17));
rhs = params(6)*log(y(5))+x(it_, 3);
residual(11) = lhs - rhs;
lhs = log(y(18));
rhs = params(7)*log(y(6))+x(it_, 4);
residual(12) = lhs - rhs;

end
