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
    T = model.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(8, 1);
lhs = log(y(3));
rhs = params(4)*log(y(1))-params(5)*x(it_, 1);
residual(1) = lhs - rhs;
lhs = y(9);
rhs = params(1)*y(11)*T(1)-params(3);
residual(2) = lhs - rhs;
lhs = y(14);
rhs = params(2)*y(7)*(1+y(9));
residual(3) = lhs - rhs;
lhs = y(7)*params(6)/(1-y(5));
rhs = y(3)*(1-params(1))*T(2);
residual(4) = lhs - rhs;
lhs = y(6);
rhs = T(3)*T(4);
residual(5) = lhs - rhs;
lhs = y(4);
rhs = y(2)*(1-params(3))+y(8);
residual(6) = lhs - rhs;
lhs = y(6);
rhs = y(7)+y(8);
residual(7) = lhs - rhs;
lhs = y(10);
rhs = (1-params(1))*y(6)/y(5);
residual(8) = lhs - rhs;

end
