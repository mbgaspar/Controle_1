clc();
s= %s;
pi= %pi;
Kv= 20; //colocar###################
mF2= 65; //colocar###################
numG= 50; //colocar###################
denG= (s+10)*(s+50); //colocar###################
G= syslin('c',numG,denG);
H= 1;
FTMA= G*H;
FTMF= G/.H;
Kc=19
//Kc=  horner((Kv/(s*FTMA)), 0); // Kv=s*[Kc.GH(0)]
KcGH= Kc*G*H;
figure(1);
clf(1);
show_margins(KcGH,'bode');
[mF,fG]= p_margin(KcGH);
Fi= mF2-mF;
Fi1= Fi+5;  // adiciona 5 graus
alfa= (1+sin(Fi1*pi/180))/(1-sin(Fi1*pi/180));
Ganho_ad=-10*log10(alfa);
disp(Ganho_ad,'Ganho_ad [dB]=');
wGhz= 0.49;  // tirado (em Hz) do Diag. de Bode de KcGH //colocar###################
wG= wGhz*(2*pi);
T= 1/((alfa^0.5)*wG);
alfaT= alfa*T;
disp(alfaT,'alfaT [s]= ',T,'T [s]= ');
numC1= Kc*(alfaT*s+1);
denC1= (T*s+1);
Gc1= syslin('c',numC1,denC1);
FTMFc1= (Gc1*G)/.H;
Fi2= Fi+10; // adiciona 10 graus
alfa= (1+sin(Fi2*pi/180))/(1-sin(Fi2*pi/180));
Ganho_ad=-10*log10(alfa);
disp(Ganho_ad,'Ganho_ad [dB]=');
wGhz= 14; // tirado (em Hz) do Diag. de Bode de KcGH //colocar###################
wG= wGhz*(2*pi);
T= 1/((alfa^0.5)*wG);
alfaT= alfa*T;
disp(alfaT,'alfaT [s]= ',T,'T [s]= ');
numC2= Kc*(alfaT*s+1);
denC2= (T*s+1);
Gc2= syslin('c',numC2,denC2);
FTMFc2= (Gc2*G)/.H;
clf
//figure(0);
//clf(0);
t= 0:0.002:2;
step0=csim('step',t,FTMF);
step1=csim('step',t,FTMFc1);
step2=csim('step',t,FTMFc2);
plot(t,step0,t,step1,t,step2);
xgrid(35);
xtitle('Step Response','Time (sec)','Amplitude');
