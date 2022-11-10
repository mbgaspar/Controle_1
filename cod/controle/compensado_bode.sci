s=%s;
Tz=0.157
Tp=0.065
Kc=5
num=Kc*(Tz*s+1)*(s+10);
den= (Tp*s+1)*(s^2 + 2*s + 1);

FTMA= syslin('c', num/den);

[mf ,fg]=p_margin(FTMA)
[mg,ff]=g_margin(FTMA)
show_margins(FTMA);
