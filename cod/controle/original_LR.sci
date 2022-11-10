//funciona ok 

s=%s;
num=400;
den= s^3 + 30*s^2 + 200*s+400;
m= length(coeff(num))-1; n= length(coeff(den))-1;
FTMA=syslin('c',num,den);
clf(); evans(FTMA,500);
xgrid(31); // adiciona uma grade de cor 31
l=gca(); // retorna o identificador dos eixos

l.data_bounds=[-50,-15;15,15]; // altera os limites dos dados
l.x_location = 'origin'; // eixo x na origem
l.y_location = 'origin'; // eixo y na origem
l.y_label.position = [0,3.7]; // altera a posição do rotulo do eixo y
l.y_label.text= 'jw'; // altera o rotulo do eixo y
disp(l.children); // imprime o vector que contém os identificadores de todos os objetos filhos dos eixos
legenda= l.children(1);
legenda.visible= 'off'; // legenda invisível
ramos= l.children(2); // espessura e cor de cada ramo
n_ramos= n;
cor= 2;
thick= 3;
for r=1:n_ramos
  ramos.children(r).thickness= thick;
  ramos.children(r).foreground= cor;
  cor= cor+1;
end

n_assintotas= n-m;
if (n_assintotas>0) then
  for a=1:n_assintotas
    l.children(2+a).line_style=2; // assintotas tracejadas
  end

  if length(l.children)>=(n_assintotas+4) then
    l.children(n_assintotas+4).thickness=3; // espessura dos polos
    l.children(n_assintotas+4).mark_size=10;      
  end
  if length(l.children)>=(n_assintotas+5) then
    l.children(n_assintotas+5).thickness=3; // espessura dos zeros
    l.children(n_assintotas+5).mark_size=10;
    l.children(n_assintotas+5).mark_style=9;
  end
else
  l.children(n_assintotas+3).thickness= 3; // espessura dos polos
  l.children(n_assintotas+3).mark_size= 10;
  l.children(n_assintotas+4).thickness= 3; // espessura dos zeros
  l.children(n_assintotas+4).mark_size= 10;
  l.children(n_assintotas+5).mark_style= 9;

end
