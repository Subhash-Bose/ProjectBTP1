clear all;

% r=[[0.4 0 0];[0 0.4 0];[0 0 0.4]];
% l=[[1.5 0 0]; [0 1.5 0];[0 0 1.5]];
% c=[[10e-12 0 0]; [0 10e-12 0]; [0 0 10e-12]];
% z=[
%     [0.4013+1i*1.4133 0.0953+1i*0.8515 0.0953+1i*0.7266]
%     [0.0953+1i*0.8515 0.4013+1i*1.4133 0.0953+1i*0.7802]
%     [0.0953+1i*0.7266 0.0953+1i*0.7802 0.4013+1i*1.4133]
%     ];

V_S=11e3;
f=50;
R_S=0.8929;
L_S=16.58e-3;

X_S=2*pi*f*L_S;

Z_S=diag([R_S+1i*X_S R_S+1i*X_S R_S+1i*X_S]);



r=0.4;
l=0.4e-6;
xl=2*pi*50*l;

rf=10;

Rf=diag([rf rf rf]);

z=diag([r+1j*xl r+1j*xl r+1j*xl]);

% Line 01
l1=3;
Z01=z*l1;

% Load 1
pf_L1=0.9;
P_L1=130e3;
Q_L1=reactive(P_L1,pf_L1);
Z_L1=3*V_S.*V_S/(P_L1-1i*Q_L1);
r_L1=real(Z_L1);
l_L1=imag(Z_L1)/(2*pi*f);
Z_L1=diag([Z_L1 Z_L1 Z_L1]);

% Line 12
l2=5;
Z12=z*l2;

% Load 2
pf_L2=0.85;
P_L2=80e3;
Q_L2=reactive(P_L2,pf_L2);
Z_L2=3*V_S.*V_S/(P_L2-1i*Q_L2);
r_L2=real(Z_L2);
l_L2=imag(Z_L2)/(2*pi*f);
Z_L2=diag([Z_L2 Z_L2 Z_L2]);

% Line 23
l3=8;
Z23=z*l3;

% Load 3
pf_L3=0.8;
P_L3=120e3;
Q_L3=reactive(P_L3, pf_L3);
Z_L3=3*V_S.*V_S/(P_L3-1i*Q_L3);
r_L3=real(Z_L3);
l_L3=imag(Z_L3)/(2*pi*f);
Z_L3=diag([Z_L3 Z_L3 Z_L3]);

% Line 34
l4=15;
Z34=z*l4;

%Load 4
pf_L4=0.75;
P_L4=200e3;
Q_L4=reactive(P_L4,pf_L4);
Z_L4=3*V_S.*V_S/(P_L4-1i*Q_L4);
r_L4=real(Z_L4);
l_L4=imag(Z_L4)/(2*pi*f);
Z_L4=diag([Z_L4 Z_L4 Z_L4]);


% Fault Simulation Details
m_actual=0.2;
fault=4;

trigger=[0 0 0 0];
trigger(fault)=1;



out=sim("test.slx");
clc;
run("test_calc.m");
