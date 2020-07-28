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
M_.exo_names = cell(4,1);
M_.exo_names_tex = cell(4,1);
M_.exo_names_long = cell(4,1);
M_.exo_names(1) = {'n_a'};
M_.exo_names_tex(1) = {'{n_a}'};
M_.exo_names_long(1) = {'Produtivity shock'};
M_.exo_names(2) = {'n_g'};
M_.exo_names_tex(2) = {'{n_g}'};
M_.exo_names_long(2) = {'Government shock'};
M_.exo_names(3) = {'n_c'};
M_.exo_names_tex(3) = {'{n_c}'};
M_.exo_names_long(3) = {'Comsumption shock'};
M_.exo_names(4) = {'n_i'};
M_.exo_names_tex(4) = {'{n_i}'};
M_.exo_names_long(4) = {'Investment shock'};
M_.endo_names = cell(12,1);
M_.endo_names_tex = cell(12,1);
M_.endo_names_long = cell(12,1);
M_.endo_names(1) = {'c'};
M_.endo_names_tex(1) = {'{C}'};
M_.endo_names_long(1) = {'Consumption'};
M_.endo_names(2) = {'k'};
M_.endo_names_tex(2) = {'{K}'};
M_.endo_names_long(2) = {'Capital'};
M_.endo_names(3) = {'y'};
M_.endo_names_tex(3) = {'{Y}'};
M_.endo_names_long(3) = {'Production'};
M_.endo_names(4) = {'r'};
M_.endo_names_tex(4) = {'{R}'};
M_.endo_names_long(4) = {'Returns'};
M_.endo_names(5) = {'i'};
M_.endo_names_tex(5) = {'{I}'};
M_.endo_names_long(5) = {'Investment'};
M_.endo_names(6) = {'w'};
M_.endo_names_tex(6) = {'{W}'};
M_.endo_names_long(6) = {'Wage'};
M_.endo_names(7) = {'z'};
M_.endo_names_tex(7) = {'{Z}'};
M_.endo_names_long(7) = {'Capital Remuneration'};
M_.endo_names(8) = {'h'};
M_.endo_names_tex(8) = {'{H}'};
M_.endo_names_long(8) = {'Hours of labor'};
M_.endo_names(9) = {'e_a'};
M_.endo_names_tex(9) = {'{e_a}'};
M_.endo_names_long(9) = {'Produtivity shock'};
M_.endo_names(10) = {'e_g'};
M_.endo_names_tex(10) = {'{e_g}'};
M_.endo_names_long(10) = {'Government shock'};
M_.endo_names(11) = {'e_c'};
M_.endo_names_tex(11) = {'{e_c}'};
M_.endo_names_long(11) = {'Comsumption shock'};
M_.endo_names(12) = {'e_i'};
M_.endo_names_tex(12) = {'{e_i}'};
M_.endo_names_long(12) = {'Investment shock'};
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
M_.param_names_long(4) = {'AR(1) shock produtivity'};
M_.param_names(5) = {'rho_g'};
M_.param_names_tex(5) = {'{\rho_g}'};
M_.param_names_long(5) = {'AR(1) shock government'};
M_.param_names(6) = {'rho_c'};
M_.param_names_tex(6) = {'{\rho_c}'};
M_.param_names_long(6) = {'AR(1) shock comsumption'};
M_.param_names(7) = {'rho_i'};
M_.param_names_tex(7) = {'{\rho_i}'};
M_.param_names_long(7) = {'AR(1) shock investment'};
M_.param_names(8) = {'gy'};
M_.param_names_tex(8) = {'{gy}'};
M_.param_names_long(8) = {'Government Spending'};
M_.param_names(9) = {'sigma_c'};
M_.param_names_tex(9) = {'{\sigma_c}'};
M_.param_names_long(9) = {'Comsumption risk'};
M_.param_names(10) = {'chi'};
M_.param_names_tex(10) = {'{\chi}'};
M_.param_names_long(10) = {'Labour parameter'};
M_.param_names(11) = {'sigma_l'};
M_.param_names_tex(11) = {'{\sigma_l}'};
M_.param_names_long(11) = {'Desutility of labor'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.endo_nbr = 12;
M_.param_nbr = 11;
M_.orig_endo_nbr = 12;
M_.aux_vars = [];
M_.Sigma_e = zeros(4, 4);
M_.Correlation_matrix = eye(4, 4);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.linear_decomposition = false;
M_.nonzero_hessian_eqs = [1 2 3 4 5 6 7 9 10 11 12];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.orig_eq_nbr = 12;
M_.eq_nbr = 12;
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
 0 6 18;
 1 7 0;
 0 8 0;
 0 9 0;
 0 10 0;
 0 11 0;
 0 12 19;
 0 13 0;
 2 14 0;
 3 15 0;
 4 16 20;
 5 17 21;]';
