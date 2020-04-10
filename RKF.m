function RKF(a,b,y0,TOL,hmax,hmin,g)
syms t 
f=inline(g,'t','y');
y(t)=dsolve('Dy=(2*10^-6)*(1000000-y)*y','y(0)=1000')
T=[];W=[];H=[];
t1=a;
w=y0;
h=hmax;
BANDERA=1;
fprintf(' \t\t\t\t\t\t\t      MÉTODO DE RUNGE KUTTA FE DE ORDEN 4\n\n')
fprintf('\t---------------------------------------------------------------------------------------\n')
fprintf('\t t(i)\t\t   y(ti) \t\t   w(ti) \t\t   wi(ti) \t\t    h(i) \t\t     R(i)\t\t   \n')
fprintf('\t---------------------------------------------------------------------------------------\n')

while BANDERA==1
    K1=h*f(t1,w);
    K2=h*f(t1+(1/4)*h,w+(1/4)*K1);
    K3=h*f(t1+(3/8)*h,w+(3/32)*K1+(9/32)*K2);
    K4=h*f(t1+(12/13)*h,w+(1932/2197)*K1-(7200/2197)*K2+(7296/2197)*K3);
    K5=h*f(t1+h,w+(439/216)*K1-8*K2+(3680/513)*K3-(845/4104)*K4);
    K6=h*f(t1+(h/2),w-(8/27)*K1+2*K2-(3544/2565)*K3+(1859/4104)*K4-(11/40)*K5);
    R=(1/h)*abs((1/360)*K1-(128/4275)*K3-(2197/75240)*K4+(1/50)*K5+(2/55)*K6);
if R<=TOL
t1=t1+h;
wi=w+(16/135)*K1+(6656/12825)*K3+(28561/56430)*K4-(9/50)*K5+(2/55)*K6;
w=w+(25/216)*K1+(1408/2565)*K3+(2197/4104)*K4-(1/5)*K5;
s=double(subs(y,[t],[t1]));
fprintf('\t %3.7f\t   %3.7f\t   %3.7f\t   %3.7f\t   %3.7f\t   %3.7f\n',t1,s,w,wi,h,R)
end
d=0.84*(TOL/R)^(1/4);
if d<=0.1
    h=0.1*h;
    elseif d>=4
        h=4*h;
    else h=d*h;
end
if h>hmax
    h=hmax;
end
if t1>=b
    BANDERA=0;
    elseif (t1+h)>b
        h=b-t1;
    elseif h<hmin
        BANDERA=0;
        fprintf('Rebasado h minimo\n')
        fprintf('Precedimiento terminado de manera no satisfactoria\n')
        
end
end
fprintf('el procedimiento completo\n')


            
    