clc;
s=%s;
num=1; den=(s+0.6)*s;
tf=num/den;
FTMA=syslin('c', num/den); 
FTMF=FTMA/.(1);
// funcao transf malha fechada
// c significa dominio continuo
t=0:0.05:20;
//inp = t; //inp ou é uma funcao no tempo ou as prontas
inp = 'step'; 
step=csim(inp,t,FTMF);
// csim é a simulacao (resposta no tmepo) de um sistema linear
// 'step'  é a funcao de controle. Pode ser impulse tb
plot2d(t,step);
xgrid();
xtitle('Resposta ao degrau', ' tempo', 'Magnitude');
