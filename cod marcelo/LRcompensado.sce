clc();
//funciona lr
s= %s;
pi= %pi;
Kv= 20; //colocar########
numG= (s+10); //colocar########
denG= (s^2+2*s+2); //colocar########
G= syslin('c',numG,denG); H= 1;
FTMF= G/.H;
 Kc= horner((Kp/(G*H)), 0);
//Kc= horner((Kv/(s*G*H)), 0); 
 //Kv=s*[Kc.GH(0)]; 
disp(Kc, 'Kc= ');
omega= 5.7; //colocar########
zeta= 0.707; //colocar########
s1= -(zeta*omega)+((omega*(1-zeta^2)^0.5)*%i);
disp('alfaT [s]= ',s1);
[mS,tetaS]= polar(s1);
tetaS= real(tetaS);
Gs1= horner((G*H), s1); [mG,tetaG]=polar(Gs1);
tetaG= real(tetaG);
disp((180*tetaS/pi), 'tetaS= ',mS, 'mS= '); disp((180*tetaG/pi), 'tetaG= ',mG, 'mG= ');
Tz= real((sin(tetaS)-(Kc*mG*sin(tetaG-tetaS)))/(Kc*mG*mS*sin(tetaG))); Tp= real(-((Kc*mG*sin(tetaS))+(sin(tetaG+tetaS)))/(mS*sin(tetaG))); disp(Tp,'Tp [s]= ',Tz,'Tz [s]= ');
numC= Kc*(Tz*s+1);
denC= (Tp*s+1);
Gc= syslin('c',numC,denC); FTMFc= (Gc*G)/.H;
figure(1);
clf(1);
t= 0:0.002:2; step=csim('step',t,FTMF); step2=csim('step',t,FTMFc); plot(t,step,'b-',t,step2,'m-'); xgrid(33);
figure(2); clf(2); evans(G*H,100); xgrid(33);
figure(3); clf(3); evans(Gc*G*H,10); xgrid(33);
