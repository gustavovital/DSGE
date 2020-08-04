%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'dnk_wage';
M_.dynare_version = '4.6.1';
oo_.dynare_version = '4.6.1';
options_.dynare_version = '4.6.1';
%
% Some global variables initialization
%
global_initialization;
diary off;
M_.exo_names = cell(2,1);
M_.exo_names_tex = cell(2,1);
M_.exo_names_long = cell(2,1);
M_.exo_names(1) = {'eA'};
M_.exo_names_tex(1) = {'eA'};
M_.exo_names_long(1) = {'eA'};
M_.exo_names(2) = {'eR'};
M_.exo_names_tex(2) = {'eR'};
M_.exo_names_long(2) = {'eR'};
M_.endo_names = cell(24,1);
M_.endo_names_tex = cell(24,1);
M_.endo_names_long = cell(24,1);
M_.endo_names(1) = {'L'};
M_.endo_names_tex(1) = {'L'};
M_.endo_names_long(1) = {'L'};
M_.endo_names(2) = {'Ld'};
M_.endo_names_tex(2) = {'Ld'};
M_.endo_names_long(2) = {'Ld'};
M_.endo_names(3) = {'C'};
M_.endo_names_tex(3) = {'C'};
M_.endo_names_long(3) = {'C'};
M_.endo_names(4) = {'mrs'};
M_.endo_names_tex(4) = {'mrs'};
M_.endo_names_long(4) = {'mrs'};
M_.endo_names(5) = {'R'};
M_.endo_names_tex(5) = {'R'};
M_.endo_names_long(5) = {'R'};
M_.endo_names(6) = {'Pi'};
M_.endo_names_tex(6) = {'Pi'};
M_.endo_names_long(6) = {'Pi'};
M_.endo_names(7) = {'Lam'};
M_.endo_names_tex(7) = {'Lam'};
M_.endo_names_long(7) = {'Lam'};
M_.endo_names(8) = {'Pir'};
M_.endo_names_tex(8) = {'Pir'};
M_.endo_names_long(8) = {'Pir'};
M_.endo_names(9) = {'x1'};
M_.endo_names_tex(9) = {'x1'};
M_.endo_names_long(9) = {'x1'};
M_.endo_names(10) = {'x2'};
M_.endo_names_tex(10) = {'x2'};
M_.endo_names_long(10) = {'x2'};
M_.endo_names(11) = {'pw'};
M_.endo_names_tex(11) = {'pw'};
M_.endo_names_long(11) = {'pw'};
M_.endo_names(12) = {'Y'};
M_.endo_names_tex(12) = {'Y'};
M_.endo_names_long(12) = {'Y'};
M_.endo_names(13) = {'w'};
M_.endo_names_tex(13) = {'w'};
M_.endo_names_long(13) = {'w'};
M_.endo_names(14) = {'A'};
M_.endo_names_tex(14) = {'A'};
M_.endo_names_long(14) = {'A'};
M_.endo_names(15) = {'wr'};
M_.endo_names_tex(15) = {'wr'};
M_.endo_names_long(15) = {'wr'};
M_.endo_names(16) = {'f1'};
M_.endo_names_tex(16) = {'f1'};
M_.endo_names_long(16) = {'f1'};
M_.endo_names(17) = {'f2'};
M_.endo_names_tex(17) = {'f2'};
M_.endo_names_long(17) = {'f2'};
M_.endo_names(18) = {'vp'};
M_.endo_names_tex(18) = {'vp'};
M_.endo_names_long(18) = {'vp'};
M_.endo_names(19) = {'YW'};
M_.endo_names_tex(19) = {'YW'};
M_.endo_names_long(19) = {'YW'};
M_.endo_names(20) = {'vw'};
M_.endo_names_tex(20) = {'vw'};
M_.endo_names_long(20) = {'vw'};
M_.endo_names(21) = {'y'};
M_.endo_names_tex(21) = {'y'};
M_.endo_names_long(21) = {'y'};
M_.endo_names(22) = {'pi'};
M_.endo_names_tex(22) = {'pi'};
M_.endo_names_long(22) = {'pi'};
M_.endo_names(23) = {'ld'};
M_.endo_names_tex(23) = {'ld'};
M_.endo_names_long(23) = {'ld'};
M_.endo_names(24) = {'r'};
M_.endo_names_tex(24) = {'r'};
M_.endo_names_long(24) = {'r'};
M_.endo_partitions = struct();
M_.param_names = cell(13,1);
M_.param_names_tex = cell(13,1);
M_.param_names_long = cell(13,1);
M_.param_names(1) = {'beta'};
M_.param_names_tex(1) = {'beta'};
M_.param_names_long(1) = {'beta'};
M_.param_names(2) = {'epsip'};
M_.param_names_tex(2) = {'epsip'};
M_.param_names_long(2) = {'epsip'};
M_.param_names(3) = {'epsiw'};
M_.param_names_tex(3) = {'epsiw'};
M_.param_names_long(3) = {'epsiw'};
M_.param_names(4) = {'phip'};
M_.param_names_tex(4) = {'phip'};
M_.param_names_long(4) = {'phip'};
M_.param_names(5) = {'phiw'};
M_.param_names_tex(5) = {'phiw'};
M_.param_names_long(5) = {'phiw'};
M_.param_names(6) = {'sigma'};
M_.param_names_tex(6) = {'sigma'};
M_.param_names_long(6) = {'sigma'};
M_.param_names(7) = {'chi'};
M_.param_names_tex(7) = {'chi'};
M_.param_names_long(7) = {'chi'};
M_.param_names(8) = {'psi'};
M_.param_names_tex(8) = {'psi'};
M_.param_names_long(8) = {'psi'};
M_.param_names(9) = {'rhoA'};
M_.param_names_tex(9) = {'rhoA'};
M_.param_names_long(9) = {'rhoA'};
M_.param_names(10) = {'rhoR'};
M_.param_names_tex(10) = {'rhoR'};
M_.param_names_long(10) = {'rhoR'};
M_.param_names(11) = {'thetapi'};
M_.param_names_tex(11) = {'thetapi'};
M_.param_names_long(11) = {'thetapi'};
M_.param_names(12) = {'sA'};
M_.param_names_tex(12) = {'sA'};
M_.param_names_long(12) = {'sA'};
M_.param_names(13) = {'sR'};
M_.param_names_tex(13) = {'sR'};
M_.param_names_long(13) = {'sR'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 24;
M_.param_nbr = 13;
M_.orig_endo_nbr = 24;
M_.aux_vars = [];
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.linear_decomposition = false;
M_.orig_eq_nbr = 24;
M_.eq_nbr = 24;
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
 0 7 0;
 0 8 0;
 1 9 0;
 0 10 0;
 2 11 0;
 0 12 31;
 0 13 32;
 0 14 0;
 0 15 33;
 0 16 34;
 0 17 0;
 0 18 0;
 3 19 0;
 4 20 0;
 0 21 0;
 0 22 35;
 0 23 36;
 5 24 0;
 0 25 0;
 6 26 0;
 0 27 0;
 0 28 0;
 0 29 0;
 0 30 0;]';
