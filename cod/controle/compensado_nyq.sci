s= %s;
Tz=2.7823204
Tp=0.4516098
Kc=1.9
num=Kc*(Tz*s+1)*(s+10);
den= (Tp*s+1)*(s^2 + 2*s + 1);
FTMA= syslin('c', num/den);

FTMA=syslin('c', num, den);
nyquist(FTMA, 1E-6, 1E+6);
l=gca();
l.x_label.text= 'Re[GH(jw)]';
l.y_label.text= 'Im[GH(jw)]';
plot(-1,0, 'x')
show_margins(FTMA, 'nyquist');
