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
M_.fname = 'dsge';
M_.dynare_version = '4.6.1';
oo_.dynare_version = '4.6.1';
options_.dynare_version = '4.6.1';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('dsge.log');
M_.exo_names = cell(1,1);
M_.exo_names_tex = cell(1,1);
M_.exo_names_long = cell(1,1);
M_.exo_names(1) = {'e'};
M_.exo_names_tex(1) = {'e'};
M_.exo_names_long(1) = {'e'};
M_.endo_names = cell(8,1);
M_.endo_names_tex = cell(8,1);
M_.endo_names_long = cell(8,1);
M_.endo_names(1) = {'C'};
M_.endo_names_tex(1) = {'C'};
M_.endo_names_long(1) = {'C'};
M_.endo_names(2) = {'L'};
M_.endo_names_tex(2) = {'L'};
M_.endo_names_long(2) = {'L'};
M_.endo_names(3) = {'W'};
M_.endo_names_tex(3) = {'W'};
M_.endo_names_long(3) = {'W'};
M_.endo_names(4) = {'R'};
M_.endo_names_tex(4) = {'R'};
M_.endo_names_long(4) = {'R'};
M_.endo_names(5) = {'I'};
M_.endo_names_tex(5) = {'I'};
M_.endo_names_long(5) = {'I'};
M_.endo_names(6) = {'K'};
M_.endo_names_tex(6) = {'K'};
M_.endo_names_long(6) = {'K'};
M_.endo_names(7) = {'Y'};
M_.endo_names_tex(7) = {'Y'};
M_.endo_names_long(7) = {'Y'};
M_.endo_names(8) = {'A'};
M_.endo_names_tex(8) = {'A'};
M_.endo_names_long(8) = {'A'};
M_.endo_partitions = struct();
M_.param_names = cell(6,1);
M_.param_names_tex = cell(6,1);
M_.param_names_long = cell(6,1);
M_.param_names(1) = {'sigma'};
M_.param_names_tex(1) = {'sigma'};
M_.param_names_long(1) = {'sigma'};
M_.param_names(2) = {'varpi'};
M_.param_names_tex(2) = {'varpi'};
M_.param_names_long(2) = {'varpi'};
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
options_.block = true;
options_.bytecode = false;
options_.use_dll = false;
options_.linear_decomposition = false;
M_.nonzero_hessian_eqs = [1 2 4 5 6];
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
 0 2 10;
 0 3 0;
 0 4 0;
 0 5 11;
 0 6 0;
 0 7 12;
 0 8 0;
 1 9 0;]';
