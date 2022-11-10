//------------------------------- TOP
s= %s;
Tz=2.7823204
Tp=0.4516098
Kc=1.9
num=Kc*(Tz*s+1)*(s+10);
den= (Tp*s+1)*(s^2 + 2*s + 1);
FTMA= syslin('c', num/den);

H= 1;
FTMF= FTMA/.H;
t= linspace(0,6,1001);
step0= csim('step',t,FTMF);
//------------------------------- ORIGIAL
numG=s+10;
denG= s^2 + 2*s + 1;
G= syslin('c',numG,denG);
H= 1;
FTMF= G/.H;
step1= csim('step',t,FTMF);
//------------------------------- O=so proporcional
numG=1.9*(s+10);
denG= s^2 + 2*s + 1;
G= syslin('c',numG,denG);
H= 1;
FTMF= G/.H;
step2= csim('step',t,FTMF);

//-------------------------------
plot(t,step0,'g-',t,step1,'b-',t,step2,'m-');
xgrid();
xtitle('Resposta ao degrau','tempo','Magnitude');
