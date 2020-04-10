function heun(a,b,n,y0,g)

syms t 

y(t)=dsolve('Dy=y*(2.128-0.043*y)','y(0)=0.24')

f=inline(g,'t','y');
h=(b-a)/n;
fprintf(' \t\t\t           MÉTODO DE HEUN\n\n')
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
    U=U+(h/4)*(f(T,U)+3*f(T+(2*h/3),U+(2*h/3)*f(T+(h/3),U+(h/3)*f(T,U))));
    T=a+i*h;
    s=double(subs(y,[t],[T]));
    e=abs(U-s);
    fprintf('\t %3.1f\t   %3.7f\t   %3.7f\t   %3.7f\n',T,s,U,e)
    
    
end