M_.nstatic = 4;
M_.nfwrd   = 3;
M_.npred   = 1;
M_.nboth   = 0;
M_.nsfwrd   = 3;
M_.nspred   = 1;
M_.ndynamic   = 4;
M_.dynamic_tmp_nbr = [0; 0; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , '1' ;
  2 , 'name' , '2' ;
  3 , 'name' , 'K' ;
  4 , 'name' , 'Y' ;
  5 , 'name' , '5' ;
  6 , 'name' , 'L' ;
  7 , 'name' , '7' ;
  8 , 'name' , 'A' ;
};
M_.mapping.C.eqidx = [1 2 7 ];
M_.mapping.L.eqidx = [1 4 6 ];
M_.mapping.W.eqidx = [1 6 ];
M_.mapping.R.eqidx = [2 5 ];
M_.mapping.I.eqidx = [3 7 ];
M_.mapping.K.eqidx = [3 4 5 ];
M_.mapping.Y.eqidx = [4 5 6 7 ];
M_.mapping.A.eqidx = [4 8 ];
M_.mapping.e.eqidx = [8 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
block_structure.block(1).Simulation_Type = 3;
block_structure.block(1).maximum_lag = 0;
block_structure.block(1).maximum_lead = 0;
block_structure.block(1).maximum_endo_lag = 0;
block_structure.block(1).maximum_endo_lead = 0;
block_structure.block(1).maximum_exo_lag = 0;
block_structure.block(1).maximum_exo_lead = 0;
block_structure.block(1).maximum_exo_det_lag = 0;
block_structure.block(1).maximum_exo_det_lead = 0;
block_structure.block(1).endo_nbr = 1;
block_structure.block(1).mfs = 1;
block_structure.block(1).equation = [ 1];
block_structure.block(1).variable = [ 3];
block_structure.block(1).exo_nbr = 0;
block_structure.block(1).exogenous = [];
block_structure.block(1).exogenous_det = [];
block_structure.block(1).exo_det_nbr = 0;
block_structure.block(1).other_endogenous = [];
block_structure.block(1).other_endogenous_block = [];
block_structure.block(1).tm1 = zeros(0, 1);
block_structure.block(1).other_endo_nbr = 0;
block_structure.block(1).lead_lag_incidence = [];
block_structure.block(1).lead_lag_incidence = [ block_structure.block(1).lead_lag_incidence;  0]; %lag = -1
block_structure.block(1).lead_lag_incidence = [ block_structure.block(1).lead_lag_incidence; 1]; %lag = 0
block_structure.block(1).lead_lag_incidence = [ block_structure.block(1).lead_lag_incidence;  0]; %lag = 1
block_structure.block(1).sorted_col_dr_ghx = [];
block_structure.block(1).lead_lag_incidence_other = [];
block_structure.block(1).lead_lag_incidence_other = [ block_structure.block(1).lead_lag_incidence_other; ]; %lag = -1
block_structure.block(1).lead_lag_incidence_other = [ block_structure.block(1).lead_lag_incidence_other; ]; %lag = 0
block_structure.block(1).lead_lag_incidence_other = [ block_structure.block(1).lead_lag_incidence_other; ]; %lag = 1
block_structure.block(1).n_static = 1;
block_structure.block(1).n_forward = 0;
block_structure.block(1).n_backward = 0;
block_structure.block(1).n_mixed = 0;
block_structure.block(2).Simulation_Type = 1;
block_structure.block(2).maximum_lag = 1;
block_structure.block(2).maximum_lead = 0;
block_structure.block(2).maximum_endo_lag = 1;
block_structure.block(2).maximum_endo_lead = 0;
block_structure.block(2).maximum_exo_lag = 0;
block_structure.block(2).maximum_exo_lead = 0;
block_structure.block(2).maximum_exo_det_lag = 0;
block_structure.block(2).maximum_exo_det_lead = 0;
block_structure.block(2).endo_nbr = 1;
block_structure.block(2).mfs = 1;
block_structure.block(2).equation = [ 8];
block_structure.block(2).variable = [ 8];
block_structure.block(2).exo_nbr = 1;
block_structure.block(2).exogenous = [ 1];
block_structure.block(2).exogenous_det = [];
block_structure.block(2).exo_det_nbr = 0;
block_structure.block(2).other_endogenous = [];
block_structure.block(2).other_endogenous_block = [];
block_structure.block(2).tm1 = zeros(0, 1);
block_structure.block(2).other_endo_nbr = 0;
block_structure.block(2).lead_lag_incidence = [];
block_structure.block(2).lead_lag_incidence = [ block_structure.block(2).lead_lag_incidence; 1]; %lag = -1
block_structure.block(2).lead_lag_incidence = [ block_structure.block(2).lead_lag_incidence; 2]; %lag = 0
block_structure.block(2).lead_lag_incidence = [ block_structure.block(2).lead_lag_incidence;  0]; %lag = 1
block_structure.block(2).sorted_col_dr_ghx = [1 ];
block_structure.block(2).lead_lag_incidence_other = [];
block_structure.block(2).lead_lag_incidence_other = [ block_structure.block(2).lead_lag_incidence_other; ]; %lag = -1
block_structure.block(2).lead_lag_incidence_other = [ block_structure.block(2).lead_lag_incidence_other; ]; %lag = 0
block_structure.block(2).lead_lag_incidence_other = [ block_structure.block(2).lead_lag_incidence_other; ]; %lag = 1
block_structure.block(2).n_static = 0;
block_structure.block(2).n_forward = 0;
block_structure.block(2).n_backward = 1;
block_structure.block(2).n_mixed = 0;
block_structure.block(3).Simulation_Type = 7;
block_structure.block(3).maximum_lag = 0;
block_structure.block(3).maximum_lead = 1;
block_structure.block(3).maximum_endo_lag = 0;
block_structure.block(3).maximum_endo_lead = 1;
block_structure.block(3).maximum_exo_lag = 0;
block_structure.block(3).maximum_exo_lead = 0;
block_structure.block(3).maximum_exo_det_lag = 0;
block_structure.block(3).maximum_exo_det_lead = 0;
block_structure.block(3).endo_nbr = 6;
block_structure.block(3).mfs = 6;
block_structure.block(3).equation = [ 3 6 7 4 5 2];
block_structure.block(3).variable = [ 5 2 7 6 4 1];
block_structure.block(3).exo_nbr = 0;
block_structure.block(3).exogenous = [];
block_structure.block(3).exogenous_det = [];
block_structure.block(3).exo_det_nbr = 0;
block_structure.block(3).other_endogenous = [ 3];
block_structure.block(3).other_endogenous_block = [ 1];
block_structure.block(3).tm1 = zeros(1, 1);
block_structure.block(3).other_endo_nbr = 1;
block_structure.block(3).lead_lag_incidence = [];
block_structure.block(3).lead_lag_incidence = [ block_structure.block(3).lead_lag_incidence;  0 0 0 0 0 0]; %lag = -1
block_structure.block(3).lead_lag_incidence = [ block_structure.block(3).lead_lag_incidence; 1 2 3 4 5 6]; %lag = 0
block_structure.block(3).lead_lag_incidence = [ block_structure.block(3).lead_lag_incidence;  0 0 0 7 8 9]; %lag = 1
block_structure.block(3).sorted_col_dr_ghx = [];
block_structure.block(3).lead_lag_incidence_other = [];
block_structure.block(3).lead_lag_incidence_other = [ block_structure.block(3).lead_lag_incidence_other;  0]; %lag = -1
block_structure.block(3).lead_lag_incidence_other = [ block_structure.block(3).lead_lag_incidence_other;  1]; %lag = 0
block_structure.block(3).lead_lag_incidence_other = [ block_structure.block(3).lead_lag_incidence_other;  0]; %lag = 1
block_structure.block(3).n_static = 3;
block_structure.block(3).n_forward = 3;
block_structure.block(3).n_backward = 0;
block_structure.block(3).n_mixed = 0;
M_.block_structure.block = block_structure.block;
M_.block_structure.variable_reordered = [ 3 8 5 2 7 6 4 1];
M_.block_structure.equation_reordered = [ 1 8 3 6 7 4 5 2];
M_.block_structure.incidence(1).lead_lag = -1;
M_.block_structure.incidence(1).sparse_IM = [8 8;
];
M_.block_structure.incidence(2).lead_lag = 0;
M_.block_structure.incidence(2).sparse_IM = [1 3;
2 1;
3 5;
3 6;
4 2;
4 6;
4 7;
5 4;
5 6;
5 7;
6 2;
6 3;
6 7;
7 1;
7 5;
7 7;
8 8;
];
M_.block_structure.incidence(3).lead_lag = 1;
M_.block_structure.incidence(3).sparse_IM = [2 1;
2 4;
3 6;
];
M_.state_var = [8 ];
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
M_.NNZDerivatives = [25; 21; -1; ];
M_.static_tmp_nbr = [0; 0; 0; 0; ];
block_structure_stat.block(1).Simulation_Type = 3;
block_structure_stat.block(1).endo_nbr = 1;
block_structure_stat.block(1).mfs = 1;
block_structure_stat.block(1).equation = [ 1];
block_structure_stat.block(1).variable = [ 3];
block_structure_stat.block(2).Simulation_Type = 3;
block_structure_stat.block(2).endo_nbr = 1;
block_structure_stat.block(2).mfs = 1;
block_structure_stat.block(2).equation = [ 2];
block_structure_stat.block(2).variable = [ 4];
block_structure_stat.block(3).Simulation_Type = 3;
block_structure_stat.block(3).endo_nbr = 1;
block_structure_stat.block(3).mfs = 1;
block_structure_stat.block(3).equation = [ 8];
block_structure_stat.block(3).variable = [ 8];
block_structure_stat.block(4).Simulation_Type = 6;
block_structure_stat.block(4).endo_nbr = 3;
block_structure_stat.block(4).mfs = 1;
block_structure_stat.block(4).equation = [ 4 5 6];
block_structure_stat.block(4).variable = [ 2 6 7];
block_structure_stat.block(5).Simulation_Type = 3;
block_structure_stat.block(5).endo_nbr = 1;
block_structure_stat.block(5).mfs = 1;
block_structure_stat.block(5).equation = [ 3];
block_structure_stat.block(5).variable = [ 5];
block_structure_stat.block(6).Simulation_Type = 3;
block_structure_stat.block(6).endo_nbr = 1;
block_structure_stat.block(6).mfs = 1;
block_structure_stat.block(6).equation = [ 7];
block_structure_stat.block(6).variable = [ 1];
M_.block_structure_stat.block = block_structure_stat.block;
M_.block_structure_stat.variable_reordered = [ 3 4 8 2 6 7 5 1];
M_.block_structure_stat.equation_reordered = [ 1 2 8 4 5 6 3 7];
M_.block_structure_stat.incidence.sparse_IM = [1 3;
2 4;
3 5;
3 6;
4 2;
4 6;
4 7;
5 4;
5 6;
5 7;
6 2;
6 3;
6 7;
7 1;
7 5;
7 7;
8 8;
];
M_.params(1) = 2;
sigma = M_.params(1);
M_.params(2) = 1.5;
varpi = M_.params(2);
M_.params(3) = 0.35;
alpha = M_.params(3);
M_.params(4) = 0.985;
beta = M_.params(4);
M_.params(5) = 0.025;
delta = M_.params(5);
M_.params(6) = 0.95;
rho = M_.params(6);
Rss = 1/beta -(1-delta);
Wss = (1-alpha)*(alpha/Rss)^(alpha/(1-alpha));
Yss = (Rss/(Rss - delta*alpha))^(sigma/(sigma+varpi)) * (Wss*(Wss/(1-alpha))^varpi)^(1/(sigma+varpi));
Iss = (delta*alpha / Rss)*Yss;
Css = 1/(Yss^(varpi/sigma)) * ((1-alpha)^(-varpi) * Wss^(1+varpi))^(1/sigma);
Kss = alpha*(Yss/Rss);
Lss = (1-alpha)*(Yss/Wss);
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(1) = Css;
oo_.steady_state(2) = Lss;
oo_.steady_state(3) = Wss;
oo_.steady_state(4) = Rss;
oo_.steady_state(5) = Iss;
oo_.steady_state(6) = Kss;
oo_.steady_state(7) = Yss;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
steady;
oo_.dr.eigval = check(M_,options_,oo_);
model_diagnostics(M_,options_,oo_);
model_info();
save('dsge_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('dsge_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('dsge_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('dsge_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('dsge_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('dsge_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('dsge_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
