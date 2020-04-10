function euler(a,b,n,y0,g)

syms t 

y(t)=dsolve('Dy=3*y-y^3','y(0)=1')

f=inline(g,'t','y');
h=(b-a)/n;
fprintf(' \t\t\t           MÉTODO DE EULER\n\n')
fprintf('\t----------------------------------------------------\n')
fprintf('\t t(i)\t\t  yti)\t\t    w(ti) \t\t    error     \n')
fprintf('\t----------------------------------------------------\n')

A=[];
B=[];
T=a;
U=y0;
s=double(subs(y,[t],[T]));
e=0;
fprintf('\t %3.1f\t   %3.7f\t   %3.7f\t   %3.7f\n',T,s,U,e)


for i=1:n
    U=U+h*f(T,U);
    T=a+i*h;
    s=double(subs(y,[t],[T]));
    e=abs(U-s);
    fprintf('\t %3.1f\t   %3.7f\t   %3.7f\t   %3.7f\n',T,s,U,e)
    
    
end


%plot(A,B)
%xlabel('\fontname{LCD}\it\bf Eje Abcisas','fontsize',15)
%ylabel('\fontname{LCD}\it\bf Eje Ordenadas','fontsize',15)
%title('\fontname{LCD} GRAFICA DE LA SOLUCIONES DE ECUACIONES DIFERENCIALES','fontsize',15)
%grid on 