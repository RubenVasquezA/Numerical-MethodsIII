%integracion de la funcion 
clear
close all 
clc
%Entrada de datos 

preguntas={'Limite inferior: '
'Limite superior:' 
'condicion inicial:'
'h:'
'Function : '};
Titulo = 'Metodo de Runge Kutta 4';
Defecto= {'1','1.5','1','0.1','(t-y)/2'};
datos=inputdlg(preguntas,Titulo,1,Defecto);
a=str2num(datos{1});
b=str2num(datos{2});
y0=str2num(datos{3});
h=str2num(datos{4});

ff=datos{5};
f=inline(ff,'t','y');
t(1)=a;
y(1)=y0;
for k=1:3
    k1=h*f(t(k),y(k));
    k2=h*f(t(k)+h/2,y(k)+k1/2);
    k3=h*f(t(k)+h/2,y(k)+k2/2);
    k4=h*f(t(k)+h,y(k)+k3);
    y(k+1)=y(k)+(k1+2*k2+2*k3+k4)/6;
    t(k+1)=a+k*h;
end
solaprox=y'


%plot(xx,yy,'b',x,y,'r');
%legend('solucion exacta','solucion aproximada h=0.1',...
    %'localizacion','northwest');








