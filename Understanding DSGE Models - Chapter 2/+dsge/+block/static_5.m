%
% +dsge/+block/static_5.m : Computes static model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%/
function [residual, y, g1] = static_5(y, x, params)
  % ////////////////////////////////////////////////////////////////////////
  % //                     Block 5 EPILOGUE                               //
  % //                     Simulation type SOLVE FORWARD SIMPLE           //
  % ////////////////////////////////////////////////////////////////////////
  global options_;
 g1 = spalloc(1, 1, 1);
  residual=zeros(1,1);
  % //Temporary variables
  % equation 3 variable : I (5) E_SOLVE     
  residual(1) = (y(6)) - ((1-params(5))*y(6)+y(5));
  % Jacobian  
    g1(1, 1) = (-1); % variable=I(0) 5, equation=3
end
