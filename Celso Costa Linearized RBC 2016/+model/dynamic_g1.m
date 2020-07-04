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
g1 = zeros(8, 13);
g1(1,4)=(-1);
g1(1,7)=T(2)*T(5);
g1(1,8)=T(1)*T(6);
g1(2,10)=(-params(4));
g1(2,7)=(-y(11))/(y(7)*y(7));
g1(2,11)=1/y(7);
g1(3,6)=(-1);
g1(3,9)=(-(1-params(5)));
g1(3,12)=1;
g1(4,2)=(-(T(3)*T(4)));
g1(4,5)=1;
g1(4,8)=(-(y(2)*T(3)*T(7)));
g1(4,9)=(-(T(4)*y(2)*T(8)));
g1(5,3)=(-((-(y(5)*params(3)))/(y(3)*y(3))));
g1(5,5)=(-(params(3)/y(3)));
g1(5,9)=1;
g1(6,4)=(-((-(y(5)*(1-params(3))))/(y(4)*y(4))));
g1(6,5)=(-((1-params(3))/y(4)));
g1(6,8)=1;
g1(7,5)=1;
g1(7,6)=(-1);
g1(7,7)=(-1);
g1(8,1)=(-(params(6)*1/y(1)));
g1(8,2)=1/y(2);
g1(8,13)=(-1);

end
