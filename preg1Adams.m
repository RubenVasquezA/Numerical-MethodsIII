clc;
clear all;
f=inline('4*exp(0.8*t)-0.5*y','t','y');
t0=0;
y0=2;
tf=4;

y(1) = y0; 
h=(4-0)/4; 
t = 0:h:4;
for k=1:3,
k1=f(t(k),y(k));
k2=f(t(k)+h/2,y(k)+(h/2)*k1);
k3=f(t(k)+h/2,y(k)+(h/2)*k2);
k4=f(t(k)+h,y(k)+h*k3);

y(k+1) = y(k) + h*(k1+2*k2+2*k3+k4)/6;
end


for k=4:12,
    p(k+1)=y(k)+h*(-9*f(t(k-3),y(k-3))+37*f(t(k-2),y(k-2))-59*f(t(k-1),y(k-1))+55*f(t(k),y(k)))/24;
    
    y(k+1)=y(k)+h*(f(t(k-2),y(k-2))-5*f(t(k-1),y(k-1))+19*f(t(k),y(k))+9*f(t(k+1),p(k+1)))/24;
    
end;
yy=(40*exp(-t/2)*exp((13*t)/10))/13 - (14*exp(-t/2))/13;
fprintf('la solución aproximada y exacta es\n');
fprintf('       tk        yk(aprox)   yk(exacta)      error\n');
for(i=1:13)
fprintf('    %f     %f     %f     %f \n',t(i),y(i), yy(i),abs(yy(i)-y(i)));
end
tt=0:0.01:3;
yyy=3*exp(-tt/2)-2+tt;

plot(tt,yyy,'b',t,y,'r');
legend('solución exacta','Solución aproximada h=1',...
      'Location','NorthWest');
