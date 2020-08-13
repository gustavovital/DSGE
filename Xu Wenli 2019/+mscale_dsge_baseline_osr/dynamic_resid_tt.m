function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
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

assert(length(T) >= 40);

T(1) = (1+y(50))^(-1);
T(2) = params(8)/2;
T(3) = 1-T(2)*(y(26)/y(5)-1)^2;
T(4) = T(3)-y(26)*params(8)*(y(26)/y(5)-1)/y(5);
T(5) = y(54)/y(26)-1;
T(6) = params(8)*params(1)*y(48)*y(53)*T(5);
T(7) = (y(54)/y(26))^2;
T(8) = params(6)/2;
T(9) = 1-params(4)-params(5)*(y(52)-1)-T(8)*(y(52)-1)^2;
T(10) = y(29)/y(30);
T(11) = T(10)^(params(10)*(1+params(11)));
T(12) = y(33)^(1+params(11));
T(13) = params(1)*params(9)*(1+y(22))^((1+params(11))*params(10)*(-params(12)));
T(14) = (1+y(50))^(params(10)*(1+params(11)));
T(15) = y(56)/y(30);
T(16) = T(15)^(params(10)*(1+params(11)));
T(17) = T(10)^params(10);
T(18) = params(1)*params(9)*(1+y(22))^(params(12)*(1-params(10)));
T(19) = (1+y(50))^(params(10)-1);
T(20) = T(15)^params(10);
T(21) = (1-params(3))/params(3);
T(22) = y(9)/y(33);
T(23) = T(22)^params(3);
T(24) = (1-params(3))*y(42)*T(23);
T(25) = params(1)*params(15)*(1+y(22))^((-params(14))*params(13));
T(26) = (1+y(50))^params(13);
T(27) = params(1)*params(15)*(1+y(22))^(params(14)*(1-params(13)));
T(28) = (1+y(50))^(params(13)-1);
T(29) = (1+y(22))*params(13)/(params(13)-1);
T(30) = 1-params(4)-params(5)*(y(24)-1)-T(8)*(y(24)-1)^2;
T(31) = y(9)^params(3);
T(32) = y(42)*T(31);
T(33) = y(33)^(1-params(3));
T(34) = (1+y(3))^((-params(14))*params(13));
T(35) = (1+y(22))^params(13);
T(36) = params(9)*(1+y(3))^(params(12)*(1-params(10)));
T(37) = (1+y(22))^(params(10)-1);
T(38) = y(8)^(1-params(10));
T(39) = y(29)*y(33)/((steady_state(12))*(steady_state(16)));
T(40) = y(23)*y(9)/((steady_state(6))*(steady_state(17)));

end
