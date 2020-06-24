%% Programa que simula e resolve um modelo RBC simples 

%  Autor: Gustavo Vital
%  Data: 23/06/2020

clear; clc;
%% resolve a equação não linear
global sigma varpi alpha beta delta;

sigma = 2;
varpi = 1.5;
alpha = 0.35;
beta = 0.985;
delta = 0.025;

options = optimoptions('fsolve','Display','iter');
x0 = [0.5,0.5,0.5,0.5,0.5,0.5,0.5];
fun = @solveState;

F = fsolve(fun, x0, options);

%% Cria as variaveis do modelo
c = F(1);
l = F(2);
w = F(3);
r = F(4);
i = F(5);
k = F(6);
y = F(7);

%% Inicia o Dynare
addpath C:\dynare\4.6.1\matlab

%% Resolve o modelo
dynare dsge