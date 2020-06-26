%
% +dsge/+block/static_3.m : Computes static model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%/
function [residual, y, g1] = static_3(y, x, params)
  % ////////////////////////////////////////////////////////////////////////
  % //                     Block 3 PROLOGUE                               //
  % //                     Simulation type SOLVE FORWARD SIMPLE           //
  % ////////////////////////////////////////////////////////////////////////
  global options_;
 g1 = spalloc(1, 1, 1);
  residual=zeros(1,1);
  % //Temporary variables
  % equation 8 variable : A (8) E_SOLVE     
  residual(1) = (y(8)) - (1-params(6)+y(8)*params(6)+x(1));
  % Jacobian  
    g1(1, 1) = 1-params(6); % variable=A(0) 8, equation=8
end