M_.nstatic = 5;
M_.nfwrd   = 2;
M_.npred   = 3;
M_.nboth   = 2;
M_.nsfwrd   = 4;
M_.nspred   = 5;
M_.ndynamic   = 7;
M_.dynamic_tmp_nbr = [7; 7; 1; 0; ];
M_.equations_tags = {
  1 , 'name' , 'Euler Equation' ;
  2 , 'name' , 'Labour supply' ;
  3 , 'name' , 'Relation bounds and assets' ;
  4 , 'name' , 'Law of motion of capital' ;
  5 , 'name' , 'tecnology' ;
  6 , 'name' , 'minimization costs' ;
  7 , 'name' , 'w' ;
  8 , 'name' , 'Identity' ;
  9 , 'name' , 'Shocks' ;
  10 , 'name' , '10' ;
  11 , 'name' , '11' ;
  12 , 'name' , '12' ;
};
M_.mapping.c.eqidx = [1 2 8 ];
M_.mapping.k.eqidx = [4 5 6 ];
M_.mapping.y.eqidx = [5 6 7 8 ];
M_.mapping.r.eqidx = [1 3 ];
M_.mapping.i.eqidx = [4 8 ];
M_.mapping.w.eqidx = [2 7 ];
M_.mapping.z.eqidx = [3 6 ];
M_.mapping.h.eqidx = [2 5 7 ];
M_.mapping.e_a.eqidx = [5 9 ];
M_.mapping.e_g.eqidx = [8 10 ];
M_.mapping.e_c.eqidx = [1 11 ];
M_.mapping.e_i.eqidx = [3 4 12 ];
M_.mapping.n_a.eqidx = [9 ];
M_.mapping.n_g.eqidx = [10 ];
M_.mapping.n_c.eqidx = [11 ];
M_.mapping.n_i.eqidx = [12 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [2 9 10 11 12 ];
M_.exo_names_orig_ord = [1:4];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(12, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(4, 1);
M_.params = NaN(11, 1);
M_.endo_trends = struct('deflator', cell(12, 1), 'log_deflator', cell(12, 1), 'growth_factor', cell(12, 1), 'log_growth_factor', cell(12, 1));
M_.NNZDerivatives = [42; 47; -1; ];
M_.static_tmp_nbr = [5; 0; 0; 0; ];
M_.params(1) = 0.36;
alpha = M_.params(1);
M_.params(2) = 0.99;
beta = M_.params(2);
M_.params(3) = 0.025;
delta = M_.params(3);
M_.params(4) = 0.95;
rho_a = M_.params(4);
M_.params(6) = 0.95;
rho_c = M_.params(6);
M_.params(5) = 0.95;
rho_g = M_.params(5);
M_.params(7) = 0.95;
rho_i = M_.params(7);
M_.params(9) = 1;
sigma_c = M_.params(9);
M_.params(11) = 1;
sigma_l = M_.params(11);
M_.params(8) = 0.2;
gy = M_.params(8);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (0.01)^2;
M_.Sigma_e(2, 2) = (0.01)^2;
M_.Sigma_e(3, 3) = (0.01)^2;
M_.Sigma_e(4, 4) = (0.01)^2;
resid(1);
steady;
options_.irf = 60;
var_list_ = {'y';'c';'k';'i';'h';'w';'r';'z'};
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
