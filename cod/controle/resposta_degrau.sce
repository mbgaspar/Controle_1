s=%s;
K=1; T=1;
num=K; den=(T*s+1);
tf=num/den;
FTMF=syslin('c', num/den); 
// funcao transf malha fechada
// c significa dominio continuo
t=linspace(0,10,501);
//inp = t; //inp ou é uma funcao no tempo ou as prontas
inp = 'step'; 
step=csim(inp,t,FTMF);
// csim é a simulacao (resposta no tmepo) de um sistema linear
// 'step'  é a funcao de controle. Pode ser impulse tb
plot2d(t,step);
xgrid();
xtitle('Resposta ao degrau', ' tempo', 'Magnitude');
