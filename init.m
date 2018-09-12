%% LOAD VEHICLE MODEL:
%+++++++++++++++++++++
vehicle_IC125
radius=0.4064;
%% LOAD INPUT FILES:
%+++++++++++++++++++
load route_KingsX_NewC_KingsX.mat
load gradient_prof_interp_spline_matrix_kx
%% Battery Pack Specs
%++++++++++++++++++++
V = 400;    %Pack Voltage
Capacity = 100; %Pack Capacity (Ah)
% Cell Specs
V_cell = 3.7;   %rated cell voltage (V)
Ah_cell = 6.5;  %rated cell capacity (Ah)
% Pack Calculations
Nb_ser_cells = round ( V / V_cell );  %number of cells in series
Nb_par_cells = round ( Capacity / Ah_cell );  %number of parallel branches
%% Boost Converter Component Sizing
%++++++++++++++++++++++++++++++++++
Vin_boost = 400;          % Input Voltage
Vout_boost = 1500;
D_boost = 1 - ( Vin_boost / Vout_boost);
Rout_boost = 0.047515;
%Rout_boost = 0.28e-3*Nb_ser_Caps/(Nb_par_Caps/8):0.01:1;          % Supercapacitor Resistance
%C_boost = (3400/Nb_ser_Caps)*(Nb_par_Caps/8);   % Supercapacitor Capacitance
delta_Vout = 50;
%fs_boost = 1000;
delta_iL = 50;
fs_boost = 100;
% Calculations:
Iout_boost = Vout_boost ./ Rout_boost;
%fs_boost = ( Vin_boost * ( Vout_boost - Vin_boost ) ) / ( Vout_boost * L_boost * delta_iL )
L_boost = ( Vin_boost * ( Vout_boost - Vin_boost ) ) / ( Vout_boost * delta_iL * fs_boost );
C_boost = ( Iout_boost * D_boost )/ ( fs_boost * delta_Vout  );   % Output Voltage Ripple
%% Buck Converter Component Sizing
%+++++++++++++++++++++++++++++++++
Vin = 1500;          % Input Voltage
D = 0.5;            % Duty Cycle
delta_iL = 1;       % Inductor Ripple
fs = 100;            % Switching Frequency
Rout = 0.02998;          % Load Resistance
delta_Vout = 1;     % Output Voltage Ripple
% Calculations:
Vout = D * Vin;
Iout = Vout / Rout;
L = ( Vout * ( Vin - Vout ) ) / ( Vin * fs * delta_iL );
C = ( Vout * ( 1 - D ) )/ ( 8 * L * fs^2 * delta_Vout );