//funciona ok !

zeta=0.5
omega=13.5
kc=5

s1= -(zeta*omega)+((omega*(1-zeta^2)^0.5)*%i);
[mS,tetaS]= polar(s1);
tetaS= real(tetaS);
Gs1= horner((G*H), s1);
[mG,tetaG]=polar(Gs1);
tetaG= real(tetaG);
disp((180*tetaS/pi), 'tetaS= ',mS, 'mS= ');
disp((180*tetaG/pi), 'tetaG= ',mG, 'mG= ');

Tz= real((sin(tetaS)-kc*mG*sin(tetaG-tetaS))/(kc*mG*mS*sin(tetaG)))
Tp= real(-((kc*mG*sin(tetaS)+sin(tetaG+tetaS))/(mS*sin(tetaG))))
disp(Tp,'Tp [s]= ',Tz,'Tz [s]= ');




