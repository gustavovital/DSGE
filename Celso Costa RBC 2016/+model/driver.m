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
M_.exo_names = cell(2,1);
M_.exo_names_tex = cell(2,1);
M_.exo_names_long = cell(2,1);
M_.exo_names(1) = {'e'};
M_.exo_names_tex(1) = {'e'};
M_.exo_names_long(1) = {'e'};
M_.exo_names(2) = {'n'};
M_.exo_names_tex(2) = {'n'};
M_.exo_names_long(2) = {'n'};
M_.endo_names = cell(8,1);
M_.endo_names_tex = cell(8,1);
M_.endo_names_long = cell(8,1);
M_.endo_names(1) = {'Y'};
M_.endo_names_tex(1) = {'{Y}'};
M_.endo_names_long(1) = {'Output'};
M_.endo_names(2) = {'I'};
M_.endo_names_tex(2) = {'{I}'};
M_.endo_names_long(2) = {'Investiment'};
M_.endo_names(3) = {'C'};
M_.endo_names_tex(3) = {'{C}'};
M_.endo_names_long(3) = {'Consumption'};
M_.endo_names(4) = {'R'};
M_.endo_names_tex(4) = {'{R}'};
M_.endo_names_long(4) = {'Nominal Interest Rate'};
M_.endo_names(5) = {'K'};
M_.endo_names_tex(5) = {'{K}'};
M_.endo_names_long(5) = {'Capital'};
M_.endo_names(6) = {'W'};
M_.endo_names_tex(6) = {'{W}'};
M_.endo_names_long(6) = {'Wage'};
M_.endo_names(7) = {'L'};
M_.endo_names_tex(7) = {'{L}'};
M_.endo_names_long(7) = {'Labor'};
M_.endo_names(8) = {'A'};
M_.endo_names_tex(8) = {'{A}'};
M_.endo_names_long(8) = {'Tecnology'};
M_.endo_partitions = struct();
M_.param_names = cell(6,1);
M_.param_names_tex = cell(6,1);
M_.param_names_long = cell(6,1);
M_.param_names(1) = {'sigma'};
M_.param_names_tex(1) = {'sigma'};
M_.param_names_long(1) = {'sigma'};
M_.param_names(2) = {'phi'};
M_.param_names_tex(2) = {'phi'};
M_.param_names_long(2) = {'phi'};
M_.param_names(3) = {'alpha'};
M_.param_names_tex(3) = {'alpha'};
M_.param_names_long(3) = {'alpha'};
M_.param_names(4) = {'beta'};
M_.param_names_tex(4) = {'beta'};
M_.param_names_long(4) = {'beta'};
M_.param_names(5) = {'delta'};
M_.param_names_tex(5) = {'delta'};
M_.param_names_long(5) = {'delta'};
M_.param_names(6) = {'rhoa'};
M_.param_names_tex(6) = {'rhoa'};
M_.param_names_long(6) = {'rhoa'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 8;
M_.param_nbr = 6;
M_.orig_endo_nbr = 8;
M_.aux_vars = [];
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
options_.linear = true;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.linear_decomposition = false;
M_.nonzero_hessian_eqs = [];
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
 0 3 0;
 0 4 0;
 0 5 11;
 0 6 12;
 1 7 0;
 0 8 0;
 0 9 0;
 2 10 0;]';
M_.nstatic = 4;
M_.nfwrd   = 2;
M_.npred   = 2;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 2;
M_.ndynamic   = 4;
M_.dynamic_tmp_nbr = [7; 0; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , '1' ;
  2 , 'name' , '2' ;
  3 , 'name' , 'K' ;
  4 , 'name' , 'Y' ;
  5 , 'name' , 'R' ;
  6 , 'name' , 'W' ;
  7 , 'name' , '7' ;
  8 , 'name' , 'A' ;
};
M_.mapping.Y.eqidx = [4 5 6 7 ];
M_.mapping.I.eqidx = [3 7 ];
M_.mapping.C.eqidx = [1 2 7 ];
M_.mapping.R.eqidx = [2 5 ];
M_.mapping.K.eqidx = [3 4 5 ];
M_.mapping.W.eqidx = [1 6 ];
M_.mapping.L.eqidx = [1 4 6 ];
M_.mapping.A.eqidx = [4 8 ];
M_.mapping.e.eqidx = [8 ];
M_.mapping.n.eqidx = [5 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [5 8 ];
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(8, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(6, 1);
M_.endo_trends = struct('deflator', cell(8, 1), 'log_deflator', cell(8, 1), 'growth_factor', cell(8, 1), 'log_growth_factor', cell(8, 1));
M_.NNZDerivatives = [26; 0; -1; ];
M_.static_tmp_nbr = [0; 0; 0; 0; ];
M_.params(1) = 2;
sigma = M_.params(1);
M_.params(2) = 1.5;
phi = M_.params(2);
M_.params(3) = 0.35;
alpha = M_.params(3);
M_.params(4) = 0.985;
beta = M_.params(4);
M_.params(5) = 0.025;
delta = M_.params(5);
M_.params(6) = 0.95;
rhoa = M_.params(6);
steady;
oo_.dr.eigval = check(M_,options_,oo_);
model_diagnostics(M_,options_,oo_);
model_info();
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(2, 2) = (0.01)^2;
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
