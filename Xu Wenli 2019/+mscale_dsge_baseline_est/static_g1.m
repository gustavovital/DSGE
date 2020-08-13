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
    T = mscale_dsge_baseline_est.static_g1_tt(T, y, x, params);
end
g1 = zeros(36, 36);
g1(1,1)=1+y(27);
g1(1,3)=(-((-(y(10)*(1-params(2))))/((y(3)-y(3)*params(2))*(y(3)-y(3)*params(2)))-(-(y(10)*params(2)*params(1)*(1-params(2))))/((y(3)-y(3)*params(2))*(y(3)-y(3)*params(2)))));
g1(1,10)=(-(1/(y(3)-y(3)*params(2))-params(2)*params(1)/(y(3)-y(3)*params(2))));
g1(1,27)=y(1);
g1(2,1)=(1-y(29))*y(6);
g1(2,2)=(-(params(5)+params(6)*(y(7)-1)));
g1(2,6)=y(1)*(1-y(29));
g1(2,7)=(-(y(2)*params(6)));
g1(2,29)=y(6)*(-y(1));
g1(3,1)=1-T(1)*params(1)*(1+y(4));
g1(3,4)=(-(y(1)*params(1)*T(1)));
g1(3,5)=(-(y(1)*params(1)*(1+y(4))*getPowerDeriv(1+y(5),(-1),1)));
g1(4,1)=1+y(27);
g1(4,2)=(-y(8));
g1(4,8)=(-y(2));
g1(4,27)=y(1);
g1(5,1)=(-(params(1)*y(7)*(1-y(29))*y(6)));
g1(5,2)=1-params(1)*T(2);
g1(5,6)=(-(params(1)*y(1)*(1-y(29))*y(7)));
g1(5,7)=(-(params(1)*(y(1)*(1-y(29))*y(6)+y(2)*((-params(5))-params(6)/2*2*(y(7)-1)))));
g1(5,29)=(-(params(1)*y(7)*y(6)*(-y(1))));
g1(6,5)=(-(y(14)*(T(7)*params(1)*params(9)*getPowerDeriv(1+y(5),(1+params(11))*params(10)*(-params(12)),1)+T(6)*getPowerDeriv(1+y(5),params(10)*(1+params(11)),1))));
g1(6,10)=(-(T(5)*y(11)*T(4)));
g1(6,11)=(-(T(5)*y(10)*T(4)));
g1(6,12)=(-(T(5)*y(10)*y(11)*1/y(13)*T(27)));
g1(6,13)=(-(T(5)*y(10)*y(11)*T(27)*(-y(12))/(y(13)*y(13))));
g1(6,14)=1-T(6)*T(7);
g1(6,16)=(-(y(10)*y(11)*T(4)*T(30)));
g1(7,1)=(-(y(16)*(1-y(28))*T(8)));
g1(7,5)=(-(y(15)*(T(10)*params(1)*params(9)*T(21)+params(1)*params(9)*T(9)*T(22))));
g1(7,12)=(-(y(16)*y(1)*(1-y(28))*1/y(13)*T(28)));
g1(7,13)=(-(y(16)*y(1)*(1-y(28))*T(28)*(-y(12))/(y(13)*y(13))));
g1(7,15)=1-params(1)*params(9)*T(9)*T(10);
g1(7,16)=(-(y(1)*(1-y(28))*T(8)));
g1(7,28)=(-(y(16)*T(8)*(-y(1))));
g1(8,13)=1;
g1(8,14)=(-(params(10)/(params(10)-1)/y(15)));
g1(8,15)=(-((-(y(14)*params(10)/(params(10)-1)))/(y(15)*y(15))));
g1(9,6)=(-y(12))/(y(6)*y(6));
g1(9,12)=1/y(6);
g1(9,16)=(-((1-params(3))/params(3)*(-y(17))/(y(16)*y(16))));
g1(9,17)=(-((1-params(3))/params(3)*1/y(16)));
g1(10,12)=(-(1/T(12)));
g1(10,16)=(-((-(y(12)*(1-params(3))*y(25)*(-y(17))/(y(16)*y(16))*T(31)))/(T(12)*T(12))));
g1(10,17)=(-((-(y(12)*(1-params(3))*y(25)*T(31)*1/y(16)))/(T(12)*T(12))));
g1(10,19)=1;
g1(10,25)=(-((-(y(12)*(1-params(3))*T(11)))/(T(12)*T(12))));
g1(11,1)=(-(y(19)*y(23)));
g1(11,5)=(-(y(21)*(T(14)*params(1)*params(15)*T(23)+params(1)*params(15)*T(13)*T(24))));
g1(11,19)=(-(y(1)*y(23)));
g1(11,21)=1-params(1)*params(15)*T(13)*T(14);
g1(11,23)=(-(y(1)*y(19)));
g1(12,1)=(-y(23));
g1(12,5)=(-(y(22)*(T(16)*params(1)*params(15)*T(25)+params(1)*params(15)*T(15)*getPowerDeriv(1+y(5),params(13)-1,1))));
g1(12,22)=1-params(1)*params(15)*T(15)*T(16);
g1(12,23)=(-y(1));
g1(13,5)=(-(y(21)*params(13)/(params(13)-1)/y(22)));
g1(13,20)=1;
g1(13,21)=(-((1+y(5))*params(13)/(params(13)-1)/y(22)));
g1(13,22)=(-((-(y(21)*(1+y(5))*params(13)/(params(13)-1)))/(y(22)*y(22))));
g1(14,3)=(-1);
g1(14,9)=(-1);
g1(14,23)=1;
g1(14,24)=(-1);
g1(15,7)=(-(y(18)*((-params(5))-params(6)/2*2*(y(7)-1))));
g1(15,8)=(-y(9));
g1(15,9)=(-y(8));
g1(15,18)=1-T(2);
g1(16,16)=(-(T(18)*getPowerDeriv(y(16),1-params(3),1)));
g1(16,17)=(-(T(19)*y(25)*getPowerDeriv(y(17),params(3),1)));
g1(16,23)=y(26);
g1(16,25)=(-(T(17)*T(19)));
g1(16,26)=y(23);
g1(17,7)=(-y(18));
g1(17,17)=1;
g1(17,18)=(-y(7));
g1(18,5)=(-((1-params(15))*(-(1+y(20)))/((1+y(5))*(1+y(5)))*T(26)+y(26)*params(15)*(T(14)*T(23)+T(13)*T(24))));
g1(18,20)=(-((1-params(15))*T(26)*1/(1+y(5))));
g1(18,26)=1-params(15)*T(13)*T(14);
g1(19,5)=getPowerDeriv(1+y(5),1-params(13),1)-params(15)*T(25);
g1(19,20)=(-((1-params(15))*getPowerDeriv(1+y(20),1-params(13),1)));
g1(20,5)=(-(T(20)*(params(9)*T(9)*T(22)+T(10)*params(9)*T(21))));
g1(20,12)=T(29)-T(10)*params(9)*T(9)*T(29);
g1(20,13)=(-((1-params(9))*getPowerDeriv(y(13),1-params(10),1)));
g1(21,5)=(-((1-params(16))*params(17)));
g1(22,23)=(-((1-params(21))*params(31)/(y(23)*params(31))));
g1(22,24)=1/y(24)-params(21)*1/y(24);
g1(23,25)=1/y(25)-params(19)*1/y(25);
g1(24,8)=1/y(8)-params(20)*1/y(8);
g1(25,10)=1/y(10)-params(22)*1/y(10);
g1(26,11)=1/y(11)-params(23)*1/y(11);
g1(27,27)=1-params(25);
g1(28,12)=(-((1-params(27))*params(32)*(y(16)*(y(12))*(y(16))-y(12)*y(16)*(y(16)))/((y(12))*(y(16))*(y(12))*(y(16)))/(y(12)*y(16)/((y(12))*(y(16))))));
g1(28,16)=(-((1-params(27))*params(32)*(y(12)*(y(12))*(y(16))-y(12)*y(16)*(y(12)))/((y(12))*(y(16))*(y(12))*(y(16)))/(y(12)*y(16)/((y(12))*(y(16))))));
g1(28,28)=1-params(27);
g1(29,6)=(-((1-params(29))*params(33)*(y(17)*(y(6))*(y(17))-y(6)*y(17)*(y(17)))/((y(6))*(y(17))*(y(6))*(y(17)))/(y(6)*y(17)/((y(6))*(y(17))))));
g1(29,17)=(-((1-params(29))*params(33)*(y(6)*(y(6))*(y(17))-y(6)*y(17)*(y(6)))/((y(6))*(y(17))*(y(6))*(y(17)))/(y(6)*y(17)/((y(6))*(y(17))))));
g1(29,29)=1-params(29);
g1(30,23)=(-1);
g1(30,31)=1;
g1(31,3)=(-1);
g1(31,32)=1;
g1(32,9)=(-1);
g1(32,33)=1;
g1(33,5)=(-1);
g1(33,36)=1;
g1(34,6)=(-1);
g1(34,35)=1;
g1(35,16)=(-1);
g1(35,34)=1;
g1(36,3)=(-(y(10)*(1-params(2))/(y(3)-y(3)*params(2))));
g1(36,10)=(-(log(y(3)-y(3)*params(2))-y(11)*T(5)/(1+params(11))));
g1(36,11)=(-(y(10)*(-(T(5)/(1+params(11))))));
g1(36,16)=(-(y(10)*(-(y(11)*T(30)/(1+params(11))))));
g1(36,30)=1-params(1);
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
