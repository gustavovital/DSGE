%
% +dsge/+block/static_4.m : Computes static model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%/
function [residual, y, g1] = static_4(y, x, params)
  % ////////////////////////////////////////////////////////////////////////
  % //                     Block 4 SIMULTANEOUS TIME SEPARABLE            //
  % //                     Simulation type SOLVE FORWARD COMPLETE         //
  % ////////////////////////////////////////////////////////////////////////
  global options_;
 g1 = spalloc(3, 3, 7);
  global T34 T36;
  residual=zeros(3,1);
  % //Temporary variables
  T34 = y(8)*y(6)^params(3);
  T36 = y(2)^(1-params(3));
  % equation 4 variable : L (2) E_SOLVE     
  residual(1) = (y(7)) - (T34*T36);
  % //Temporary variables
  % equation 5 variable : K (6) E_EVALUATE  
  residual(2) = (y(6)) - (y(7)*params(3)/y(4));
  % //Temporary variables
  % equation 6 variable : Y (7) E_SOLVE     
  residual(3) = (y(2)) - (y(7)*(1-params(3))/y(3));
  % Jacobian  
    g1(1, 1) = (-(T34*getPowerDeriv(y(2),1-params(3),1))); % variable=L(0) 2, equation=4
    g1(1, 2) = (-(T36*y(8)*getPowerDeriv(y(6),params(3),1))); % variable=K(0) 6, equation=4
    g1(1, 3) = 1; % variable=Y(0) 7, equation=4
    g1(2, 2) = 1; % variable=K(0) 6, equation=5
    g1(2, 3) = (-(params(3)/y(4))); % variable=Y(0) 7, equation=5
    g1(3, 1) = 1; % variable=L(0) 2, equation=6
    g1(3, 3) = (-((1-params(3))/y(3))); % variable=Y(0) 7, equation=6
end
