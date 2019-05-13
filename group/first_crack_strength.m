function K = first_crack_strength(Ktip,tau)
    Vf = 0.02;
    Vm = 0.98;
    Ef = 18;
    Em = 20;
    Ec = 20;
    Lf = 12;
    Df = 0.039;
    f = 0.5;
    v = 0.2;

    eta = Vf*Ef/(Vm*Em);
    eta1Ef = (eta+1)*Ef;
    Lfdf = Lf/Df;
    g = 2/(4+f^2)*(1+2.71828^(pi*f/2));
    C0 = (Lf*Ec/2/Ktip)^2*pi/(16*(1-v^2)^2);
    delta_star = 2*tau/eta1Ef*Lfdf/1000;
    k = C0^-0.5*delta_star^-1*1000^-0.5;
    sigma0 = Vf*tau*Lfdf/2;
    K_ = Ktip/sigma0/C0^0.5/g/delta_star;

    K=zeros(1,3);
    K(1) = g*3.1415^0.5/2*K_*k^-1;
    K(2) = g*4/3*k^0.5;
    K(3) = g*-0.5*k;
end

