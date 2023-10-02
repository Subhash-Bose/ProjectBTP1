
If_pre_0=[out.Ia_0.signals.values(26,1) out.Ib_0.signals.values(26,1) out.Ic_0.signals.values(26,1)]';
If_post_0=[out.Ia_0.signals.values(27,1) out.Ib_0.signals.values(27,1) out.Ic_0.signals.values(27,1)]';

If_pure_0=If_post_0-If_pre_0;

Z_0S=Z_S;

Z_SR=Z_01;
Z_1R=Z_12+Z_23;

m=0.2;
for k=1:5

    Dm=(Z_0S+Z_SR+Z_1R)/((1-m)*Z_SR+Z_1R);

    If=Dm*If_pure_0;

    m=imag((conj(If)')*V_S)./imag((conj(If)')*Z_SR*If_post_0)

end

