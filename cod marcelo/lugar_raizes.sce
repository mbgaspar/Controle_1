clc;
s = %s;
num = (s+10);
den = s^2+3*s+12;
G = syslin('c', num, den);
clf(); 
evans(G,100);
xgrid(36);
l = gca();
l.y_location = "origin";
l.y_label.text = "jw";

[Ki, s1] = kpure(G)
plot([real(s1) real(s1)], [imag(s1) -imag(s1)], 'sr')
