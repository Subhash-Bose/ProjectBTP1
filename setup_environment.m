clear all;
close all;

alpha=cosd(120)+1i*sind(120);

% Source Modelling
Va_S=11e3;                  %Ph-Ph voltage
f=50;                       %frequency in Hz
S_S=58e6;
XR_S=10;

z_s=0.2076+1i*2.0759;
Z_S=diag([z_s z_s z_s]);
V_S=[Va_S Va_S.*alpha Va_S.*alpha.^2]';

% Line Modelling

z=[[0.4013+1i*1.4133 0.0953+1i*0.8515 0.0953+1i*0.7266]
   [0.0953+1i*0.8515 0.4013+1i*1.4133 0.0953+1i*0.7802]
   [0.0953+1i*0.7266 0.0953+1i*0.7802 0.4013+1i*1.4133]];

%Line 0-1
l1=3;
Z_01=z*l1;
R_01=real(Z_01);
X_01=imag(Z_01);
L_01=X_01/(2*pi*f);

% Line 1-2
l2=3.5;
Z_12=z*l2;
R_12=real(Z_12);
X_12=imag(Z_12);
L_12=X_12/(2*pi*f);

% Line 2-3
l3=1.8;
Z_23=z*l3;
R_23=real(Z_23);
X_23=imag(Z_23);
L_23=X_23/(2*pi*f);

%Load L1 Modelling
Va_L1=Va_S;                   %Line Voltage
P_L1=100000;                %Real Power
pf_L1=0.9;                  %Load power factor
Q_L1=reactive(P_L1,pf_L1);  %Reactive Power

%Load L2 Modelling
Va_L2=Va_S;                   %Line Voltage
P_L2=50000;                 %Real Power
pf_L2=0.9;                  %Load power factor
Q_L2=reactive(P_L2,pf_L2);  %Reactive Power

%Load L3 Modelling
Va_L3=Va_S;                   %Line Voltage
P_L3=80000;                 %Real Power
pf_L3=0.9;                  %Load power factor
Q_L3=reactive(P_L3,pf_L3);  %Reactive Power


%Fault Modeling
m_actual=0.2;
l1_1=m_actual*l1;
R_011=m_actual*R_01;
L_011=m_actual*L_01;

l1_2=(1-m_actual)*l1;
R_012=(1-m_actual)*R_01;
L_012=(1-m_actual)*L_01;

