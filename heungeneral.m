fprintf('\n\tSoluciones de sistemas por medio de Euler Modificado\n')
p=input('\nUsted desea trabajar con sistemas S=si; N=no: ');
bol=true;
while(p=='S' && bol==true)
  fprintf('\nUsted cuenta con los siguientes sistemas\n')
  fprintf('\n1=Sistema de orden uno\n')
  fprintf('\n2=Sistema de orden dos\n')
  fprintf('\n3=Sistema de orden tres\n')
  fprintf('\n4=Sistema de orden cuatro\n')
  orden=input('\ningrese que orden del sistema desea <1,4>: ');
  switch orden
      case 1
          syms t
          f=input('ingrese su funcion f(t,y)= ');
          f1=inline(f,'t','y');
          a=input('ingrese a= ');
          b=input('ingrese b= ');
          h=input('ingrese h= ');
          w0=input('ingrse w0= ');
          condicional=input('se conoce la solucion S=si; N=no: ');
          if(condicional=='S')
              k=input('ingrese por favor la solucion: ');
              y=inline(k,'t');
              t1=a;           
              n=(b-a)/h; 
              w=w0;
              s=y(t1)
              e=0;
              W=[];T=[];
                W=[W,w];                     %%ejecucion programa
    T=[T t1];
fprintf(' \t\t\tMÉTODO DE EULER MODIFICADO\n\n');
fprintf('\t---------------------------------------------------\n');
fprintf('\t t(i)\t    y(ti)\t\t     w(ti) \t\t    error\t  \n');
fprintf('\t---------------------------------------------------\n');
fprintf('\t %3.1f\t   %3.7f\t    %3.7f\t   %3.7f\n',t1,s,w,e)
for i=1:n 
     %%lineas 12-25
     k1=h*f1(t1,y);
     k2=h*f1(t1+h,y+k1);
    w=w+(1/2)*(k1+k2);
    t1=a+i*h;
     W=[W,w];                     %%ejecucion programa
    T=[T t1];
     s=y(t1);
     e=abs(s-w);
    fprintf('\t %3.1f\t   %3.7f\t    %3.7f\t   %3.7f\n',t1,s,w,e)
end
plot(T',W','-r') 
hold on
ezplot(y,[a,b])
xlabel('t')
ylabel('y')
legend('SOL APROX','SOL EXACTA')

          
          else
              W=[];T=[];
              t1=a;
              h=(b-a)/n; 
              w=w0;
              W=[W,w];
              T=[T t1];
fprintf(' \t\t      MÉTODO DE EULER MODIFICADO PARA SISTEMA DE ORDEN 1\n\n');
fprintf('\t------------------------\n');
fprintf('\t t(i)\t     w(ti) \t  \n');
fprintf('\t-------------------------\n');
 fprintf('\t %3.1f\t      %3.7f\n',t1,w)
for i=1:n
   k1=h*f1(t1,w);
   k2=h*f1(t1+h,w+k1);
    w=w+(1/2)*(k1+k2);
    t1=a+i*h;
    W=[W,w];                     %%ejecucion programa
    T=[T t1];
    fprintf('\t %3.1f\t      %3.7f\n',t1,w)
end
plot(T',W','-r')
xlabel('t')
ylabel('x1')
legend('SOL APROX x1')
          end
      case 2
          syms t
          f=input('ingrese su funcion f1(t,x1,x2)= ');
          g=input('ingrese su funcion f2(t,x1,x2)= ');
          f1=inline(f,'t','x1','x2');
          f2=inline(g,'t','x1','x2');
          a=input('ingrese a= ');
          b=input('ingrese b= ');
          h=input('ingrese h= ');
          x10=input('ingrse x10= ');
          x20=input('ingrse x20= ');
