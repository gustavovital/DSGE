function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
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
%   residual
%

if T_flag
    T = mscale_dsge_baseline_osr.static_resid_tt(T, y, x, params);
end
residual = zeros(29, 1);
lhs = (1+y(27))*y(1);
rhs = y(10)/(y(3)-y(3)*params(2))-y(10)*params(2)*params(1)/(y(3)-y(3)*params(2));
residual(1) = lhs - rhs;
lhs = y(1)*(1-y(29))*y(6);
rhs = y(2)*(params(5)+params(6)*(y(7)-1));
residual(2) = lhs - rhs;
lhs = y(1);
rhs = y(1)*params(1)*(1+y(4))*T(1);
residual(3) = lhs - rhs;
lhs = (1+y(27))*y(1);
rhs = y(2)*y(8);
residual(4) = lhs - rhs;
lhs = y(2);
rhs = params(1)*(y(1)*(1-y(29))*y(6)*y(7)+y(2)*T(2));
residual(5) = lhs - rhs;
lhs = y(14);
rhs = y(10)*y(11)*T(4)*T(5)+y(14)*T(6)*T(7);
residual(6) = lhs - rhs;
lhs = y(15);
rhs = y(16)*y(1)*(1-y(28))*T(8)+y(15)*params(1)*params(9)*T(9)*T(10);
residual(7) = lhs - rhs;
lhs = y(13);
rhs = y(14)*params(10)/(params(10)-1)/y(15);
residual(8) = lhs - rhs;
lhs = y(12)/y(6);
rhs = (1-params(3))/params(3)*y(17)/y(16);
residual(9) = lhs - rhs;
lhs = y(19);
rhs = y(12)/T(12);
residual(10) = lhs - rhs;
lhs = y(21);
rhs = y(1)*y(19)*y(23)+y(21)*params(1)*params(15)*T(13)*T(14);
residual(11) = lhs - rhs;
lhs = y(22);
rhs = y(1)*y(23)+y(22)*params(1)*params(15)*T(15)*T(16);
residual(12) = lhs - rhs;
lhs = 1+y(20);
rhs = y(21)*(1+y(5))*params(13)/(params(13)-1)/y(22);
residual(13) = lhs - rhs;
lhs = y(23);
rhs = y(3)+y(9)+y(24);
residual(14) = lhs - rhs;
lhs = y(18);
rhs = y(8)*y(9)+T(2)*y(18);
residual(15) = lhs - rhs;
lhs = y(23)*y(26);
rhs = T(18)*T(19);
residual(16) = lhs - rhs;
lhs = y(17);
rhs = y(7)*y(18);
residual(17) = lhs - rhs;
lhs = y(26);
rhs = (1-params(15))*((1+y(20))/(1+y(5)))^(-params(13))+y(26)*params(15)*T(13)*T(14);
residual(18) = lhs - rhs;
lhs = (1+y(5))^(1-params(13));
rhs = (1-params(15))*(1+y(20))^(1-params(13))+params(15)*T(15);
residual(19) = lhs - rhs;
lhs = T(20);
rhs = (1-params(9))*y(13)^(1-params(10))+T(20)*T(10)*params(9)*T(9);
residual(20) = lhs - rhs;
lhs = y(4);
rhs = (1-params(16))*(y(4))+y(4)*params(16)+(1-params(16))*params(17)*(y(5)-params(7))+x(2);
residual(21) = lhs - rhs;
lhs = log(y(24));
rhs = (1-params(21))*log(y(23)*params(31))+log(y(24))*params(21)+x(1);
residual(22) = lhs - rhs;
lhs = log(y(25));
rhs = log(y(25))*params(19)+x(3);
residual(23) = lhs - rhs;
lhs = log(y(8));
rhs = log(y(8))*params(20)+x(4);
residual(24) = lhs - rhs;
lhs = log(y(10));
rhs = log(y(10))*params(22)+x(5);
residual(25) = lhs - rhs;
lhs = log(y(11));
rhs = (1-params(23))*log(params(24))+log(y(11))*params(23)+x(6);
residual(26) = lhs - rhs;
lhs = y(27);
rhs = (1-params(25))*params(26)+y(27)*params(25)+x(7);
residual(27) = lhs - rhs;
lhs = y(28);
rhs = (1-params(27))*(params(28)+params(32)*log(y(12)*y(16)/((y(12))*(y(16)))))+y(28)*params(27)+x(8);
residual(28) = lhs - rhs;
lhs = y(29);
rhs = (1-params(29))*(params(30)+params(33)*log(y(6)*y(17)/((y(6))*(y(17)))))+y(29)*params(29)+x(9);
residual(29) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
