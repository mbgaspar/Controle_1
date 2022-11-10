s= %s;
num=s+10;
den= s^2 + 3*s + 10;

FTMA=syslin('c', num, den);
nyquist(FTMA, 1E-6, 1E+6);
l=gca();
l.x_label.text= 'Re[GH(jw)]';
l.y_label.text= 'Im[GH(jw)]';
plot(-1,0, 'x')
show_margins(FTMA, 'nyquist');
