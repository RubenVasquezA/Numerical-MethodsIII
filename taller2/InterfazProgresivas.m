clear
close all
clc
%Entradas de datos
preguntas={'Limite inferior x: '
    'Limite Superior x: '
    'Particion x: '
    'Particion t: '
    'Funcion u(x,0): '
    'Alfa: '
    'Tiempo Final: '};
Titulo='Diferencias Progresivas';
Defecto={'0','1','8','4','sin(pi*x)+sin(3*pi*x)','1','0.4'};
datos=inputdlg(preguntas,Titulo,1,Defecto);
a=str2num(datos{1});
b=str2num(datos{2});
m=str2num(datos{3});
n=str2num(datos{4});
g=datos{5};
alfa=str2num(datos{6});
timefinal=str2num(datos{7});
progresiva(a,b,m,n,g,alfa,timefinal)
%f = figure('Position',[400 400 400 150]); %la posicion del guide 
%cnames = {'X(i)'};
%t=uitable('parent',f,'Data',progresiva(a,b,m,n,g,alfa,timefinal),'ColumnName',cnames,...
 %   'Position',[20 20 360 100]);


