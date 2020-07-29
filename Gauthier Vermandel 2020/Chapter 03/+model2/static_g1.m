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
    T = model2.static_g1_tt(T, y, x, params);
end
g1 = zeros(12, 12);
g1(1,4)=params(2);
g1(2,1)=(-(T(1)*getPowerDeriv(y(1),params(9),1)));
g1(2,6)=1;
g1(2,8)=(-(T(2)*params(10)*getPowerDeriv(y(8),params(11),1)));
g1(3,4)=1/y(12);
g1(3,7)=(-1);
g1(3,12)=(-y(4))/(y(12)*y(12))-(-(1-params(3)))/(y(12)*y(12));
g1(4,2)=(-(1-(1-params(3))));
g1(4,5)=y(12);
g1(4,12)=y(5);
g1(5,2)=(-(T(5)*y(9)*getPowerDeriv(y(2),params(1),1)));
g1(5,3)=1;
g1(5,8)=(-(T(4)*getPowerDeriv(y(8),1-params(1),1)));
g1(5,9)=(-(T(3)*T(5)));
g1(6,2)=(-((-(y(3)*params(1)))/(y(2)*y(2))));
g1(6,3)=(-(params(1)/y(2)));
g1(6,7)=1;
g1(7,3)=(-((1-params(1))/y(8)));
g1(7,6)=1;
g1(7,8)=(-((-(y(3)*(1-params(1))))/(y(8)*y(8))));
g1(8,1)=(-1);
g1(8,3)=1-params(8)*y(10);
g1(8,5)=(-1);
g1(8,10)=(-(params(8)*(y(3))));
g1(9,9)=1/y(9)-params(4)*1/y(9);
g1(10,10)=1/y(10)-params(5)*1/y(10);
g1(11,11)=1/y(11)-params(6)*1/y(11);
g1(12,12)=1/y(12)-params(7)*1/y(12);
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
