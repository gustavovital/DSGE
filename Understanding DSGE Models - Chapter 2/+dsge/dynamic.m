%
% +dsge/dynamic.m : Computes dynamic model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%/
function [varargout] = dynamic(options_, M_, oo_, varargin)
  g2=[];g3=[];
  global T37 T39 T69 T83;
  T_init=zeros(1,options_.periods+M_.maximum_lag+M_.maximum_lead);
  T37=T_init;
  T39=T_init;
  T69=T_init;
  T83=T_init;
  y_kmin=M_.maximum_lag;
  y_kmax=M_.maximum_lead;
  y_size=M_.endo_nbr;
  if(length(varargin)>0)
    %it is a simple evaluation of the dynamic model for time _it
    y=varargin{1};
    x=varargin{2};
    params=varargin{3};
    steady_state=varargin{4};
    it_=varargin{5};
    dr=varargin{6};
    Per_u_=0;
    Per_y_=it_*y_size;
    ys=y(it_,:);
    y_index_eq=[ 1];
    y_index=[ 3];
    [r, y, dr(1).g1, dr(1).g2, dr(1).g3, dr(1).g1_x, dr(1).g1_xd, dr(1).g1_o]=dsge.block.dynamic_1(y, x, params, steady_state, it_, 1);
    residual(y_index_eq)=r;
    y_index_eq=[ 8];
    y_index=[ 8];
    [y, dr(2).g1, dr(2).g2, dr(2).g3, dr(2).g1_x, dr(2).g1_xd, dr(2).g1_o]=dsge.block.dynamic_2(y, x, params, steady_state, 1, it_-1, 1);
    residual(y_index_eq)=ys(y_index)-y(it_, y_index);
    y_index_eq=[ 3 6 7 4 5 2];
    y_index=[ 5 2 7 6 4 1];
    [r, y, dr(3).g1, dr(3).g2, dr(3).g3, dr(3).g1_x, dr(3).g1_xd, dr(3).g1_o]=dsge.block.dynamic_3(y, x, params, steady_state, it_, 1);
    residual(y_index_eq)=r;
    varargout{1}=residual;
    varargout{2}=dr;
    return;
  end;
  %it is the deterministic simulation of the block decomposed dynamic model
  if(options_.stack_solve_algo==0)
    mthd='Sparse LU';
  elseif(options_.stack_solve_algo==1)
    mthd='Relaxation';
  elseif(options_.stack_solve_algo==2)
    mthd='GMRES';
  elseif(options_.stack_solve_algo==3)
    mthd='BICGSTAB';
  elseif(options_.stack_solve_algo==4)
    mthd='OPTIMPATH';
  else
    mthd='UNKNOWN';
  end;
  if options_.verbosity
    printline(41)
    disp(sprintf('MODEL SIMULATION (method=%s):',mthd))
    skipline()
  end
  periods=options_.periods;
  maxit_=options_.simul.maxit;
  solve_tolf=options_.solve_tolf;
  y=oo_.endo_simul';
  x=oo_.exo_simul;
  params=M_.params;
  steady_state=oo_.steady_state;
  oo_.deterministic_simulation.status = 0;
  g1=0;
  r=0;
  y_index = [ 3];
  if(isfield(oo_.deterministic_simulation,'block'))
    blck_num = length(oo_.deterministic_simulation.block)+1;
  else
    blck_num = 1;
  end;
  y = solve_one_boundary('dsge.block.dynamic_1', y, x, params, steady_state, y_index, 1, options_.periods, 1, blck_num, y_kmin, options_.simul.maxit, options_.solve_tolf, options_.slowc, 1e-15, options_.stack_solve_algo, 1, 1, 0);
  tmp = y(:,M_.block_structure.block(1).variable);
  if any(isnan(tmp) | isinf(tmp))
    disp(['Inf or Nan value during the resolution of block 0']);
    oo_.deterministic_simulation.status = 0;
    oo_.deterministic_simulation.error = 100;
    varargout{1} = oo_;
    return;
  end;
  oo_.deterministic_simulation.status = 1;
  oo_.deterministic_simulation.error = 0;
  oo_.deterministic_simulation.iterations = 0;
  if(isfield(oo_.deterministic_simulation,'block'))
    blck_num = length(oo_.deterministic_simulation.block)+1;
  else
    blck_num = 1;
  end;
  oo_.deterministic_simulation.block(blck_num).status = 1;
  oo_.deterministic_simulation.block(blck_num).error = 0;
  oo_.deterministic_simulation.block(blck_num).iterations = 0;
  g1=[];g2=[];g3=[];
  y=dsge.block.dynamic_2(y, x, params, steady_state, 0, y_kmin, periods);
  tmp = y(:,M_.block_structure.block(2).variable);
  if any(isnan(tmp) | isinf(tmp))
    disp(['Inf or Nan value during the evaluation of block 1']);
    oo_.deterministic_simulation.status = 0;
    oo_.deterministic_simulation.error = 100;
    varargout{1} = oo_;
    return;
  end;
  g1=0;
  r=0;
  y_index = [ 5 2 7 6 4 1];
  if(isfield(oo_.deterministic_simulation,'block'))
    blck_num = length(oo_.deterministic_simulation.block)+1;
  else
    blck_num = 1;
  end;
  y = solve_one_boundary('dsge.block.dynamic_3', y, x, params, steady_state, y_index, 17, options_.periods, 0, blck_num, y_kmin, options_.simul.maxit, options_.solve_tolf, options_.slowc, 1e-15, options_.stack_solve_algo, 1, 1, 0);
  tmp = y(:,M_.block_structure.block(3).variable);
  if any(isnan(tmp) | isinf(tmp))
    disp(['Inf or Nan value during the resolution of block 2']);
    oo_.deterministic_simulation.status = 0;
    oo_.deterministic_simulation.error = 100;
    varargout{1} = oo_;
    return;
  end;
  oo_.endo_simul = y';
  varargout{1} = oo_;
return;
end
