%% Simulate RBC from iris

%% get paths
addpath C:\IRIS_Tbx;
iris.startup;

%% Clear workspace
clear; close all; clc;

%% load the model
m = Model('rbc.model');

%% Parameters
m.beta = 0.99;
m.gamma = 0.5;
m.delta = 0.03;
m.rho = 0.8;
m.a = 0.1;

%% Compute the steady state
m = sstate(m);
chksstate(m);

%% First order solution
m = solve(m);

%% begin simulation
d = sstatedb(m, 1:40)
d.ea(1) = 0.1;
d.ea{1:5}

%% Simulate model response to the shock
s = simulate(m, d, 1:40, 'AppendPresample=', true)

%% Plot
dbplot(s, 0:40, ...
    {'Y', 'C', 'K', 'A', '400*r'}, ...
    'ZeroLine=', true);
