//funciona

// Current system
s=%s;
numG=1;
denG= (0.1*s+1)*(0.2*s+1);

// Desired parameters
ess=0.01;
omega= 100;
zeta= 0.707;


// Calculate parameter
clc();
pi= %pi;
G= syslin('c',numG,denG);
H= 1;
FTMF= G/.H;
Kc = (1-ess)/(10*ess);
disp(Kc, 'Kc= ');

//S1
s1= -(zeta*omega)+((omega*(1-zeta^2)^0.5)*%i);
[mS,tetaS]= polar(s1);
tetaS= real(tetaS);
Gs1= horner((G*H), s1);
[mG,tetaG]=polar(Gs1);
tetaG= real(tetaG);
disp((180*tetaS/pi), 'tetaS= ',mS, 'mS= ');
disp((180*tetaG/pi), 'tetaG= ',mG, 'mG= ');

// Polo e zero
Tz= real((sin(tetaS)-(Kc*mG*sin(tetaG-tetaS)))/(Kc*mG*mS*sin(tetaG)));
Tp= real(-((Kc*mG*sin(tetaS))+(sin(tetaG+tetaS)))/(mS*sin(tetaG)));
disp(Tp,'Tp [s]= ',Tz,'Tz [s]= ');

// Plot system
numC= Kc*(Tz*s+1);
denC= (Tp*s+1);
Gc= syslin('c',numC,denC);
FTMFc= (Gc*G)/.H;
figure(1);
clf(1);
t= 0:0.002:2;
step=csim('step',t,FTMF);
step2=csim('step',t,FTMFc);



