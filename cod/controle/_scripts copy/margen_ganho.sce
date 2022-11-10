clc;
s = %s;
num = 400;
den = (s*(s^2+30*s+200));
G = syslin('c', num, den);

[mf, fg]=p_margin(G);
disp(fg, mf);
[mg, ff]=g_margin(G);
disp(ff, mg);
show_margins(G);
