//funciona ok!
s=%s;
num=400;
den= s^3 + 30*s^2 + 200*s;
FTMA= syslin('c', num, den);

[mf ,fg]=p_margin(FTMA)
[mg,ff]=g_margin(FTMA)
show_margins(FTMA);
