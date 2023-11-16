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

Rf=diag([0.0001 0.0001 0.0001]);

z=diag([r+1j*xl r+1j*xl r+1j*xl]);

% Line 01
l1=3;
Z01=z*l1;

% Load 1
pf_L1=1;
P_L1=10e3;
Q_L1=reactive(P_L1,pf_L1);
Z_L1=V_S.*V_S/(P_L1-1i*Q_L1);
Z_L1=diag([Z_L1 Z_L1 Z_L1]);

% Line 12
l2=5;
Z12=z*l2;

% Load 2
pf_L2=1;
P_L2=8e3;
Q_L2=reactive(P_L2,pf_L2);
Z_L2=V_S.*V_S/(P_L2-1i*Q_L2);
Z_L2=diag([Z_L2 Z_L2 Z_L2]);

% Line 23
l3=8;
Z23=z*l3;

% Load 3
pf_L3=1;
P_L3=15e3;
Q_L3=reactive(P_L3, pf_L3);
Z_L3=V_S.*V_S/(P_L3-1i*Q_L3);
Z_L3=diag([Z_L3 Z_L3 Z_L3]);


m_actual=0.4;

out=sim("test.slx");
clc;
run("test_calc.m");
