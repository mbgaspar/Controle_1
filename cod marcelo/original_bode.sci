//funciona ok!
s=%s;
num = (s+10);
den = s^2+2*s+2;
FTMA= syslin('c', num, den);

[mf ,fg]=p_margin(FTMA)
[mg,ff]=g_margin(FTMA)
show_margins(FTMA);

//num = 400;
//den = s*(s^2+30*s+200);
