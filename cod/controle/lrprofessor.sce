clc();
s= %s;
pi= %pi;
Kv= 10;
numG= 400; // colocar########################
denG= s*(s^2+30*s+200); // colocar########################
G= syslin('c',numG,denG);
H= 1;
FTMF= G/.H;
// Kc= horner((Kp/(G*H)), 0);   // Kp= Kc.GH(0)
Kc= horner((Kv/(s*G*H)), 0); // Kv=s*[Kc.GH(0)]
disp(Kc, 'Kc= ');


s=%s
Tz=0.027; // colocar########################
Tp=0.106; // colocar########################





numC= Kc*(Tz*s+1);
denC= (Tp*s+1);
Gc= syslin('c',numC,denC);
FTMFc= (Gc*G)/.H;
figure(1);
clf(1);
t= 0:0.002:2;
step=csim('step',t,FTMF);
step2=csim('step',t,FTMFc);
plot(t,step,t,step2);
xgrid(33);
figure(2);
clf(2);
evans(G*H,100);
xgrid(33);
figure(3);
clf(3);
evans(Gc*G*H,100);
xgrid(33);
