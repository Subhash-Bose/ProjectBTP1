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

z_L=[[0.4013+1i*1.4133 0.0953+1i*0.8515 0.0953+1i*0.7266]
   [0.0953+1i*0.8515 0.4013+1i*1.4133 0.0953+1i*0.7802]
   [0.0953+1i*0.7266 0.0953+1i*0.7802 0.4013+1i*1.4133]];
r_L=real(z_L);
x_L=imag(z_L);
l_L=x_L/(2*pi*f);
c_L=[[12.74e-9 3.74e-9 3.74e-9]
    [3.74e-9 12.74e-9 3.74e-9]
    [3.74e-9 3.74e-9 12.74e-9]];

%Line 0-1
l1=3;

% Line 1-2
l2=3.5;

% Line 2-3
l3=1.8;

%Load L1 Modelling
Va_L1=Va_S;                   %Line Voltage
P_L1=100000;                %Real Power
pf_L1=0.9;                  %Load power factor
Q_L1=reactive(P_L1,pf_L1);  %Reactive Power
Z_L1=Va_L1^2/(P_L1-1i*Q_L1);

Z_L1=diag([Z_L1 Z_L1 Z_L1]);
Y_L1=inv(Z_L1);

%Load L2 Modelling
Va_L2=Va_S;                   %Line Voltage
P_L2=50000*3;                 %Real Power
pf_L2=0.9;                  %Load power factor
Q_L2=reactive(P_L2,pf_L2);  %Reactive Power
Z_L2=Va_L2^2/(P_L2-1i*Q_L2);

Z_L2=diag([Z_L2 Z_L2 Z_L2]);
Y_L2=inv(Z_L2);

%Load L3 Modelling
Va_L3=Va_S;                   %Line Voltage
P_L3=80000;                 %Real Power
pf_L3=0.9;                  %Load power factor
Q_L3=reactive(P_L3,pf_L3);  %Reactive Power
Z_L3=Va_L3^2/(P_L3-1i*Q_L3);

Z_L3=diag([Z_L3 Z_L3 Z_L3]);
Y_L3=inv(Z_L3);


%Fault Modeling
m_actual=0.2;
l1_1=m_actual*l1;

l1_2=(1-m_actual)*l1;