W1=[];W2=[];T=[];          
n=(b-a)/h;
t1=a;
T=[T t1];
x1=x10;
W1=[W1 x1];
x2=x20;
W2=[W2 x2];
fprintf('\n\t\tMÉTODO DE EULER MODIFICADO PARA SISTEMAS DE ORDEN 2  \n\n');
fprintf('\t\t\t---------------------------------------------\n');
fprintf('\t\t\t t(i)\t         x1(ti)\t            x2(ti)\t \n');
fprintf('\t\t\t---------------------------------------------\n');
fprintf('\t\t\t %3.2f\t       %3.7f\t       %3.7f\n',t1,x1,x2)
for i=1:n
    k(1,1)=h*f1(t1,x1,x2);
    k(1,2)=h*f2(t1,x1,x2);
    %%%%%%%%%%%%%%%%%%%%%
    k(2,1)=h*f1(t1+h,x1+k(1,1),x2+k(1,2));
    k(2,2)=h*f2(t1+h,x1+k(1,1),x2+k(1,2));
    %%%%%%%%%%%%%%%%%%%%%%%%%%555
    x1=x1+(1/2)*(k(1,1)+k(2,1))
    x2=x2+(1/2)*(k(1,2)+k(2,2))
    t1=a+i*h;
    W1=[W1,x1];  
    W2=[W2,x2];
    T=[T t1];
    fprintf('\t\t\t %3.2f\t       %3.7f\t       %3.7f\n',t1,x1,x2)
end
plot(T',W1','-r') 
hold on
plot(T',W2','-b') 
xlabel('t')
ylabel('x1, x2')
legend('SOL APROX x1','SOL APROX x2')
 
      case 3
          syms t
          f=input('ingrese su funcion f1(t,x1,x2,x3)= ');
          g=input('ingrese su funcion f2(t,x1,x2,x3)= ');
          h=input('ingrese su funcion f3(t,x1,x2,x3)= ');
          f1=inline(f,'t','x1','x2','x3');
          f2=inline(g,'t','x1','x2','x3');
          f3=inline(h,'t','x1','x2','x3');
          a=input('ingrese a= ');
          b=input('ingrese b= ');
          h=input('ingrese h= ');
          x10=input('ingrse x10= ');
          x20=input('ingrse x20= ');
          x30=input('ingrse x30= ');
W1=[];W2=[];W3=[];T=[];
n=(b-a)/h;
t1=a;
T=[T t1];
x1=x10;
W1=[W1 x1];
x2=x20;
W2=[W2 x2];
x3=x30;
W3=[W3 x3];
fprintf('\n\t\t MÉTODO DE EULER MODIFICADO PARA SISTEMAS DE ORDEN 3 \n\n');
fprintf('\t------------------------------------------------------\n');
fprintf('\t t(i)\t       x1(ti)\t       x2(ti)\t        x3(ti)\t \n');
fprintf('\t------------------------------------------------------\n');
fprintf('\t %3.2f\t     %3.7f\t     %3.7f\t     %3.7f\n',t1,x1,x2,x3)
for i=1:n
    
    k(1,1)=h*f1(t1,x1,x2,x3);
    k(1,2)=h*f2(t1,x1,x2,x3);
    k(1,3)=h*f3(t1,x1,x2,x3);
    %%%%%%%%%%%%%%%%%%%%%
    k(2,1)=h*f1(t1+h,x1+k(1,1),x2+k(1,2),x3+k(1,3));
    k(2,2)=h*f2(t1+h,x1+k(1,1),x2+k(1,2),x3+k(1,3));
    k(2,3)=h*f3(t1+h,x1+k(1,1),x2+k(1,2),x3+k(1,3));
    %%%%%%%%%%%%%%%%%%%%%%%%%%
    x1=x1+(1/2)*(k(1,1)+k(2,1));
    x2=x2+(1/2)*(k(1,2)+k(2,2));
    x3=x3+(1/2)*(k(1,3)+k(2,3));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    t1=a+i*h;
    W1=[W1,x1];  
    W2=[W2,x2];
    W3=[W3,x3];%%ejecucion programa
    T=[T t1];
    fprintf('\t %3.2f\t     %3.7f\t     %3.7f\t     %3.7f\n',t1,x1,x2,x3)
