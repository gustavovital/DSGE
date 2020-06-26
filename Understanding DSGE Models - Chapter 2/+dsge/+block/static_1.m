%
% +dsge/+block/static_1.m : Computes static model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%/
function [residual, y, g1] = static_1(y, x, params)
  % ////////////////////////////////////////////////////////////////////////
  % //                     Block 1 PROLOGUE                               //
  % //                     Simulation type SOLVE FORWARD SIMPLE           //
  % ////////////////////////////////////////////////////////////////////////
  global options_;
 g1 = spalloc(1, 1, 1);
  residual=zeros(1,1);
  % //Temporary variables
  % equation 1 variable : W (3) E_SOLVE     
  residual(1) = (y(1)^params(1)*y(2)^params(2)) - (y(3));
  % Jacobian  
    g1(1, 1) = (-1); % variable=W(0) 3, equation=1
end
