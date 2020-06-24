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
    T = dsge.static_g1_tt(T, y, x, params);
end
g1 = zeros(8, 8);
g1(1,1)=T(2)*getPowerDeriv(y(1),params(1),1);
g1(1,2)=T(1)*getPowerDeriv(y(2),params(2),1);
g1(1,3)=(-1);
g1(2,4)=(-params(4));
g1(3,5)=(-1);
g1(3,6)=1-(1-params(5));
g1(4,2)=(-(T(4)*getPowerDeriv(y(2),1-params(3),1)));
g1(4,6)=(-(T(5)*y(8)*getPowerDeriv(y(6),params(3),1)));
g1(4,7)=1;
g1(4,8)=(-(T(3)*T(5)));
g1(5,4)=(-((-(y(7)*params(3)))/(y(4)*y(4))));
g1(5,6)=1;
g1(5,7)=(-(params(3)/y(4)));
g1(6,2)=1;
g1(6,3)=(-((-(y(7)*(1-params(3))))/(y(3)*y(3))));
g1(6,7)=(-((1-params(3))/y(3)));
g1(7,1)=(-1);
g1(7,5)=(-1);
g1(7,7)=1;
g1(8,8)=1-params(6);
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
