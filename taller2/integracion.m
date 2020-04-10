%integracion de la funcion 
clear
close all 
clc
%Entrada de datos 
preguntas={'Limite inferior: '
'Limite superior:'
'numero de particiones:' 
'Function para en integrar: '};
Titulo = 'Integracion compuesta';
Defecto= {'1','1.6','10','(2*x)/((x^2)-4)'};
datos=inputdlg(preguntas,Titulo,1,Defecto);
a=str2num(datos{1});
b=str2num(datos{2});
n=str2num(datos{3});
f=datos{4};
%inializacion
%x=sym('x');

x=linspace(a,b,n+1);
s=0;
for i=1:n
    r=trapecio(f,x(i),x(i+1));
    s=s+r;
end
I=s
