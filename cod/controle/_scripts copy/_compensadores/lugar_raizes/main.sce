clear;
clc;
path = "/Users/igdebastiani/OneDrive/IFSC\2020-2/sct/material/_scripts/_compensadores/lugar_raizes"
getd(path);

s=%s;
g = 1/((0.25*s+1)*(0.5*s+1));
G = syslin('c', g);

t = 0:0.0001:10;
G_ftmf=G/(1+G);

y_g = csim('step', t, G_ftmf);
show_window(0);
plot(t, y_g,'r');
xlabel('Tempo(s)');
ylabel('Amplitude');
title('Resposta ao degrau');
legend('G(s)', 'G(s)*Gc(s)', 'Gc(s)',3);

print_bode_margins(G,1);
print_nyquist(G,2);
print_lugar_raizes(G,3);

Kc=19;
zeta=0.75;
Wn=50;

Gc=compensador_lr(G, Kc, zeta, Wn);
GGc=G*Gc;


GGc_ftmf=GGc/(1+GGc);
Gc_ftmf=Gc/(1+Gc);

y_ggc= csim('step', t, GGc_ftmf);
y_gc = csim('step', t, Gc_ftmf);
show_window(4);
plot(t, y_g,'r');
plot(t, y_ggc,'b');
plot(t, y_gc,'m');
xlabel('Tempo(s)');
ylabel('Amplitude');
title('Resposta ao degrau');
legend('G(s)', 'G(s)*Gc(s)', 'Gc(s)',3);

show_window(5);
bode([G;GGc/Kc;Gc/Kc], 0.01, 10e3, ['G(s)'; 'G(s)*Gc(s)/Kc'; 'Gc(s)/Kc']);
f=gcf();
f.children(1).children(1).links(1).foreground=6;
f.children(1).children(1).links(2).foreground=2;
f.children(1).children(1).links(3).foreground=5;
f.children(2).children(1).children(1).foreground=6;
f.children(2).children(1).children(2).foreground=2;
f.children(2).children(1).children(3).foreground=5;

print_bode_margins(GGc,6);
print_lugar_raizes(GGc,7);