M_.nstatic = 12;
M_.nfwrd   = 6;
M_.npred   = 6;
M_.nboth   = 0;
M_.nsfwrd   = 6;
M_.nspred   = 6;
M_.ndynamic   = 12;
M_.dynamic_tmp_nbr = [12; 4; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , '1' ;
  2 , 'name' , '2' ;
  3 , 'name' , 'Lam' ;
  4 , 'name' , 'Pir' ;
  5 , 'name' , 'x1' ;
  6 , 'name' , 'x2' ;
  7 , 'name' , 'w' ;
  8 , 'name' , 'wr' ;
  9 , 'name' , 'f1' ;
  10 , 'name' , 'f2' ;
  11 , 'name' , '11' ;
  12 , 'name' , '12' ;
  13 , 'name' , 'Y' ;
  14 , 'name' , '14' ;
  15 , 'name' , 'YW' ;
  16 , 'name' , 'L' ;
  17 , 'name' , 'vw' ;
  18 , 'name' , 'vp' ;
  19 , 'name' , '19' ;
  20 , 'name' , '20' ;
  21 , 'name' , 'y' ;
  22 , 'name' , 'pi' ;
  23 , 'name' , 'r' ;
  24 , 'name' , 'ld' ;
};
M_.mapping.L.eqidx = [1 16 ];
M_.mapping.Ld.eqidx = [9 10 15 16 24 ];
M_.mapping.C.eqidx = [1 3 13 ];
M_.mapping.mrs.eqidx = [1 9 ];
M_.mapping.R.eqidx = [2 20 23 ];
M_.mapping.Pi.eqidx = [2 5 6 9 10 11 12 17 18 20 22 ];
M_.mapping.Lam.eqidx = [2 3 5 6 9 10 ];
M_.mapping.Pir.eqidx = [4 11 18 ];
M_.mapping.x1.eqidx = [4 5 ];
M_.mapping.x2.eqidx = [4 6 ];
M_.mapping.pw.eqidx = [5 7 ];
M_.mapping.Y.eqidx = [5 6 13 14 21 ];
M_.mapping.w.eqidx = [7 9 10 12 17 ];
M_.mapping.A.eqidx = [7 15 19 ];
M_.mapping.wr.eqidx = [8 12 17 ];
M_.mapping.f1.eqidx = [8 9 ];
M_.mapping.f2.eqidx = [8 10 ];
M_.mapping.vp.eqidx = [14 18 ];
M_.mapping.YW.eqidx = [14 15 ];
M_.mapping.vw.eqidx = [16 17 ];
M_.mapping.y.eqidx = [21 ];
M_.mapping.pi.eqidx = [22 ];
M_.mapping.ld.eqidx = [24 ];
M_.mapping.r.eqidx = [23 ];
M_.mapping.eA.eqidx = [19 ];
M_.mapping.eR.eqidx = [20 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [3 5 13 14 18 20 ];
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(24, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(13, 1);
M_.endo_trends = struct('deflator', cell(24, 1), 'log_deflator', cell(24, 1), 'growth_factor', cell(24, 1), 'log_growth_factor', cell(24, 1));
M_.NNZDerivatives = [84; -1; -1; ];
M_.static_tmp_nbr = [8; 7; 0; 0; ];
load param_dnk_wage;
set_param_value('beta',beta);
set_param_value('epsip',epsip);
set_param_value('epsiw',epsiw);
set_param_value('sigma',sigma);
set_param_value('chi',chi);
set_param_value('psi',psi);
set_param_value('phip',phip);
set_param_value('phiw',phiw);
set_param_value('thetapi',thetapi);
set_param_value('rhoA',rhoA);
set_param_value('rhoR',rhoR);
set_param_value('sA',sA);
set_param_value('sR',sR);
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(14) = 1;
oo_.steady_state(1) = 1;
oo_.steady_state(2) = 1;
oo_.steady_state(11) = (M_.params(2)-1)/M_.params(2);
oo_.steady_state(13) = (M_.params(2)-1)/M_.params(2);
oo_.steady_state(4) = (M_.params(2)-1)*(M_.params(3)-1)/M_.params(3)/M_.params(2);
oo_.steady_state(12) = 1;
oo_.steady_state(3) = 1;
oo_.steady_state(5) = 1/M_.params(1);
oo_.steady_state(7) = M_.params(1);
oo_.steady_state(18) = 1;
oo_.steady_state(20) = 1;
oo_.steady_state(6) = 1;
oo_.steady_state(8) = 1;
oo_.steady_state(15) = (M_.params(2)-1)/M_.params(2);
oo_.steady_state(19) = 1;
oo_.steady_state(9) = (M_.params(2)-1)/M_.params(2)/(1-M_.params(1)*M_.params(4));
oo_.steady_state(10) = 1/(1-M_.params(1)*M_.params(4));
oo_.steady_state(16) = (M_.params(2)-1)*(M_.params(3)-1)/M_.params(3)/M_.params(2)*((M_.params(2)-1)/M_.params(2))^M_.params(3)/(1-M_.params(1)*M_.params(5));
oo_.steady_state(17) = ((M_.params(2)-1)/M_.params(2))^M_.params(3)/(1-M_.params(1)*M_.params(5));
oo_.steady_state(21) = 0;
oo_.steady_state(22) = 0;
oo_.steady_state(24) = 0;
oo_.steady_state(23) = 0;
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
M_.Sigma_e(2, 2) = 1;
options_.ar = 1;
options_.irf = 20;
options_.nograph = true;
options_.order = 1;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
save('dnk_wage_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('dnk_wage_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('dnk_wage_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('dnk_wage_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('dnk_wage_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('dnk_wage_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('dnk_wage_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
disp('Note: 1 warning(s) encountered in the preprocessor')
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
