function [Gc]=compensador_lr(G, Kc, zeta, Wn)
    r1=complex(-zeta*Wn, Wn*sqrt(1-zeta^2));

    [Ms theta_s]=polar(r1);
    [Mg theta_g]=polar(horner(G, r1));
    
    Ms=real(Ms);
    theta_s=real(theta_s);
    Mg=real(Mg);
    theta_g=real(theta_g);    

    Tz=(sin(theta_s)-Kc*Mg*sin(theta_g-theta_s))/(Kc*Mg*Ms*sin(theta_g));
    Tp=-(Kc*Mg*sin(theta_s)+sin(theta_g+theta_s))/(Ms*sin(theta_g)); 

    Gc=Kc*(Tz*s+1)/(Tp*s+1);
    
    disp("Compensador lugar das raizes");    
    disp("Tz", Tz);
    disp("Tp", Tp);    
endfunction
