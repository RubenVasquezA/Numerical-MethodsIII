%integracion de la funcion 
clear
close all 
clc
%Entrada de datos 

preguntas={'Limite inferior: '
'Limite superior:' 
'condicion inicial'
'tamaño de pasos' 
'Function : '};
Titulo = 'Metodo de euler';
Defecto= {'1','1.5','1','0.1','0.2*x*y'};
datos=inputdlg(preguntas,Titulo,1,Defecto);
a=str2num(datos{1});
b=str2num(datos{2});
y0=str2num(datos{3});
h=str2num(datos{4});
syms  g(x,y)  
f=datos{5};
%inializacion
g(x,y)=f
x(1)=a
y1(1)=y0
for n=1:5
    y1(n+1)=y1(n)+h*g(x(n),y1(n))
    x(n+1)=x(n)+h
end
xx=linspace(1,1.5,50);
syms u(x,y)
u(x,y)=f
yy=dsolve('Dy=u',x)

%plot(xx,yy,'b',x,y,'r');
%legend('solucion exacta','solucion aproximada h=0.1',...
    %'localizacion','northwest');
resp=y1'







