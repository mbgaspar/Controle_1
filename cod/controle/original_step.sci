s= %s;
num=s+10;
den= s^2 + 3*s + 11;
FTMF= syslin('c', num/den);
t= linspace(0,6,501);
step= csim('step',t,FTMF);
plot2d(t,step);
xgrid();
xtitle('Resposta ao degrau','tempo','Magnitude');
