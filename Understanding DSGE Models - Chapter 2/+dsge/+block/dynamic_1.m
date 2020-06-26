%
% +dsge/+block/dynamic_1.m : Computes dynamic model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%/
function [residual, y, g1, g2, g3, varargout] = dynamic_1(y, x, params, steady_state, it_, jacobian_eval)
  % ////////////////////////////////////////////////////////////////////////
  % //                     Block 1 PROLOGUE                               //
  % //                     Simulation type SOLVE FORWARD SIMPLE           //
  % ////////////////////////////////////////////////////////////////////////
  if(jacobian_eval)
    g1 = spalloc(1, 1, 1);
    g1_x=spalloc(1, 0, 0);
    g1_xd=spalloc(1, 0, 0);
    g1_o=spalloc(1, 0, 0);
  else
    g1 = spalloc(1, 1, 1);
  end;
  g2=0;g3=0;
  residual=zeros(1,1);
  % //Temporary variables
  % equation 1 variable : W (3) E_SOLVE      symb_id=2
  residual(1) = (y(it_, 1)^params(1)*y(it_, 2)^params(2)) - (y(it_, 3));
  % Jacobian  
  if jacobian_eval
      g1(1, 1) = (-1); % variable=W(0) 3, 1, equation=1, 1
      varargout{1}=g1_x;
      varargout{2}=g1_xd;
      varargout{3}=g1_o;
  else
    g1(1, 1) = (-1); % variable=W(0) 3, equation=1
  end;
end
