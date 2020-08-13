function T = dynamic_g2_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g2_tt(T, y, x, params, steady_state, it_)
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

assert(length(T) >= 98);

T = mscale_dsge_baseline_osr.dynamic_g1_tt(T, y, x, params, steady_state, it_);

T(91) = (-(T(2)*(T(58)*(-((-y(26))*(y(5)+y(5))))/(y(5)*y(5)*y(5)*y(5))+T(57)*2*T(57))));
T(92) = getPowerDeriv(T(10),params(10)*(1+params(11)),2);
T(93) = (-1)/(y(30)*y(30));
T(94) = getPowerDeriv(T(15),params(10)*(1+params(11)),2);
T(95) = getPowerDeriv(T(10),params(10),2);
T(96) = getPowerDeriv(T(15),params(10),2);
T(97) = getPowerDeriv(T(22),params(3),2);
T(98) = getPowerDeriv((1+y(37))/(1+y(22)),(-params(13)),2);

end
