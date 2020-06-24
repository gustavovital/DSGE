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
    T = dsge.dynamic_g2_tt(T, y, x, params, steady_state, it_);
end
v2 = zeros(21,3);
v2(1,1)=1;
v2(2,1)=1;
v2(3,1)=1;
v2(4,1)=1;
v2(5,1)=2;
v2(6,1)=2;
v2(7,1)=2;
v2(8,1)=4;
v2(9,1)=4;
v2(10,1)=4;
v2(11,1)=4;
v2(12,1)=4;
v2(13,1)=4;
v2(14,1)=4;
v2(15,1)=4;
v2(16,1)=5;
v2(17,1)=5;
v2(18,1)=5;
v2(19,1)=6;
v2(20,1)=6;
v2(21,1)=6;
v2(1,2)=15;
v2(2,2)=16;
v2(3,2)=28;
v2(4,2)=29;
v2(5,2)=15;
v2(6,2)=23;
v2(7,2)=119;
v2(8,2)=29;
v2(9,2)=33;
v2(10,2)=81;
v2(11,2)=35;
v2(12,2)=107;
v2(13,2)=85;
v2(14,2)=87;
v2(15,2)=111;
v2(16,2)=57;
v2(17,2)=60;
v2(18,2)=96;
v2(19,2)=43;
v2(20,2)=47;
v2(21,2)=95;
v2(1,3)=T(2)*getPowerDeriv(y(2),params(1),2);
v2(2,3)=T(6)*T(7);
v2(3,3)=v2(2,3);
v2(4,3)=T(1)*getPowerDeriv(y(3),params(2),2);
v2(5,3)=(-((-y(10))*(y(2)+y(2))))/(y(2)*y(2)*y(2)*y(2));
v2(6,3)=(-1)/(y(2)*y(2));
v2(7,3)=v2(6,3);
v2(8,3)=(-(T(4)*getPowerDeriv(y(3),1-params(3),2)));
v2(9,3)=(-(T(8)*T(10)));
v2(10,3)=v2(9,3);
v2(11,3)=(-(T(3)*T(8)));
v2(12,3)=v2(11,3);
v2(13,3)=(-(T(5)*y(9)*getPowerDeriv(y(7),params(3),2)));
v2(14,3)=(-(T(5)*T(9)));
v2(15,3)=v2(14,3);
v2(16,3)=(-((-((-(y(8)*params(3)))*(y(5)+y(5))))/(y(5)*y(5)*y(5)*y(5))));
v2(17,3)=(-((-params(3))/(y(5)*y(5))));
v2(18,3)=v2(17,3);
v2(19,3)=(-((-((-(y(8)*(1-params(3))))*(y(4)+y(4))))/(y(4)*y(4)*y(4)*y(4))));
v2(20,3)=(-((-(1-params(3)))/(y(4)*y(4))));
v2(21,3)=v2(20,3);
g2 = sparse(v2(:,1),v2(:,2),v2(:,3),8,169);
end
