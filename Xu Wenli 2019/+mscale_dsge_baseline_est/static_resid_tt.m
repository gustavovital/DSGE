function T = static_resid_tt(T, y, x, params)
% function T = static_resid_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 20);

T(1) = (1+y(5))^(-1);
T(2) = 1-params(4)-params(5)*(y(7)-1)-params(6)/2*(y(7)-1)^2;
T(3) = y(12)/y(13);
T(4) = T(3)^(params(10)*(1+params(11)));
T(5) = y(16)^(1+params(11));
T(6) = params(1)*params(9)*(1+y(5))^((1+params(11))*params(10)*(-params(12)));
T(7) = (1+y(5))^(params(10)*(1+params(11)));
T(8) = T(3)^params(10);
T(9) = (1+y(5))^(params(12)*(1-params(10)));
T(10) = (1+y(5))^(params(10)-1);
T(11) = (y(17)/y(16))^params(3);
T(12) = (1-params(3))*y(25)*T(11);
T(13) = (1+y(5))^((-params(14))*params(13));
T(14) = (1+y(5))^params(13);
T(15) = (1+y(5))^(params(14)*(1-params(13)));
T(16) = (1+y(5))^(params(13)-1);
T(17) = y(17)^params(3);
T(18) = y(25)*T(17);
T(19) = y(16)^(1-params(3));
T(20) = y(12)^(1-params(10));

end
