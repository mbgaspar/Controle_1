clc;
s=%s;
num = 400;
den = (s*(s^2+30*s+200));
FTMA= syslin('c', num, den);

[mf ,fg]=p_margin(FTMA)
[mg,ff]=g_margin(FTMA)
printf('Margem de fase: %.2f graus\n', mf)
printf('Frequência onde o ganho é 1: %.2f Hz\n', fg)
printf('Margem de ganho: %.2f dB\n', mg)
printf('Frequência onde a fase é 180º: %.2f Hz\n', ff)
show_margins(FTMA);
