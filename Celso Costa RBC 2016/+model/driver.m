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
M_.exo_names(1) = {'e'};
M_.exo_names_tex(1) = {'e'};
M_.exo_names_long(1) = {'e'};
M_.endo_names = cell(8,1);
M_.endo_names_tex = cell(8,1);
M_.endo_names_long = cell(8,1);
M_.endo_names(1) = {'A'};
M_.endo_names_tex(1) = {'A'};
M_.endo_names_long(1) = {'A'};
M_.endo_names(2) = {'R'};
M_.endo_names_tex(2) = {'R'};
M_.endo_names_long(2) = {'R'};
M_.endo_names(3) = {'W'};
M_.endo_names_tex(3) = {'W'};
M_.endo_names_long(3) = {'W'};
M_.endo_names(4) = {'Y'};
M_.endo_names_tex(4) = {'Y'};
M_.endo_names_long(4) = {'Y'};
M_.endo_names(5) = {'I'};
M_.endo_names_tex(5) = {'I'};
M_.endo_names_long(5) = {'I'};
M_.endo_names(6) = {'C'};
M_.endo_names_tex(6) = {'C'};
M_.endo_names_long(6) = {'C'};
M_.endo_names(7) = {'L'};
M_.endo_names_tex(7) = {'L'};
M_.endo_names_long(7) = {'L'};
M_.endo_names(8) = {'K'};
M_.endo_names_tex(8) = {'K'};
M_.endo_names_long(8) = {'K'};
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
M_.param_names(6) = {'rho'};
M_.param_names_tex(6) = {'rho'};
M_.param_names_long(6) = {'rho'};
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
M_.nonzero_hessian_eqs = [1 2 4 5 6 8];
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
 1 2 0;
 0 3 10;
 0 4 0;
 0 5 0;
 0 6 0;
 0 7 11;
 0 8 0;
 0 9 12;]';
M_.nstatic = 4;
M_.nfwrd   = 3;
M_.npred   = 1;
M_.nboth   = 0;
M_.nsfwrd   = 3;
M_.nspred   = 1;
M_.ndynamic   = 4;
M_.dynamic_tmp_nbr = [4; 4; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , '1' ;
  2 , 'name' , '2' ;
  3 , 'name' , 'K' ;
  4 , 'name' , 'Y' ;
  5 , 'name' , '5' ;
  6 , 'name' , 'L' ;
  7 , 'name' , '7' ;
  8 , 'name' , '8' ;
};
M_.mapping.A.eqidx = [4 8 ];
M_.mapping.R.eqidx = [2 5 ];
M_.mapping.W.eqidx = [1 6 ];
M_.mapping.Y.eqidx = [4 5 6 7 ];
M_.mapping.I.eqidx = [3 7 ];
M_.mapping.C.eqidx = [1 2 7 ];
M_.mapping.L.eqidx = [1 4 6 ];
M_.mapping.K.eqidx = [3 4 5 ];
M_.mapping.e.eqidx = [8 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [1 ];
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
M_.NNZDerivatives = [25; 23; -1; ];
M_.static_tmp_nbr = [4; 0; 0; 0; ];
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
rho = M_.params(6);
Ass = 1;
Pss = 1;
Rss = Pss*(1/beta - (1 - delta));
Wss = (1 - alpha)*Pss^(1/(1-alpha))*(alpha/Rss)^(alpha/(1-alpha));
Yss = (Rss/Rss - delta*alpha)^(sigma/(sigma + phi)) * (Wss/Pss * ((Wss/Pss)/(1 - alpha)))^(1/(sigma + phi));
Iss = (delta*alpha/Rss)*Yss;
Css = 1/(Yss^(phi/sigma))*((1 - alpha)^(-phi) * (Wss/Pss)^(1+phi))^(1/sigma);
Kss = alpha*(Yss/(Rss/Pss));
Lss = (1 - alpha)*(Yss/(Wss/Pss));
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(1) = Ass;
oo_.steady_state(2) = Rss;
oo_.steady_state(3) = Wss;
oo_.steady_state(4) = Yss;
oo_.steady_state(5) = Iss;
oo_.steady_state(6) = Css;
oo_.steady_state(7) = Lss;
oo_.steady_state(8) = Kss;
oo_.exo_steady_state(1) = 0;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
model_info();
model_diagnostics(M_,options_,oo_);
resid;
options_.steady.maxit = 10000;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
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
