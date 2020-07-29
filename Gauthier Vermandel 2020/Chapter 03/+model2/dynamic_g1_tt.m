function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 19);

T = model2.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(9) = (-((y(19)-params(12)*y(7))*(-params(12))))/((y(7)-params(12)*y(1))*(y(7)-params(12)*y(1)));
T(10) = getPowerDeriv(T(2),params(9),1);
T(11) = ((y(7)-params(12)*y(1))*(-params(12))-(y(19)-params(12)*y(7)))/((y(7)-params(12)*y(1))*(y(7)-params(12)*y(1)));
T(12) = getPowerDeriv(y(7),params(9),1);
T(13) = T(10)*1/(y(7)-params(12)*y(1));
T(14) = getPowerDeriv(y(2),params(1),1);
T(15) = y(15)*T(14);
T(16) = params(10)*getPowerDeriv(y(14),params(11),1);
T(17) = getPowerDeriv(y(14),1-params(1),1);
T(18) = 1/y(21);
T(19) = (-y(17))/(y(21)*y(21));

end
