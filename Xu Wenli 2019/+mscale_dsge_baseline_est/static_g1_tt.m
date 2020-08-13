function T = static_g1_tt(T, y, x, params)
% function T = static_g1_tt(T, y, x, params)
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

assert(length(T) >= 31);

T = mscale_dsge_baseline_est.static_resid_tt(T, y, x, params);

T(21) = getPowerDeriv(1+y(5),params(12)*(1-params(10)),1);
T(22) = getPowerDeriv(1+y(5),params(10)-1,1);
T(23) = getPowerDeriv(1+y(5),(-params(14))*params(13),1);
T(24) = getPowerDeriv(1+y(5),params(13),1);
T(25) = getPowerDeriv(1+y(5),params(14)*(1-params(13)),1);
T(26) = getPowerDeriv((1+y(20))/(1+y(5)),(-params(13)),1);
T(27) = getPowerDeriv(T(3),params(10)*(1+params(11)),1);
T(28) = getPowerDeriv(T(3),params(10),1);
T(29) = getPowerDeriv(y(12),1-params(10),1);
T(30) = getPowerDeriv(y(16),1+params(11),1);
T(31) = getPowerDeriv(y(17)/y(16),params(3),1);

end
