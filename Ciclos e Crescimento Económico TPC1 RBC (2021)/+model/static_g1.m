function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = model.static_g1_tt(T, y, x, params);
end
g1 = zeros(9, 9);
g1(1,1)=1/y(1)-params(4)*1/y(1);
g1(2,1)=(-(params(1)*T(2)));
g1(2,2)=(-(y(1)*params(1)*1/y(3)*T(8)));
g1(2,3)=(-(y(1)*params(1)*T(8)*(-y(2))/(y(3)*y(3))));
g1(2,7)=1;
g1(3,5)=1-params(2)*(1+y(7));
g1(3,7)=(-(y(5)*params(2)));
g1(4,1)=(-((1-params(1))*T(4)));
g1(4,2)=(-(y(1)*(1-params(1))*1/y(3)*T(9)));
g1(4,3)=y(5)*params(6)*getPowerDeriv(1-y(3),(-params(7)),1)-y(1)*(1-params(1))*T(9)*(-y(2))/(y(3)*y(3));
g1(4,5)=params(6)*T(3);
g1(5,1)=(-(T(5)*y(3)*exp(y(1))*T(7)));
g1(5,2)=(-(T(6)*getPowerDeriv(y(2),params(1),1)));
g1(5,3)=(-(T(5)*exp(y(1))*T(7)));
g1(5,4)=1;
g1(6,2)=1-(1-params(3));
g1(6,6)=(-1);
g1(7,4)=1;
g1(7,5)=(-1);
g1(7,6)=(-1);
g1(8,3)=(-((1-params(1))*(-y(4))/(y(3)*y(3))));
g1(8,4)=(-((1-params(1))*1/y(3)));
g1(8,8)=1;
g1(9,3)=1;
g1(9,9)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
