% Programa para simular um choque tecnologico negativo de acordo com o 
% exercicio 3 do primeiro TPC (2021)
% 
% Matéria: ciclos economicos
% Autor: gustavo de Oliveira
% Data: 20/4/2021

clear; clc;
%% Inicia o Dynare
addpath C:\dynare\4.6.1\matlab

%% Resolve o modelo
dynare model

%% Graficos

figure 
subplot(3,3,1)
plot(b_eb,'LineWidth',2)
yline(0, 'r', 'LineWidth',1)
title("Tecnologia")
grid minor 

subplot(3,3,2)
plot(c_eb,'LineWidth',2)
yline(0, 'r', 'LineWidth',1)
title("Consumo")
grid minor 

subplot(3,3,3)
plot(i_eb,'LineWidth',2)
yline(0, 'r', 'LineWidth',1)
title("Investimento")
grid minor 

subplot(3,3,4)
plot(k_eb,'LineWidth',2)
yline(0, 'r', 'LineWidth',1)
title("Capital")
grid minor 

subplot(3,3,5)
plot(l_eb,'LineWidth',2)
title("Lazer")
grid minor 

subplot(3,3,6)
plot(n_eb,'LineWidth',2)
yline(0, 'r', 'LineWidth',1)
title("Trabalho")
grid minor 

subplot(3,3,7)
plot(r_eb,'LineWidth',2)
yline(0, 'r', 'LineWidth',1)
title("Juros")
grid minor 

subplot(3,3,8)
plot(w_eb,'LineWidth',2)
yline(0, 'r', 'LineWidth',1)
title("Salário")
grid minor 

subplot(3,3,9)
plot(y_eb,'LineWidth',2)
yline(0, 'r', 'LineWidth',1)
title("Produção")
grid minor 

% sgtitle('Comportamento dos Fatores da Economia dado um Choque Tecnológico Negativo') 










