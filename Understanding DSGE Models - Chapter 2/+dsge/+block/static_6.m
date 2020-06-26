%
% +dsge/+block/static_6.m : Computes static model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%/
function [residual, y, g1] = static_6(y, x, params)
  % ////////////////////////////////////////////////////////////////////////
  % //                     Block 6 EPILOGUE                               //
  % //                     Simulation type SOLVE FORWARD SIMPLE           //
  % ////////////////////////////////////////////////////////////////////////
  global options_;
 g1 = spalloc(1, 1, 1);
  residual=zeros(1,1);
  % //Temporary variables
  % equation 7 variable : C (1) E_SOLVE     
  residual(1) = (y(7)) - (y(1)+y(5));
  % Jacobian  
    g1(1, 1) = (-1); % variable=C(0) 1, equation=7
end
