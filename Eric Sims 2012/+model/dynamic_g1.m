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
g1 = zeros(8, 15);
g1(1,1)=(-(params(4)*1/y(1)));
g1(1,3)=1/y(3);
g1(1,15)=(-params(5));
g1(2,11)=(-(params(1)*T(1)));
g1(2,12)=(-(params(1)*y(11)*T(9)*T(10)));
g1(2,13)=(-(params(1)*y(11)*T(10)*(-y(12))/(y(13)*y(13))));
g1(2,9)=1;
g1(3,7)=(-(params(2)*(1+y(9))));
g1(3,14)=1;
g1(3,9)=(-(params(2)*y(7)));
g1(4,3)=(-((1-params(1))*T(2)));
g1(4,4)=(-(y(3)*(1-params(1))*T(7)*T(8)));
g1(4,5)=y(7)*params(6)/((1-y(5))*(1-y(5)))-y(3)*(1-params(1))*T(8)*(-y(4))/(y(5)*y(5));
g1(4,7)=params(6)/(1-y(5));
g1(5,3)=(-(T(3)*y(5)*exp(y(3))*T(5)));
g1(5,2)=(-(T(4)*T(6)));
g1(5,5)=(-(T(3)*exp(y(3))*T(5)));
g1(5,6)=1;
g1(6,2)=(-(1-params(3)));
g1(6,4)=1;
g1(6,8)=(-1);
g1(7,6)=1;
g1(7,7)=(-1);
g1(7,8)=(-1);
g1(8,5)=(-((1-params(1))*(-y(6))/(y(5)*y(5))));
g1(8,6)=(-((1-params(1))*T(7)));
g1(8,10)=1;

end
