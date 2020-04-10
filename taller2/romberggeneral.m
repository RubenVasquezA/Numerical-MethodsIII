%integracion de la funcion 
clear
close all 
clc
%Entrada de datos 
preguntas={'Limite inferior: '
'Limite superior:'
'numero de filas:' 
'Function para en integrar: '};
Titulo = 'Integracion compuesta';
Defecto= {'1','1.6','3','(2*x)/((x^2)-4)'};
datos=inputdlg(preguntas,Titulo,1,Defecto);
a=str2num(datos{1});
b=str2num(datos{2});
m=str2num(datos{3});
f=datos{4};
%inializacion
%x=sym('x');



for n=1:m;
    x=linspace(a,b,2^(n-1)+1);
    s=0;
    for i=1:2^(n-1),
        r=trapecio(f,x(i),x(i+1));
        s=s+r;
    end
    I(n,1)=s;
end
for k=2:m
    for j=k:m
        I(j,k)=(4^(k-1)*I(j,k-1)-I(j-1,k-1))/(4^(k-1)-1);
    end
end

