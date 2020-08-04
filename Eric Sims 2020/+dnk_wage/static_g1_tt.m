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

assert(length(T) >= 15);

T = dnk_wage.static_resid_tt(T, y, x, params);

T(9) = getPowerDeriv(y(6),params(2),1);
T(10) = getPowerDeriv(y(6),params(2)-1,1);
T(11) = getPowerDeriv(y(6),params(3),1);
T(12) = getPowerDeriv(y(6),params(3)-1,1);
T(13) = getPowerDeriv(y(13),params(3),1);
T(14) = getPowerDeriv(y(13),1-params(3),1);
T(15) = getPowerDeriv(y(15)/y(13),(-params(3)),1);

end
