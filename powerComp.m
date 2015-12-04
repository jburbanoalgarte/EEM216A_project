clear; clc; close all;

vdd_and_tp = load('vdd_and_tp_curve.mat');
vdd = vdd_and_tp.vdd;
tp = vdd_and_tp.tp;

plot(tp,vdd,'bo-'); grid;
%% propose a frequency, locate corresponding voltage

f_proposed=150E6;
Tclk_proposed = 1/f_proposed

VDD_nominal = 0.95;

f_scaled = 6.144E6;

f_proposed/f_scaled
f_proposed/f_scaled*1.403E-11

%% finalize the proposed freq, scaled VDD
% run synthesis
% nohup dc_shell -output_log_file NLC_opt.log -f NLC_opt.tcl &
% enter power results, look at scaled power

Tclk_nominal = [60 10 6.7]*10^(-9);
f_nominal = 1./Tclk_nominal;

VDD_scaled = [0.613 0.418 .390];

P_sw_nominal=[81.772 489.914 299.533]*10^(-6);
P_sc_nominal=[344.898 2.08e+03 9.64e+03]*10^(-6);
P_leak_nominal=[3.10e+11 3.10e+11 3.05e+11]*10^(-12);

P_sw_scaled=P_sw_nominal.*f_scaled./f_nominal.*(VDD_scaled/VDD_nominal).^2;

P_sc_scaled=P_sc_nominal.*f_scaled./f_nominal.*VDD_scaled/VDD_nominal;

P_leak_scaled=P_leak_nominal.*VDD_scaled/VDD_nominal;

P_scaled = P_sw_scaled + P_sc_scaled + P_leak_scaled