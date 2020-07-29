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
    T = model2.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(12, 26);
g1(1,1)=(-(T(1)*T(9)*T(10)));
g1(1,7)=(-(T(1)*T(10)*T(11)));
g1(1,19)=(-(T(1)*T(13)));
g1(1,10)=params(2);
g1(1,17)=(-(T(3)*T(18)));
g1(1,21)=(-(T(3)*T(19)));
g1(2,7)=(-(T(4)*T(12)));
g1(2,12)=1;
g1(2,14)=(-(T(5)*T(16)));
g1(3,10)=1/y(18);
g1(3,20)=(-1);
g1(3,18)=(-y(10))/(y(18)*y(18));
g1(3,22)=(-((-(1-params(3)))/(y(22)*y(22))));
g1(4,2)=1-params(3);
g1(4,8)=(-1);
g1(4,11)=y(18);
g1(4,18)=y(11);
g1(5,2)=(-(T(8)*T(15)));
g1(5,9)=1;
g1(5,14)=(-(T(7)*T(17)));
g1(5,15)=(-(T(6)*T(8)));
g1(6,2)=(-((-(y(9)*params(1)))/(y(2)*y(2))));
g1(6,9)=(-(params(1)/y(2)));
g1(6,13)=1;
g1(7,9)=(-((1-params(1))/y(14)));
g1(7,12)=1;
g1(7,14)=(-((-(y(9)*(1-params(1))))/(y(14)*y(14))));
g1(8,7)=(-1);
g1(8,9)=1;
g1(8,11)=(-1);
g1(8,16)=(-(params(8)*(steady_state(3))));
g1(9,3)=(-(params(4)*1/y(3)));
g1(9,15)=1/y(15);
g1(9,23)=(-1);
g1(10,4)=(-(params(5)*1/y(4)));
g1(10,16)=1/y(16);
g1(10,24)=(-1);
g1(11,5)=(-(params(6)*1/y(5)));
g1(11,17)=1/y(17);
g1(11,25)=(-1);
g1(12,6)=(-(params(7)*1/y(6)));
g1(12,18)=1/y(18);
g1(12,26)=(-1);

end
