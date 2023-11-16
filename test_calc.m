clc;
Ia1=out.Ia_0.signals.values(26,1);
Ib1=out.Ib_0.signals.values(26,1);
Ic1=out.Ic_0.signals.values(26,1);

I1=transpose([Ia1 Ib1 Ic1]);

Ia2=out.Ia_0.signals.values(27,1);
Ib2=out.Ib_0.signals.values(27,1);
Ic2=out.Ic_0.signals.values(27,1);

I2=transpose([Ia2 Ib2 Ic2]);

Va=out.Va_0(1,1);
Vb=out.Vb_0.signals.values(1,1);
Vc=out.Vc_0.signals.values(1,1);

Vs=transpose([Va Vb Vc]);


Isp=I2-I1;

Z_0S=Z_S;
Z_1S=inv(inv(Z_0S+Z01)+inv(Z_L1));
Z_1R=inv(inv(Z_L2+Z12)+inv(Z_L1));
Z_2R=Z_L2;

Z_SR=Z01;      
Z_R=Z_2R;

m=0.5;
If=Isp;
% If=(((1-m)*Z_SR+Z_R)*inv((1-m)*Z_SR+Z_R+Rf))*Isp;


m=imag(If'*Vs)/imag(If'*Z_SR*If)
count=0;

% if(m>1)
%     Vs=Vs-Z01*If;
%     If=If-inv(Z_L1)*Vs;
%     Z_SR=Z12;
%     m=imag(If'*Vs)/imag(If'*Z_SR*If)
% end




