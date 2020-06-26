%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'model';
M_.dynare_version = '4.6.1';
oo_.dynare_version = '4.6.1';
options_.dynare_version = '4.6.1';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('model.log');
M_.exo_names = cell(1,1);
M_.exo_names_tex = cell(1,1);
M_.exo_names_long = cell(1,1);
M_.exo_names(1) = {'ez'};
M_.exo_names_tex(1) = {'ez'};
M_.exo_names_long(1) = {'ez'};
M_.endo_names = cell(8,1);
M_.endo_names_tex = cell(8,1);
M_.endo_names_long = cell(8,1);
M_.endo_names(1) = {'z'};
M_.endo_names_tex(1) = {'z'};
M_.endo_names_long(1) = {'z'};
M_.endo_names(2) = {'k'};
M_.endo_names_tex(2) = {'k'};
M_.endo_names_long(2) = {'k'};
M_.endo_names(3) = {'n'};
M_.endo_names_tex(3) = {'n'};
M_.endo_names_long(3) = {'n'};
M_.endo_names(4) = {'y'};
M_.endo_names_tex(4) = {'y'};
M_.endo_names_long(4) = {'y'};
M_.endo_names(5) = {'c'};
M_.endo_names_tex(5) = {'c'};
M_.endo_names_long(5) = {'c'};
M_.endo_names(6) = {'i'};
M_.endo_names_tex(6) = {'i'};
M_.endo_names_long(6) = {'i'};
M_.endo_names(7) = {'r'};
M_.endo_names_tex(7) = {'r'};
M_.endo_names_long(7) = {'r'};
M_.endo_names(8) = {'w'};
M_.endo_names_tex(8) = {'w'};
M_.endo_names_long(8) = {'w'};
M_.endo_partitions = struct();
M_.param_names = cell(6,1);
M_.param_names_tex = cell(6,1);
M_.param_names_long = cell(6,1);
M_.param_names(1) = {'alph'};
M_.param_names_tex(1) = {'alph'};
M_.param_names_long(1) = {'alph'};
M_.param_names(2) = {'bet'};
M_.param_names_tex(2) = {'bet'};
M_.param_names_long(2) = {'bet'};
M_.param_names(3) = {'dlt'};
M_.param_names_tex(3) = {'dlt'};
M_.param_names_long(3) = {'dlt'};
M_.param_names(4) = {'rho'};
M_.param_names_tex(4) = {'rho'};
M_.param_names_long(4) = {'rho'};
M_.param_names(5) = {'sigz'};
M_.param_names_tex(5) = {'sigz'};
M_.param_names_long(5) = {'sigz'};
M_.param_names(6) = {'psi'};
M_.param_names_tex(6) = {'psi'};
M_.param_names_long(6) = {'psi'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 8;
M_.param_nbr = 6;
M_.orig_endo_nbr = 8;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.linear_decomposition = false;
M_.nonzero_hessian_eqs = [1 2 3 4 5 8];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.orig_eq_nbr = 8;
M_.eq_nbr = 8;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 1 3 11;
 2 4 12;
 0 5 13;
 0 6 0;
 0 7 14;
 0 8 0;
 0 9 0;
 0 10 0;]';
M_.nstatic = 4;
M_.nfwrd   = 2;
M_.npred   = 0;
M_.nboth   = 2;
M_.nsfwrd   = 4;
M_.nspred   = 2;
M_.ndynamic   = 4;
M_.dynamic_tmp_nbr = [4; 6; 3; 0; ];
M_.equations_tags = {
  1 , 'name' , '1' ;
  2 , 'name' , 'r' ;
  3 , 'name' , 'c' ;
  4 , 'name' , '4' ;
  5 , 'name' , 'y' ;
  6 , 'name' , 'k' ;
  7 , 'name' , '7' ;
  8 , 'name' , 'w' ;
};
M_.mapping.z.eqidx = [1 2 4 5 ];
M_.mapping.k.eqidx = [2 4 5 6 ];
M_.mapping.n.eqidx = [2 4 5 8 ];
M_.mapping.y.eqidx = [5 7 8 ];
M_.mapping.c.eqidx = [3 4 7 ];
M_.mapping.i.eqidx = [6 7 ];
M_.mapping.r.eqidx = [2 3 ];
M_.mapping.w.eqidx = [8 ];
M_.mapping.ez.eqidx = [1 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [1 2 ];
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(8, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(6, 1);
M_.endo_trends = struct('deflator', cell(8, 1), 'log_deflator', cell(8, 1), 'growth_factor', cell(8, 1), 'log_growth_factor', cell(8, 1));
M_.NNZDerivatives = [27; 34; -1; ];
M_.static_tmp_nbr = [5; 3; 0; 0; ];
M_.params(1) = 0.33;
alph = M_.params(1);
M_.params(2) = 0.99;
bet = M_.params(2);
M_.params(3) = 0.025;
dlt = M_.params(3);
M_.params(4) = 0.95;
rho = M_.params(4);
M_.params(5) = 0.01;
sigz = M_.params(5);
nss  = 1/3;
rss  = 1/bet - 1;
knss = ( alph/(rss+dlt) )^(1/(1-alph));
kss = knss*nss;
yss  = (kss^alph)*(nss^(1-alph));
wss  = (1-alph)*yss/nss;
iss  = dlt*kss;
css  = yss-iss;
M_.params(6) = (1-nss)*wss/nss/(knss^M_.params(1)-knss*M_.params(3));
psi = M_.params(6);
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(4) = yss;
oo_.steady_state(5) = css;
oo_.steady_state(6) = iss;
oo_.steady_state(3) = nss;
oo_.steady_state(2) = kss;
oo_.steady_state(7) = rss;
oo_.steady_state(8) = wss;
oo_.steady_state(1) = 1;
oo_.exo_steady_state(1) = 0;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = 1;
steady;
options_.irf = 100;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
save('model_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('model_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('model_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('model_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('model_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('model_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('model_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
