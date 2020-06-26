function g2 = dynamic_g2(T, y, x, params, steady_state, it_, T_flag)
% function g2 = dynamic_g2(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g2
%

if T_flag
    T = model.dynamic_g2_tt(T, y, x, params, steady_state, it_);
end
v2 = zeros(34,3);
v2(1,1)=1;
v2(2,1)=1;
v2(3,1)=2;
v2(4,1)=2;
v2(5,1)=2;
v2(6,1)=2;
v2(7,1)=2;
v2(8,1)=2;
v2(9,1)=2;
v2(10,1)=2;
v2(11,1)=3;
v2(12,1)=3;
v2(13,1)=4;
v2(14,1)=4;
v2(15,1)=4;
v2(16,1)=4;
v2(17,1)=4;
v2(18,1)=4;
v2(19,1)=4;
v2(20,1)=4;
v2(21,1)=4;
v2(22,1)=4;
v2(23,1)=5;
v2(24,1)=5;
v2(25,1)=5;
v2(26,1)=5;
v2(27,1)=5;
v2(28,1)=5;
v2(29,1)=5;
v2(30,1)=5;
v2(31,1)=5;
v2(32,1)=8;
v2(33,1)=8;
v2(34,1)=8;
v2(1,2)=1;
v2(2,2)=33;
v2(3,2)=162;
v2(4,2)=176;
v2(5,2)=163;
v2(6,2)=191;
v2(7,2)=177;
v2(8,2)=178;
v2(9,2)=192;
v2(10,2)=193;
v2(11,2)=99;
v2(12,2)=127;
v2(13,2)=34;
v2(14,2)=48;
v2(15,2)=35;
v2(16,2)=63;
v2(17,2)=49;
v2(18,2)=50;
v2(19,2)=64;
v2(20,2)=65;
v2(21,2)=67;
v2(22,2)=95;
v2(23,2)=33;
v2(24,2)=32;
v2(25,2)=18;
v2(26,2)=35;
v2(27,2)=63;
v2(28,2)=17;
v2(29,2)=20;
v2(30,2)=62;
v2(31,2)=65;
v2(32,2)=65;
v2(33,2)=66;
v2(34,2)=80;
v2(1,3)=(-(params(4)*(-1)/(y(1)*y(1))));
v2(2,3)=(-1)/(y(3)*y(3));
v2(3,3)=(-(params(1)*T(9)*T(10)));
v2(4,3)=v2(3,3);
v2(5,3)=(-(params(1)*T(10)*(-y(12))/(y(13)*y(13))));
v2(6,3)=v2(5,3);
v2(7,3)=(-(params(1)*y(11)*T(9)*T(9)*T(11)));
v2(8,3)=(-(params(1)*y(11)*(T(10)*(-1)/(y(13)*y(13))+T(9)*(-y(12))/(y(13)*y(13))*T(11))));
v2(9,3)=v2(8,3);
v2(10,3)=(-(params(1)*y(11)*((-y(12))/(y(13)*y(13))*(-y(12))/(y(13)*y(13))*T(11)+T(10)*(-((-y(12))*(y(13)+y(13))))/(y(13)*y(13)*y(13)*y(13)))));
v2(11,3)=(-params(2));
v2(12,3)=v2(11,3);
v2(13,3)=(-((1-params(1))*T(7)*T(8)));
v2(14,3)=v2(13,3);
v2(15,3)=(-((1-params(1))*T(8)*(-y(4))/(y(5)*y(5))));
v2(16,3)=v2(15,3);
v2(17,3)=(-(y(3)*(1-params(1))*T(7)*T(7)*T(12)));
v2(18,3)=(-(y(3)*(1-params(1))*(T(8)*(-1)/(y(5)*y(5))+T(7)*(-y(4))/(y(5)*y(5))*T(12))));
v2(19,3)=v2(18,3);
v2(20,3)=(-(y(7)*params(6)*((-(1-y(5)))-(1-y(5)))))/((1-y(5))*(1-y(5))*(1-y(5))*(1-y(5)))-y(3)*(1-params(1))*((-y(4))/(y(5)*y(5))*(-y(4))/(y(5)*y(5))*T(12)+T(8)*(-((-y(4))*(y(5)+y(5))))/(y(5)*y(5)*y(5)*y(5)));
v2(21,3)=params(6)/((1-y(5))*(1-y(5)));
v2(22,3)=v2(21,3);
v2(23,3)=(-(T(3)*(y(5)*exp(y(3))*T(5)+y(5)*exp(y(3))*y(5)*exp(y(3))*T(13))));
v2(24,3)=(-(y(5)*exp(y(3))*T(5)*T(6)));
v2(25,3)=v2(24,3);
v2(26,3)=(-(T(3)*(exp(y(3))*T(5)+y(5)*exp(y(3))*exp(y(3))*T(13))));
v2(27,3)=v2(26,3);
v2(28,3)=(-(T(4)*getPowerDeriv(y(2),params(1),2)));
v2(29,3)=(-(T(6)*exp(y(3))*T(5)));
v2(30,3)=v2(29,3);
v2(31,3)=(-(T(3)*exp(y(3))*exp(y(3))*T(13)));
v2(32,3)=(-((1-params(1))*(-((-y(6))*(y(5)+y(5))))/(y(5)*y(5)*y(5)*y(5))));
v2(33,3)=(-((1-params(1))*(-1)/(y(5)*y(5))));
v2(34,3)=v2(33,3);
g2 = sparse(v2(:,1),v2(:,2),v2(:,3),8,225);
end
