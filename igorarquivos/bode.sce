s = %s;
num = 400;
den = s*(s^2+30*s+200);
G = syslin('c', num, den);
clf();
//bode(G, 0.01, 1000);
bode(G, 0.01, 1000, 'rad');
bode_asymp(G, 0.01, 1000);
