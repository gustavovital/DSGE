%
% +dsge/+block/dynamic_3.m : Computes dynamic model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%/
function [residual, y, g1, g2, g3, varargout] = dynamic_3(y, x, params, steady_state, it_, jacobian_eval)
  % ////////////////////////////////////////////////////////////////////////
  % //                     Block 3 SIMULTANEOUS TIME SEPARABLE            //
  % //                     Simulation type SOLVE BACKWARD COMPLETE        //
  % ////////////////////////////////////////////////////////////////////////
  if(jacobian_eval)
    g1 = spalloc(6, 9, 17);
    g1_x=spalloc(6, 0, 0);
    g1_xd=spalloc(6, 0, 0);
    g1_o=spalloc(6, 1, 1);
  else
    g1 = spalloc(6, 6, 17);
  end;
  g2=0;g3=0;
  global T37 T39 T69 T83;
  residual=zeros(6,1);
  % //Temporary variables
  % equation 3 variable : I (5) E_SOLVE      symb_id=4
  residual(1) = (y(it_+1, 6)) - ((1-params(5))*y(it_, 6)+y(it_, 5));
  % //Temporary variables
  % equation 6 variable : L (2) E_EVALUATE   symb_id=1
  residual(2) = (y(it_, 2)) - (y(it_, 7)*(1-params(3))/y(it_, 3));
  % //Temporary variables
  % equation 7 variable : Y (7) E_EVALUATE   symb_id=6
  residual(3) = (y(it_, 7)) - (y(it_, 1)+y(it_, 5));
  % //Temporary variables
  T37(it_) = y(it_, 8)*y(it_, 6)^params(3);
  T39(it_) = y(it_, 2)^(1-params(3));
  % equation 4 variable : K (6) E_SOLVE      symb_id=5
  residual(4) = (y(it_, 7)) - (T37(it_)*T39(it_));
  % //Temporary variables
  % equation 5 variable : R (4) E_SOLVE      symb_id=3
  residual(5) = (y(it_, 6)) - (y(it_, 7)*params(3)/y(it_, 4));
  % //Temporary variables
  T69(it_) = (-(y(it_, 8)*y(it_, 6)^params(3)*getPowerDeriv(y(it_, 2),1-params(3),1)));
  T83(it_) = (-(y(it_, 2)^(1-params(3))*y(it_, 8)*getPowerDeriv(y(it_, 6),params(3),1)));
  % equation 2 variable : C (1) E_SOLVE      symb_id=0
  residual(6) = (y(it_+1, 1)/y(it_, 1)) - (params(4)*(1-params(5)+y(it_+1, 4)));
  % Jacobian  
  if jacobian_eval
      g1(1, 1) = (-1); % variable=I(0) 5, 1, equation=3, 1
      g1(3, 1) = (-1); % variable=I(0) 5, 1, equation=7, 3
      g1(2, 2) = 1; % variable=L(0) 2, 2, equation=6, 2
      g1(4, 2) = T69(it_); % variable=L(0) 2, 2, equation=4, 4
      g1(2, 3) = (-((1-params(3))/y(it_, 3))); % variable=Y(0) 7, 3, equation=6, 2
      g1(3, 3) = 1; % variable=Y(0) 7, 3, equation=7, 3
      g1(4, 3) = 1; % variable=Y(0) 7, 3, equation=4, 4
      g1(5, 3) = (-(params(3)/y(it_, 4))); % variable=Y(0) 7, 3, equation=5, 5
      g1(1, 4) = (-(1-params(5))); % variable=K(0) 6, 4, equation=3, 1
      g1(4, 4) = T83(it_); % variable=K(0) 6, 4, equation=4, 4
      g1(5, 4) = 1; % variable=K(0) 6, 4, equation=5, 5
      g1(5, 5) = (-((-(y(it_, 7)*params(3)))/(y(it_, 4)*y(it_, 4)))); % variable=R(0) 4, 5, equation=5, 5
      g1(3, 6) = (-1); % variable=C(0) 1, 6, equation=7, 3
      g1(6, 6) = (-y(it_+1, 1))/(y(it_, 1)*y(it_, 1)); % variable=C(0) 1, 6, equation=2, 6
      g1(1, 7) = 1; % variable=K(1) 6, 4, equation=3, 1
      g1(6, 8) = (-params(4)); % variable=R(1) 4, 5, equation=2, 6
      g1(6, 9) = 1/y(it_, 1); % variable=C(1) 1, 6, equation=2, 6
      g1_o(2, 1) = (-((-(y(it_, 7)*(1-params(3))))/(y(it_, 3)*y(it_, 3)))); % variable=W(0) 3, equation=6
      varargout{1}=g1_x;
      varargout{2}=g1_xd;
      varargout{3}=g1_o;
  else
    g1(1, 1) = (-1); % variable=I(0) 5, equation=3
    g1(1, 4) = (-(1-params(5))); % variable=K(0) 6, equation=3
    g1(2, 2) = 1; % variable=L(0) 2, equation=6
    g1(2, 3) = (-((1-params(3))/y(it_, 3))); % variable=Y(0) 7, equation=6
    g1(3, 1) = (-1); % variable=I(0) 5, equation=7
    g1(3, 3) = 1; % variable=Y(0) 7, equation=7
    g1(3, 6) = (-1); % variable=C(0) 1, equation=7
    g1(4, 2) = T69(it_); % variable=L(0) 2, equation=4
    g1(4, 3) = 1; % variable=Y(0) 7, equation=4
    g1(4, 4) = T83(it_); % variable=K(0) 6, equation=4
    g1(5, 3) = (-(params(3)/y(it_, 4))); % variable=Y(0) 7, equation=5
    g1(5, 4) = 1; % variable=K(0) 6, equation=5
    g1(5, 5) = (-((-(y(it_, 7)*params(3)))/(y(it_, 4)*y(it_, 4)))); % variable=R(0) 4, equation=5
    g1(6, 6) = (-y(it_+1, 1))/(y(it_, 1)*y(it_, 1)); % variable=C(0) 1, equation=2
  end;
end
