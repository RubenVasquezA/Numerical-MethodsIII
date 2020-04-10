function correctorpredic(a,b,n,epsilon,ro,w0,g)
syms t %%declaracion de variables simbolicas
f=inline(g,'t','y') 
y(t)=dsolve('Dy=(t-y)/2','y(0)=1')
h=(b-a)/n;
fprintf(' \t\t MÉTODO CORRECTOR-PREDICTOR DE CUARTO ORDEN DE ADAMS \n\n');
fprintf('\t\t\t-------------------------------------------\n');
fprintf('\t\t\t t(i)\t  y(ti)\t\t  w(ti)\t\t  error\t\t      \n');
fprintf('\t\t\t-------------------------------------------\n');
W=[]; T=[];
t2(1)=a;
t3=a;
s=double(subs(y,[t],[t3]));%%calculo de la solucion particular
w(1)=w0;
W(1)=w(1);
T(1)=t2(1);
e=abs(s-w(1));
fprintf('\t\t\t %3.2f\t %3.7f\t %3.7f\t %3.7f\n',t2(1),s,w(1),e)
for i=1:3
    k1=h*f(t2(i),w(i));
    k2=h*f(t2(i)+(h/2),w(i)+(k1/2));
    k3=h*f(t2(i)+(h/2),w(i)+(k2/2)); %%calculamos los w0,w1,w2,w3;
    k4=h*f(t2(i)+h,w(i)+k3);         %%calculamos los t0,t1,t2,t3;
    t3=a+i*h;                        %%por medio de RK4
    s=double(subs(y,[t],[t3]));
    w(i+1)=w(i)+(k1+2*k2+2*k3+k4)/6;
    W=[W,w(i+1)];
    e=abs(s-w(i+1));
    t2(i+1)=a+i*h; 
    T=[T,t2(i+1)];
    fprintf('\t\t\t %3.2f\t %3.7f\t %3.7f\t %3.7f\n',t2(i+1),s,w(i+1),e)
end
for i=5:n+1
    t1=a+(i-1)*h;
    w1=w(4)+h*(55*f(t2(4),w(4))-59*f(t2(3),w(3))+37*f(t2(2),w(2))-9*f(t2(1),w(1)))/24; %%predicto
    w2=w(4)+h*(9*f(t1,w1)+19*f(t2(4),w(4))-5*f(t2(3),w(3))+f(t2(2),w(2)))/24;    %%corrector 
    if (19/170)*abs(
    W=[W,w1];
    T=[T,t1];
    s=double(subs(y,[t],[t1])); 
    e=abs(s-w1);
    fprintf('\t\t\t %3.2f\t %3.7f\t %3.7f\t %3.7f\n',t1,s,w1,e)
                                                                             
    for j=1:3
        t2(j)=t2(j+1);
        w(j)=w(j+1); 
    end
     t2(4)=t1;
     w(4)=w1;
    
end
tt=0:0.001:2;
yy=y(tt);       
subplot(2,1,1); plot(T',W','r')
title('SOLUCION POR PREDICTOR-CORRECTOR ADAMS'); xlabel('t');ylabel('y')
subplot(2,1,2); plot(tt',yy','b')
title('SOLUCION EXACTA PVI'); xlabel('t');ylabel('y')