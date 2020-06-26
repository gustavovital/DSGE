%
% +dsge/+block/static_2.m : Computes static model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%/
function [residual, y, g1] = static_2(y, x, params)
  % ////////////////////////////////////////////////////////////////////////
  % //                     Block 2 PROLOGUE                               //
  % //                     Simulation type SOLVE FORWARD SIMPLE           //
  % ////////////////////////////////////////////////////////////////////////
  global options_;
 g1 = spalloc(1, 1, 1);
  residual=zeros(1,1);
  % //Temporary variables
  % equation 2 variable : R (4) E_SOLVE     
  residual(1) = (1) - (params(4)*(1-params(5)+y(4)));
  % Jacobian  
    g1(1, 1) = (-params(4)); % variable=R(0) 4, equation=2
end
