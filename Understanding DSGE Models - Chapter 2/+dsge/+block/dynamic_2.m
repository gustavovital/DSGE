%
% +dsge/+block/dynamic_2.m : Computes dynamic model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%/
function [y, g1, g2, g3, varargout] = dynamic_2(y, x, params, steady_state, jacobian_eval, y_kmin, periods)
  % ////////////////////////////////////////////////////////////////////////
  % //                     Block 2 PROLOGUE                               //
  % //                     Simulation type EVALUATE FORWARD               //
  % ////////////////////////////////////////////////////////////////////////
  if(jacobian_eval)
    g1 = spalloc(1, 2, 2);
    g1_x=spalloc(1, 1, 1);
    g1_xd=spalloc(1, 0, 0);
    g1_o=spalloc(1, 0, 0);
  end;
  g2=0;g3=0;
  for it_ = y_kmin+1:(y_kmin+periods)
  % //Temporary variables
    y(it_, 8) = 1-params(6)+params(6)*y(it_-1, 8)+x(it_, 1);
    % Jacobian  
    if jacobian_eval
      g1(1, 1) = (-params(6)); % variable=A(-1) 8, 1, equation=8, 1
      g1(1, 2) = 1; % variable=A(0) 8, 1, equation=8, 1
      g1_x(1, 1) = (-1); % variable=e(0) 1, equation=8
      varargout{1}=g1_x;
      varargout{2}=g1_xd;
      varargout{3}=g1_o;
    end;
  end;
end
