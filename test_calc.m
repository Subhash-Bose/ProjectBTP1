clc;
Ia1=out.Ia_0.signals.values(26,1);
Ib1=out.Ib_0.signals.values(26,1);
Ic1=out.Ic_0.signals.values(26,1);

I1=transpose([Ia1 Ib1 Ic1])/sqrt(2);

Ia2=out.Ia_0.signals.values(27,1);
Ib2=out.Ib_0.signals.values(27,1);
Ic2=out.Ic_0.signals.values(27,1);

I2=transpose([Ia2 Ib2 Ic2])/sqrt(2);

If1=transpose(out.If1.signals.values(27,:))/sqrt(2);
Vf1=transpose(out.Vf1.signals.values(27,:))/sqrt(2);

If2=transpose(out.If2.signals.values(27,:))/sqrt(2);
Vf2=transpose(out.Vf2.signals.values(27,:))/sqrt(2);

If3=transpose(out.If3.signals.values(25,:))/sqrt(2);
Vf3=transpose(out.Vf3.signals.values(25,:))/sqrt(2);

Va=out.Va_0(1,1);
Vb=out.Vb_0.signals.values(1,1);
Vc=out.Vc_0.signals.values(1,1);

Vs=transpose([Va Vb Vc])/sqrt(2);


Isp=I2-I1;

Z_4R=Z_L4;
Z_3R=inv(inv(Z34+Z_4R)+inv(Z_L3));
Z_2R=inv(inv(Z23+Z_3R)+inv(Z_L2));
Z_1R=inv(inv(Z12+Z_2R)+inv(Z_L1));


m=0.5;
% If=Isp;
% If=inv((1-m)*Z_SR+Z_R+Rf)*((1-m)*Z_SR+Z_R)*Isp;


Z_SRR=[Z01 Z12 Z23 Z34];
Z_SRR=reshape(Z_SRR,[3 3 4]);
Z_RR=[Z_1R Z_2R Z_3R Z_4R];
Z_RR=reshape(Z_RR,[3 3 4]);
Z_L=[Z_L1 Z_L2 Z_L3 Z_L4];
Z_L=reshape(Z_L,[3 3 4]);
len=[l1,l2,l3,l4];

Iff=Isp;
Z_SR=Z01;
Z_R=Z_L1;
Iff=inv((1-m)*Z_SR+Z_R+Rf)*((1-m)*Z_SR+Z_R)*I2;
m=imag(Iff'*Vs)/imag(Iff'*Z_SR*I2)

% power=3*transpose(Vf3)*conj(If3)
% abs(power)
% zzz=Vf3./If3
% pf=cos(atan(imag(zzz(1))/real(zzz(1))))
return
% 
% Vs=Vs-Z_SR*Isp;
% Isp=Isp-inv(Z_L(1))*Vs;Iff=Isp;
% Z_SR=Z_SRR(:,:,2);
% Z_R=Z_RR(:,:,2);
% Z_SRR(2)
% 
% Z_SR
% m=imag(Iff'*Vs)/imag(Iff'*Z_SR*Iff)
% return
for i=1:4
    
    if(i==1 || m>1 )
        if(i==1)
            Z_SR=Z_SRR(:,:,i);
            Z_R=Z_RR(:,:,i);
        else
            Vs=Vs-Z_SR*Isp;
            
            
            Isp=Isp-inv(Z_L(:,:,i-1))*Vs;
            
            
            Z_SR=Z_SRR(:,:,i);
            Z_R=Z_RR(:,:,i);
        end
        for j=1:10

            Iff=inv((1-m)*Z_SR+Z_R)*((1-m)*Z_SR+Z_R+Rf)*Isp;
            % Iff=Isp;
            m=imag(Iff'*Vs)/imag(Iff'*Z_SR*Iff);
        end
    end
    if(m<1)
        disp("Fault Has Occured in Line "+(i-1)+"-"+i+" at a distance of "+(m*l(i)));
        disp("Calculated Value of m is "+m);
        break;
    end
end





