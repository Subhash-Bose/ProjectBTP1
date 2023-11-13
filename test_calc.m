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

r=0.4;
l=0.4e-6;
xl=2*pi*50*l;

z=diag([r+1j*xl r+1j*xl r+1j*xl]);

Z=z*L;
Zr=diag([12100 12100 12100]);
rf=diag([0.0001 0.0001 0.0001]);

Isp=I2-I1;

m=0.8;

If=(((1-m)*Z+Zr)*inv((1-m)*Z+Zr+rf))*Isp;

m=imag(If'*Vs)/imag(If'*Z*If)

