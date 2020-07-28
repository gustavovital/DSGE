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
v2 = zeros(47,3);
v2(1,1)=1;
v2(2,1)=1;
v2(3,1)=1;
v2(4,1)=1;
v2(5,1)=1;
v2(6,1)=1;
v2(7,1)=1;
v2(8,1)=1;
v2(9,1)=1;
v2(10,1)=1;
v2(11,1)=1;
v2(12,1)=1;
v2(13,1)=1;
v2(14,1)=1;
v2(15,1)=1;
v2(16,1)=2;
v2(17,1)=2;
v2(18,1)=2;
v2(19,1)=2;
v2(20,1)=3;
v2(21,1)=3;
v2(22,1)=3;
v2(23,1)=3;
v2(24,1)=4;
v2(25,1)=4;
v2(26,1)=5;
v2(27,1)=5;
v2(28,1)=5;
v2(29,1)=5;
v2(30,1)=5;
v2(31,1)=5;
v2(32,1)=5;
v2(33,1)=5;
v2(34,1)=6;
v2(35,1)=6;
v2(36,1)=6;
v2(37,1)=7;
v2(38,1)=7;
v2(39,1)=7;
v2(40,1)=9;
v2(41,1)=9;
v2(42,1)=10;
v2(43,1)=10;
v2(44,1)=11;
v2(45,1)=11;
v2(46,1)=12;
v2(47,1)=12;
v2(1,2)=131;
v2(2,2)=143;
v2(3,2)=431;
v2(4,2)=141;
v2(5,2)=381;
v2(6,2)=145;
v2(7,2)=481;
v2(8,2)=443;
v2(9,2)=441;
v2(10,2)=393;
v2(11,2)=445;
v2(12,2)=493;
v2(13,2)=395;
v2(14,2)=491;
v2(15,2)=495;
v2(16,2)=131;
v2(17,2)=138;
v2(18,2)=306;
v2(19,2)=313;
v2(20,2)=217;
v2(21,2)=409;
v2(22,2)=417;
v2(23,2)=521;
v2(24,2)=242;
v2(25,2)=410;
v2(26,2)=1;
v2(27,2)=13;
v2(28,2)=301;
v2(29,2)=14;
v2(30,2)=326;
v2(31,2)=313;
v2(32,2)=314;
v2(33,2)=338;
v2(34,2)=1;
v2(35,2)=8;
v2(36,2)=176;
v2(37,2)=188;
v2(38,2)=308;
v2(39,2)=313;
v2(40,2)=27;
v2(41,2)=339;
v2(42,2)=53;
v2(43,2)=365;
v2(44,2)=79;
v2(45,2)=391;
v2(46,2)=105;
v2(47,2)=417;
v2(1,3)=(-(T(1)*(T(9)*(-((-y(18))*(y(6)+y(6))))/(y(6)*y(6)*y(6)*y(6))+T(8)*T(8)*T(15))));
v2(2,3)=(-(T(1)*(T(9)*(-1)/(y(6)*y(6))+T(8)*1/y(6)*T(15))));
v2(3,3)=v2(2,3);
v2(4,3)=(-(T(8)*T(9)*1/y(20)));
v2(5,3)=v2(4,3);
v2(6,3)=(-(T(8)*T(9)*(-y(16))/(y(20)*y(20))));
v2(7,3)=v2(6,3);
v2(8,3)=(-(T(1)*1/y(6)*1/y(6)*T(15)));
v2(9,3)=(-(T(9)*1/y(6)*1/y(20)));
v2(10,3)=v2(9,3);
v2(11,3)=(-(T(9)*1/y(6)*(-y(16))/(y(20)*y(20))));
v2(12,3)=v2(11,3);
v2(13,3)=(-(T(2)*(-1)/(y(20)*y(20))));
v2(14,3)=v2(13,3);
v2(15,3)=(-(T(2)*(-((-y(16))*(y(20)+y(20))))/(y(20)*y(20)*y(20)*y(20))));
v2(16,3)=(-(T(3)*getPowerDeriv(y(6),params(9),2)));
v2(17,3)=(-(T(10)*T(13)));
v2(18,3)=v2(17,3);
v2(19,3)=(-(T(4)*params(10)*getPowerDeriv(y(13),params(11),2)));
v2(20,3)=(-1)/(y(17)*y(17));
v2(21,3)=v2(20,3);
v2(22,3)=(-((-y(9))*(y(17)+y(17))))/(y(17)*y(17)*y(17)*y(17));
v2(23,3)=(-((-((-(1-params(3)))*(y(21)+y(21))))/(y(21)*y(21)*y(21)*y(21))));
v2(24,3)=1;
v2(25,3)=v2(24,3);
v2(26,3)=(-(T(7)*y(14)*getPowerDeriv(y(1),params(1),2)));
v2(27,3)=(-(T(12)*T(14)));
v2(28,3)=v2(27,3);
v2(29,3)=(-(T(7)*T(11)));
v2(30,3)=v2(29,3);
v2(31,3)=(-(T(6)*getPowerDeriv(y(13),1-params(1),2)));
v2(32,3)=(-(T(5)*T(14)));
v2(33,3)=v2(32,3);
v2(34,3)=(-((-((-(y(8)*params(1)))*(y(1)+y(1))))/(y(1)*y(1)*y(1)*y(1))));
v2(35,3)=(-((-params(1))/(y(1)*y(1))));
v2(36,3)=v2(35,3);
v2(37,3)=(-((-(1-params(1)))/(y(13)*y(13))));
v2(38,3)=v2(37,3);
v2(39,3)=(-((-((-(y(8)*(1-params(1))))*(y(13)+y(13))))/(y(13)*y(13)*y(13)*y(13))));
v2(40,3)=(-(params(4)*(-1)/(y(2)*y(2))));
v2(41,3)=(-1)/(y(14)*y(14));
v2(42,3)=(-(params(5)*(-1)/(y(3)*y(3))));
v2(43,3)=(-1)/(y(15)*y(15));
v2(44,3)=(-(params(6)*(-1)/(y(4)*y(4))));
v2(45,3)=(-1)/(y(16)*y(16));
v2(46,3)=(-(params(7)*(-1)/(y(5)*y(5))));
v2(47,3)=(-1)/(y(17)*y(17));
g2 = sparse(v2(:,1),v2(:,2),v2(:,3),12,625);
end