end
plot(T',W1','-r') 
hold on
plot(T',W2','-b') 
hold on
plot(T',W3','-g') 
xlabel('t')
ylabel('x1, x2, x3')
legend('SOL APROX x1','SOL APROX x2','SOL APROX x3')
      case 4
          syms t
          f=input('ingrese su funcion f1(t,x1,x2,x3,x4)= ');
          g=input('ingrese su funcion f2(t,x1,x2,x3,x4)= ');
          h=input('ingrese su funcion f3(t,x1,x2,x3,x4)= ');
          r=input('ingrese su funcion f4(t,x1,x2,x3,x4)= ');
          f1=inline(f,'t','x1','x2','x3','x4');
          f2=inline(g,'t','x1','x2','x3','x4');
          f3=inline(h,'t','x1','x2','x3','x4');
          f4=inline(r,'t','x1','x2','x3','x4');
          a=input('ingrese a= ')
          b=input('ingrese b= ')
          h=input('ingrese h= ')
          x10=input('ingrse x10= ')
          x20=input('ingrse x20= ')
          x30=input('ingrse x30= ')
          x40=input('ingrse x40= ')
W1=[];W2=[];W3=[];W4=[];T=[];
n=(b-a)/n;
t1=a;
T=[T t1]
x1=x10;
W1=[W1 x1];
x2=x20;
W2=[W2 x2];
x3=x30;
W3=[W3 x3];
x4=x40;
W4=[W4 x4];
fprintf(' \t\t MÉTODO DE EULER MODIFICADO PARA SISTEMAS DE ORDEN 4 \n\n');
fprintf('\t------------------------------------------------------\n');
fprintf('\t t(i)\t     x1(ti)\t     x2(ti)\t     x3(ti)\t     x4(ti)\t\n');
fprintf('\t------------------------------------------------------\n');
fprintf('\t %3.2f\t     %3.7f\t     %3.7f\t     %3.7f\t     %3.7f\n',t1,x1,x2,x3,x4)
for i=1:n
 
     k(1,1)=h*f1(t1,x1,x2,x3,x4);
    k(1,2)=h*f2(t1,x1,x2,x3,x4);
    k(1,3)=h*f3(t1,x1,x2,x3,x4);
    k(1,4)=h*f4(t1,x1,x2,x3,x4);
    %%%%%%%%%%%%%%%%%%%%%
    k(2,1)=h*f1(t1+h,x1+k(1,1),x2+k(1,2),x3+k(1,3),x4+k(1,4));
    k(2,2)=h*f2(t1+h,x1+k(1,1),x2+k(1,2),x3+k(1,3),x4+k(1,4));
    k(2,3)=h*f3(t1+h,x1+k(1,1),x2+k(1,2),x3+k(1,3),x4+k(1,4));
     k(2,4)=h*f4(t1+h,x1+k(1,1),x2+k(1,2),x3+k(1,3),x4+k(1,4));
    %%%%%%%%%%%%%%%%%%%%%%%%%%
    x1=x1+(1/2)*(k(1,1)+k(2,1));
    x2=x2+(1/2)*(k(1,2)+k(2,2));
    x3=x3+(1/2)*(k(1,3)+k(2,3));
   x4=x4+(1/2)*(k(1,4)+k(2,4));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    t1=a+i*h;
    W1=[W,x1];   
    W2=[W2,x1];
    W3=[W3,x1];
    W4=[W4,x1]; %%ejecucion programa
    T=[T t1];
   fprintf('\t %3.2f\t     %3.7f\t     %3.7f\t     %3.7f\t     %3.7f\n',t1,x1,x2,x3,x4)
end
plot(T',W1','-r') 
hold on
plot(T',W2','-b') 
hold on
plot(T',W3','-g') 
hold on
plot(T',W4','-k') 
xlabel('t')
ylabel('x1 x2 x3 x4')
legend('SOL APROX x1','SOL APROX x2','SOL APROX x3','SOL APROX x4')
  end
  p=input('\nUsted desea trabajar de nuevo con sistemas S=si; N=no: ');
end