function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
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
%   g1
%

if T_flag
    T = dnk_wage.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(24, 38);
g1(1,7)=params(8)*getPowerDeriv(y(7),params(7),1);
g1(1,9)=(-(y(10)*getPowerDeriv(y(9),(-params(6)),1)));
g1(1,10)=(-T(1));
g1(2,11)=(-(y(32)*T(2)));
g1(2,31)=(-(y(11)*y(32)*getPowerDeriv(y(31),(-1),1)));
g1(2,32)=(-(y(11)*T(2)));
g1(3,1)=(-(params(1)*(-y(9))/(y(1)*y(1))*T(13)));
g1(3,9)=(-(params(1)*T(13)*1/y(1)));
g1(3,13)=1;
g1(4,14)=1;
g1(4,15)=(-(params(2)/(params(2)-1)/y(16)));
g1(4,16)=(-((-(params(2)/(params(2)-1)*y(15)))/(y(16)*y(16))));
g1(5,31)=(-(y(33)*y(32)*params(4)*getPowerDeriv(y(31),params(2),1)));
g1(5,32)=(-(y(33)*params(4)*T(3)));
g1(5,15)=1;
g1(5,33)=(-(y(32)*params(4)*T(3)));
g1(5,17)=(-y(18));
g1(5,18)=(-y(17));
g1(6,31)=(-(y(34)*y(32)*params(4)*getPowerDeriv(y(31),params(2)-1,1)));
g1(6,32)=(-(y(34)*params(4)*T(4)));
g1(6,16)=1;
g1(6,34)=(-(y(32)*params(4)*T(4)));
g1(6,18)=(-1);
g1(7,17)=(-y(20));
g1(7,19)=1;
g1(7,20)=(-y(17));
g1(8,21)=1;
g1(8,22)=(-(params(3)/(params(3)-1)/y(23)));
g1(8,23)=(-((-(params(3)/(params(3)-1)*y(22)))/(y(23)*y(23))));
g1(9,8)=(-(y(10)*T(5)));
g1(9,10)=(-(T(5)*y(8)));
g1(9,31)=(-(y(35)*y(32)*params(5)*getPowerDeriv(y(31),params(3),1)));
g1(9,32)=(-(y(35)*params(5)*T(6)));
g1(9,19)=(-(y(8)*y(10)*T(15)));
g1(9,22)=1;
g1(9,35)=(-(y(32)*params(5)*T(6)));
g1(10,8)=(-T(5));
g1(10,31)=(-(y(36)*y(32)*params(5)*getPowerDeriv(y(31),params(3)-1,1)));
g1(10,32)=(-(y(36)*params(5)*T(7)));
g1(10,19)=(-(y(8)*T(15)));
g1(10,23)=1;
g1(10,36)=(-(y(32)*params(5)*T(7)));
g1(11,12)=(-(params(4)*getPowerDeriv(y(12),params(2)-1,1)));
g1(11,14)=(-((1-params(4))*getPowerDeriv(y(14),1-params(2),1)));
g1(12,12)=(-(T(9)*params(5)*getPowerDeriv(y(12),params(3)-1,1)));
g1(12,3)=(-(T(8)*getPowerDeriv(y(3),1-params(3),1)));
g1(12,19)=getPowerDeriv(y(19),1-params(3),1);
g1(12,21)=(-((1-params(5))*getPowerDeriv(y(21),1-params(3),1)));
g1(13,9)=(-1);
g1(13,18)=1;
g1(14,18)=y(24);
g1(14,24)=y(18);
g1(14,25)=(-1);
g1(15,8)=(-y(20));
g1(15,20)=(-y(8));
g1(15,25)=1;
g1(16,7)=1;
g1(16,8)=(-y(26));
g1(16,26)=(-y(8));
g1(17,12)=(-(y(6)*T(11)*params(5)*getPowerDeriv(y(12),params(3),1)));
g1(17,3)=(-(y(6)*T(10)*(-y(19))/(y(3)*y(3))*T(14)));
g1(17,19)=(-((1-params(5))*(-y(21))/(y(19)*y(19))*T(16)+y(6)*T(10)*T(14)*1/y(3)));
g1(17,21)=(-((1-params(5))*T(16)*1/y(19)));
g1(17,6)=(-(T(10)*T(11)));
g1(17,26)=1;
g1(18,12)=(-(y(5)*params(4)*getPowerDeriv(y(12),params(2),1)));
g1(18,14)=(-((1-params(4))*getPowerDeriv(y(14),(-params(2)),1)));
g1(18,5)=(-T(12));
g1(18,24)=1;
g1(19,4)=(-(params(9)*1/y(4)));
g1(19,20)=1/y(20);
g1(19,37)=(-params(12));
g1(20,2)=(-(params(10)*1/y(2)));
g1(20,11)=1/y(11);
g1(20,12)=(-((1-params(10))*params(11)*1/y(12)));
g1(20,38)=(-params(13));
g1(21,18)=(-(1/y(18)));
g1(21,27)=1;
g1(22,12)=(-(1/y(12)));
g1(22,28)=1;
g1(23,11)=(-(1/y(11)));
g1(23,30)=1;
g1(24,8)=(-(1/y(8)));
g1(24,29)=1;

end
