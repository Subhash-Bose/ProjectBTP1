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

% Z_SR=Z12;
% Z_4R=Z_L4;
% Z_3R=inv(inv(Z34+Z_4R)+inv(Z_L3));
% Z_2R=inv(inv(Z23+Z_3R)+inv(Z_L2));
% Z_R=Z_2R;
% 
% Vs=Vs-Z01*I2;
% I2=I2-inv(Z_L1)*Vs;
% 
% Iff=((1-m)*Z_SR+Z_R)*inv((1-m)*Z_SR+Z_R+Rf)*I2;
% m=imag(Iff'*Vs)/imag(Iff'*Z_SR*I2)
% return;
%Check for fault in 2-3
% Z_SR=Z23;
% Z_4R=Z_L4;
% Z_3R=inv(inv(Z34+Z_4R)+inv(Z_L3));
% Z_R=Z_3R;
% Vs=Vs-Z01*I2;
% I2=I2-inv(Z_L1)*Vs;
% 
% Vs=Vs-Z12*I2;
% I2=I2-inv(Z_L2)*Vs;
% 
% 
% Iff=((1-m)*Z_SR+Z_R)*inv((1-m)*Z_SR+Z_R+Rf)*I2;
% m=imag(Iff'*Vs)/imag(Iff'*Z_SR*I2)
% return;

Z_SRR=[Z01 Z12 Z23 Z34];
Z_SRR=reshape(Z_SRR,[3 3 4]);
Z_RR=[Z_1R Z_2R Z_3R Z_4R];
Z_RR=reshape(Z_RR,[3 3 4]);
Z_L=[Z_L1 Z_L2 Z_L3 Z_L4];
Z_L=reshape(Z_L,[3 3 4]);
len=[l1,l2,l3,l4];

for i=1:4
    
    if(i==1 || m>1 || m<0 )
        if(i==1)
            Z_SR=Z_SRR(:,:,i);
            Z_R=Z_RR(:,:,i);
        else
            Vs=Vs-Z_SR*I2;
            
            
            I2=I2-inv(Z_L(:,:,i-1))*Vs;
            
            
            Z_SR=Z_SRR(:,:,i);
            Z_R=Z_RR(:,:,i);
        end
        % i
        % Z_SR
        % Z_R
        % I2
        for j=1:10
            
            Iff=((1-m)*Z_SR+Z_R)*inv((1-m)*Z_SR+Z_R+Rf)*I2;
            % Iff=Isp;
            m=imag(Iff'*Vs)/imag(Iff'*Z_SR*I2);
        end
        
    end
    if(m<1&& m>0)
        disp("Fault Has Occured in Line "+(i-1)+"-"+i+" at a distance of "+(m*len(i)));
        disp("Calculated Value of m is "+m);
        break;
    end
end





