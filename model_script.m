clear all;
close all;

% Source Modelling
V_S=11000;                  %Ph-Ph voltage
f=50;                       %frequency in Hz
R_S=0.8913;
L_S=16E-3;



%Line Modelling
r=0.4013;                   %Ohms resistance per Km
x=1.413;                   %Ohms reactance per Km
l=x./(2*pi*f);              %Inductance in H per Km

%Modelling 0-1 Feeder line
l1=3;                       %line length in Km
R_01=r.*l1;                 %Line resistance in Ohms
L_01=l.*l1;                 %Line inductance in H

%Modelling 1-2 Feeder line
l2=3.5;                     %line length in Km
R_12=r.*l2;                 %Line resistance in Ohms
L_12=l.*l2;                 %Line inductance in H

%Modelling 2-3 Feeder line
l3=1.8;                     %line length in Km
R_23=r.*l3;                 %Line resistance in Ohms
L_23=l.*l3;                 %Line inductance in H

%Load L1 Modelling
V_L1=V_S;                   %Line Voltage
P_L1=100000;                %Real Power
pf_L1=0.9;                  %Load power factor
Q_L1=reactive(P_L1,pf_L1);  %Reactive Power

%Load L2 Modelling
V_L2=V_S;                   %Line Voltage
P_L2=50000;                 %Real Power
pf_L2=0.9;                  %Load power factor
Q_L2=reactive(P_L2,pf_L2);  %Reactive Power

%Load L3 Modelling
V_L3=V_S;                   %Line Voltage
P_L3=80000;                 %Real Power
pf_L3=0.9;                  %Load power factor
Q_L3=reactive(P_L3,pf_L3);  %Reactive Power


% Fault Modelling
m_actual=0.2;
R_01_1=r.*l1.*m_actual;     %Line resistance in Ohms
L_01_1=l.*l1.*m_actual;     %Line inductance in H

R_01_2=r.*l1.*(1-m_actual); %Line resistance in Ohms
L_01_2=l.*l1.*(1-m_actual); %Line inductance in H
