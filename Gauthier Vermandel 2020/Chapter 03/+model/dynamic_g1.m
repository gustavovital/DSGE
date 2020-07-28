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
    T = model.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(12, 25);
g1(1,6)=(-(T(1)*T(8)*T(9)));
g1(1,18)=(-(T(1)*T(9)*1/y(6)));
g1(1,9)=params(2);
g1(1,16)=(-(T(2)*1/y(20)));
g1(1,20)=(-(T(2)*(-y(16))/(y(20)*y(20))));
g1(2,6)=(-(T(3)*T(10)));
g1(2,11)=1;
g1(2,13)=(-(T(4)*T(13)));
g1(3,9)=1/y(17);
g1(3,19)=(-1);
g1(3,17)=(-y(9))/(y(17)*y(17));
g1(3,21)=(-((-(1-params(3)))/(y(21)*y(21))));
g1(4,1)=1-params(3);
g1(4,7)=(-1);
g1(4,10)=y(17);
g1(4,17)=y(10);
g1(5,1)=(-(T(7)*T(12)));
g1(5,8)=1;
g1(5,13)=(-(T(6)*T(14)));
g1(5,14)=(-(T(5)*T(7)));
g1(6,1)=(-((-(y(8)*params(1)))/(y(1)*y(1))));
g1(6,8)=(-(params(1)/y(1)));
g1(6,12)=1;
g1(7,8)=(-((1-params(1))/y(13)));
g1(7,11)=1;
g1(7,13)=(-((-(y(8)*(1-params(1))))/(y(13)*y(13))));
g1(8,6)=(-1);
g1(8,8)=1;
g1(8,10)=(-1);
g1(8,15)=(-(params(8)*(steady_state(3))));
g1(9,2)=(-(params(4)*1/y(2)));
g1(9,14)=1/y(14);
g1(9,22)=(-1);
g1(10,3)=(-(params(5)*1/y(3)));
g1(10,15)=1/y(15);
g1(10,23)=(-1);
g1(11,4)=(-(params(6)*1/y(4)));
g1(11,16)=1/y(16);
g1(11,24)=(-1);
g1(12,5)=(-(params(7)*1/y(5)));
g1(12,17)=1/y(17);
g1(12,25)=(-1);

end
