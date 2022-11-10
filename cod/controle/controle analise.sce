///sempre dar os seguintes parametros
//num 
//den
//exacutar a função - [x,y]=controle(num,den)
//!!!!!!!!se for usado para analise antes do projeto o num e den deve ser de malha fechada!!!!!!!!!!




function [x,y]=controle(num, den)
    s= %s;
//routh-hurwitz
//Todos os coeficientes do polinômio tenham o mesmo sinal?
//Nenhum dos coeficientes seja nulo?
//s = %s;
//EC = 2*s^4+s^3+3*s^2+4*s+10;
///routh_t(EC)



// lugar das raizes


pi= %pi;
Kv= 10;
//numG= 400;
//denG= s*(s^2+30*s+200);
G= syslin('c',num,den);
H= 1;
FTMF= G/.H;
// Kc= horner((Kp/(G*H)), 0);   // Kp= Kc.GH(0)
Kc= horner((Kv/(s*G*H)), 0); // Kv=s*[Kc.GH(0)]
disp(Kc, 'Kc= ');
omega= 13.5;
zeta= 0.5;
s1=-(zeta*omega)+((omega*(1-zeta^2)^0.5)*%i);
[mS,tetaS]= polar(s1);
tetaS= real(tetaS);
Gs1= horner((G*H), s1);
[mG,tetaG]=polar(Gs1);
tetaG= real(tetaG);
disp((180*tetaS/pi), 'tetaS= ',mS, 'mS= ');
disp((180*tetaG/pi), 'tetaG= ',mG, 'mG= ');
Tz= real((sin(tetaS)-(Kc*mG*sin(tetaG-tetaS)))/(Kc*mG*mS*sin(tetaG)));
Tp= real(-((Kc*mG*sin(tetaS))+(sin(tetaG+tetaS)))/(mS*sin(tetaG)));
disp(Tp,'Tp [s]= ',Tz,'Tz [s]= ');
numC= Kc*(Tz*s+1);
denC= (Tp*s+1);
Gc= syslin('c',num,den);
FTMFc= (Gc*G)/.H;
figure(1);
clf(1);
t= 0:0.002:2;
step=csim('step',t,FTMF);
step2=csim('step',t,FTMFc);
plot(t,step,'b‐',t,step2,'m‐');
xgrid(33);
figure(2);
clf(2);
evans(G*H,100);
xgrid(33);
figure(3);
clf(3);
evans(Gc*G*H,100);
xgrid(33);


// diagrama de bode
G1=syslin('c',num,den); 
figure(4);
bode(G1,0.01,1000,'rad');
bode_asymp(G1,0.01,100);


//diagrama de nyquist
ftma=syslin('c',num,den);
figure(5);
nyquist(ftma, 1E-6, 1E+6);
show_margins(FTMA, ‘nyquist’);
[mf ,fg]=p_margin(FTMA) ; disp(fg,mf);
[mg,ff]=g_margin(FTMA) ; disp(ff,mg);
// l.isoview= 'on';
endfunction
