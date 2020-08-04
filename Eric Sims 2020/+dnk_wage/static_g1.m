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
    T = dnk_wage.static_g1_tt(T, y, x, params);
end
g1 = zeros(24, 24);
g1(1,1)=params(8)*getPowerDeriv(y(1),params(7),1);
g1(1,3)=(-(y(4)*getPowerDeriv(y(3),(-params(6)),1)));
g1(1,4)=(-T(1));
g1(2,5)=(-(y(7)*T(2)));
g1(2,6)=(-(y(5)*y(7)*getPowerDeriv(y(6),(-1),1)));
g1(2,7)=(-(y(5)*T(2)));
g1(3,7)=1;
g1(4,8)=1;
g1(4,9)=(-(params(2)/(params(2)-1)/y(10)));
g1(4,10)=(-((-(params(2)/(params(2)-1)*y(9)))/(y(10)*y(10))));
g1(5,6)=(-(y(9)*y(7)*params(4)*T(9)));
g1(5,7)=(-(y(9)*params(4)*T(3)));
g1(5,9)=1-y(7)*params(4)*T(3);
g1(5,11)=(-y(12));
g1(5,12)=(-y(11));
g1(6,6)=(-(y(10)*y(7)*params(4)*T(10)));
g1(6,7)=(-(y(10)*params(4)*T(4)));
g1(6,10)=1-y(7)*params(4)*T(4);
g1(6,12)=(-1);
g1(7,11)=(-y(14));
g1(7,13)=1;
g1(7,14)=(-y(11));
g1(8,15)=1;
g1(8,16)=(-(params(3)/(params(3)-1)/y(17)));
g1(8,17)=(-((-(params(3)/(params(3)-1)*y(16)))/(y(17)*y(17))));
g1(9,2)=(-(y(4)*T(5)));
g1(9,4)=(-(T(5)*y(2)));
g1(9,6)=(-(y(16)*y(7)*params(5)*T(11)));
g1(9,7)=(-(y(16)*params(5)*T(6)));
g1(9,13)=(-(y(2)*y(4)*T(13)));
g1(9,16)=1-y(7)*params(5)*T(6);
g1(10,2)=(-T(5));
g1(10,6)=(-(y(17)*y(7)*params(5)*T(12)));
g1(10,7)=(-(y(17)*params(5)*T(7)));
g1(10,13)=(-(y(2)*T(13)));
g1(10,17)=1-y(7)*params(5)*T(7);
g1(11,6)=(-(params(4)*T(10)));
g1(11,8)=(-((1-params(4))*getPowerDeriv(y(8),1-params(2),1)));
g1(12,6)=(-(T(8)*params(5)*T(12)));
g1(12,13)=T(14)-params(5)*T(7)*T(14);
g1(12,15)=(-((1-params(5))*getPowerDeriv(y(15),1-params(3),1)));
g1(13,3)=(-1);
g1(13,12)=1;
g1(14,12)=y(18);
g1(14,18)=y(12);
g1(14,19)=(-1);
g1(15,2)=(-y(14));
g1(15,14)=(-y(2));
g1(15,19)=1;
g1(16,1)=1;
g1(16,2)=(-y(20));
g1(16,20)=(-y(2));
g1(17,6)=(-(y(20)*params(5)*T(11)));
g1(17,13)=(-((1-params(5))*(-y(15))/(y(13)*y(13))*T(15)));
g1(17,15)=(-((1-params(5))*T(15)*1/y(13)));
g1(17,20)=1-params(5)*T(6);
g1(18,6)=(-(y(18)*params(4)*T(9)));
g1(18,8)=(-((1-params(4))*getPowerDeriv(y(8),(-params(2)),1)));
g1(18,18)=1-params(4)*T(3);
g1(19,14)=1/y(14)-params(9)*1/y(14);
g1(20,5)=1/y(5)-params(10)*1/y(5);
g1(20,6)=(-((1-params(10))*params(11)*1/y(6)));
g1(21,12)=(-(1/y(12)));
g1(21,21)=1;
g1(22,6)=(-(1/y(6)));
g1(22,22)=1;
g1(23,5)=(-(1/y(5)));
g1(23,24)=1;
g1(24,2)=(-(1/y(2)));
g1(24,23)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
