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

assert(length(T) >= 90);

T = mscale_dsge_baseline_est.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(41) = getPowerDeriv(1+y(3),(-params(14))*params(13),1);
T(42) = params(9)*getPowerDeriv(1+y(3),params(12)*(1-params(10)),1);
T(43) = params(1)*params(9)*getPowerDeriv(1+y(22),(1+params(11))*params(10)*(-params(12)),1);
T(44) = params(1)*params(9)*getPowerDeriv(1+y(22),params(12)*(1-params(10)),1);
T(45) = params(1)*params(15)*getPowerDeriv(1+y(22),(-params(14))*params(13),1);
T(46) = params(1)*params(15)*getPowerDeriv(1+y(22),params(14)*(1-params(13)),1);
T(47) = (-(1+y(37)))/((1+y(22))*(1+y(22)));
T(48) = getPowerDeriv((1+y(37))/(1+y(22)),(-params(13)),1);
T(49) = getPowerDeriv(1+y(22),params(13),1);
T(50) = getPowerDeriv(1+y(22),params(10)-1,1);
T(51) = getPowerDeriv(1+y(57),(-1),1);
T(52) = getPowerDeriv(1+y(57),params(10)*(1+params(11)),1);
T(53) = getPowerDeriv(1+y(57),params(10)-1,1);
T(54) = getPowerDeriv(1+y(57),params(13),1);
T(55) = getPowerDeriv(1+y(57),params(13)-1,1);
T(56) = y(9)/((steady_state(6))*(steady_state(17)));
T(57) = (-y(26))/(y(5)*y(5));
T(58) = 2*(y(26)/y(5)-1);
T(59) = (-(T(2)*T(57)*T(58)));
T(60) = T(59)-(y(5)*y(26)*params(8)*T(57)-y(26)*params(8)*(y(26)/y(5)-1))/(y(5)*y(5));
T(61) = 1/y(5);
T(62) = (-(T(2)*T(58)*T(61)));
T(63) = params(8)*(y(26)/y(5)-1)+y(26)*params(8)*T(61);
T(64) = T(62)-T(63)/y(5);
T(65) = (-y(61))/(y(26)*y(26));
T(66) = 2*y(61)/y(26);
T(67) = T(65)*T(66);
T(68) = 1/y(26);
T(69) = T(66)*T(68);
T(70) = getPowerDeriv(y(8),1-params(10),1);
T(71) = 1/y(30);
T(72) = getPowerDeriv(T(10),params(10)*(1+params(11)),1);
T(73) = getPowerDeriv(T(10),params(10),1);
T(74) = y(33)/((steady_state(12))*(steady_state(16)));
T(75) = (-y(29))/(y(30)*y(30));
T(76) = T(72)*T(75);
T(77) = (-y(63))/(y(30)*y(30));
T(78) = getPowerDeriv(T(15),params(10)*(1+params(11)),1);
T(79) = T(77)*T(78);
T(80) = getPowerDeriv(T(15),params(10),1);
T(81) = getPowerDeriv(y(33),1+params(11),1);
T(82) = (-y(9))/(y(33)*y(33));
T(83) = getPowerDeriv(T(22),params(3),1);
T(84) = getPowerDeriv(y(33),1-params(3),1);
T(85) = y(29)/((steady_state(12))*(steady_state(16)));
T(86) = 1/y(33);
T(87) = (1-params(3))*y(42)*T(83)*T(86);
T(88) = getPowerDeriv(y(9),params(3),1);
T(89) = y(42)*T(88);
T(90) = y(23)/((steady_state(6))*(steady_state(17)));

end
