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
M_.fname = 'modelExercices';
M_.dynare_version = '4.6.1';
oo_.dynare_version = '4.6.1';
options_.dynare_version = '4.6.1';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('modelExercices.log');
M_.exo_names = cell(2,1);
M_.exo_names_tex = cell(2,1);
M_.exo_names_long = cell(2,1);
M_.exo_names(1) = {'e_a'};
M_.exo_names_tex(1) = {'{e_a}'};
M_.exo_names_long(1) = {'Produtivity shock'};
M_.exo_names(2) = {'e_g'};
M_.exo_names_tex(2) = {'{e_g}'};
M_.exo_names_long(2) = {'Government shock'};
M_.endo_names = cell(6,1);
M_.endo_names_tex = cell(6,1);
M_.endo_names_long = cell(6,1);
M_.endo_names(1) = {'c'};
M_.endo_names_tex(1) = {'{C}'};
M_.endo_names_long(1) = {'Consumption'};
M_.endo_names(2) = {'k'};
M_.endo_names_tex(2) = {'{K}'};
M_.endo_names_long(2) = {'Capital'};
M_.endo_names(3) = {'a'};
M_.endo_names_tex(3) = {'{A}'};
M_.endo_names_long(3) = {'Tecnology'};
M_.endo_names(4) = {'y'};
M_.endo_names_tex(4) = {'{Y}'};
M_.endo_names_long(4) = {'Production'};
M_.endo_names(5) = {'i'};
M_.endo_names_tex(5) = {'{I}'};
M_.endo_names_long(5) = {'Investiment'};
M_.endo_names(6) = {'g'};
M_.endo_names_tex(6) = {'{G}'};
M_.endo_names_long(6) = {'Government Spend'};
M_.endo_partitions = struct();
M_.param_names = cell(11,1);
M_.param_names_tex = cell(11,1);
M_.param_names_long = cell(11,1);
M_.param_names(1) = {'alpha'};
M_.param_names_tex(1) = {'{\alpha}'};
M_.param_names_long(1) = {'Share of capital - production function'};
M_.param_names(2) = {'beta'};
M_.param_names_tex(2) = {'{\beta}'};
M_.param_names_long(2) = {'Houlsehold discount factor'};
M_.param_names(3) = {'delta'};
M_.param_names_tex(3) = {'{\delta}'};
M_.param_names_long(3) = {'Depratiation of capital'};
M_.param_names(4) = {'rho_a'};
M_.param_names_tex(4) = {'{\rho_a}'};
M_.param_names_long(4) = {'AR(1) produtivity shock'};
M_.param_names(5) = {'rho_g'};
M_.param_names_tex(5) = {'{\rho_g}'};
M_.param_names_long(5) = {'AR(1) government shock'};
M_.param_names(6) = {'Css'};
M_.param_names_tex(6) = {'{C_{ss}}'};
M_.param_names_long(6) = {'Steady State comsuption'};
M_.param_names(7) = {'Kss'};
M_.param_names_tex(7) = {'{K_{ss}'};
M_.param_names_long(7) = {'Steady State capital'};
M_.param_names(8) = {'Yss'};
M_.param_names_tex(8) = {'{Y_{ss}}'};
M_.param_names_long(8) = {'Steady State Output'};
M_.param_names(9) = {'Iss'};
M_.param_names_tex(9) = {'{I_{ss}}'};
M_.param_names_long(9) = {'Steady State Investiment'};
M_.param_names(10) = {'gamma'};
M_.param_names_tex(10) = {'{\gamma}'};
M_.param_names_long(10) = {'Trend Factor'};
M_.param_names(11) = {'gy'};
M_.param_names_tex(11) = {'{g^y}'};
M_.param_names_long(11) = {'Government Spend'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 6;
M_.param_nbr = 11;
M_.orig_endo_nbr = 6;
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
M_.orig_eq_nbr = 6;
M_.eq_nbr = 6;
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
 0 4 10;
 1 5 0;
 2 6 11;
 0 7 0;
 0 8 0;
 3 9 0;]';
M_.nstatic = 2;
M_.nfwrd   = 1;
M_.npred   = 2;
M_.nboth   = 1;
M_.nsfwrd   = 2;
M_.nspred   = 3;
M_.ndynamic   = 4;
M_.dynamic_tmp_nbr = [1; 0; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , 'Euler' ;
  2 , 'name' , 'Production' ;
  3 , 'name' , 'Identity' ;
  4 , 'name' , 'Investiment' ;
  5 , 'name' , 'Produtivity Shock' ;
  6 , 'name' , 'Governement shock' ;
};
M_.mapping.c.eqidx = [1 3 ];
M_.mapping.k.eqidx = [1 2 4 ];
M_.mapping.a.eqidx = [1 2 5 ];
M_.mapping.y.eqidx = [2 3 ];
M_.mapping.i.eqidx = [3 4 ];
M_.mapping.g.eqidx = [3 6 ];
M_.mapping.e_a.eqidx = [5 ];
M_.mapping.e_g.eqidx = [6 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [2 3 6 ];
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(6, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(11, 1);
M_.endo_trends = struct('deflator', cell(6, 1), 'log_deflator', cell(6, 1), 'growth_factor', cell(6, 1), 'log_growth_factor', cell(6, 1));
M_.NNZDerivatives = [20; 0; -1; ];
M_.static_tmp_nbr = [1; 0; 0; 0; ];
M_.params(1) = 0.40;
alpha = M_.params(1);
M_.params(2) = 0.99;
beta = M_.params(2);
M_.params(3) = 0.025;
delta = M_.params(3);
M_.params(4) = 0.95;
rho_a = M_.params(4);
M_.params(5) = 0.95;
rho_g = M_.params(5);
M_.params(10) = 1.0078;
gamma = M_.params(10);
M_.params(11) = 0.2;
gy = M_.params(11);
M_.params(7) = (M_.params(10)/M_.params(2)-1+M_.params(3))*(1/M_.params(1))^(1/(M_.params(1)-1));
Kss = M_.params(7);
M_.params(9) = (M_.params(10)-1-M_.params(3))*M_.params(7);
Iss = M_.params(9);
M_.params(8) = M_.params(7)^M_.params(1);
Yss = M_.params(8);
M_.params(6) = (1-M_.params(11))*M_.params(8)-M_.params(9);
Css = M_.params(6);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (.01)^2;
M_.Sigma_e(2, 2) = (.01)^2;
oo_.dr.eigval = check(M_,options_,oo_);
options_.irf = 25;
var_list_ = {'c';'k';'a';'y';'i';'g'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
save('modelExercices_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('modelExercices_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('modelExercices_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('modelExercices_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('modelExercices_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('modelExercices_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('modelExercices_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
