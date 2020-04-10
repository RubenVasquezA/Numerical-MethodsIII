function disparonolineal(a,b,alfa,beta,N,tol,M,f,fy,fy1)
f=inline(f,'x','y','y1'); 
fy=inline(fy,'x','y','y1');%% fy es la derivada parcial de f(x,y,y1) con respecto a y
fy1=inline(fy1,'x','y','y1');% fy1 es la derivada parcial de f(x,y,y1) con respecto a y1
g=inline('x.^2+(16./x)','x'); %la funcion resultado;
h=(b-a)/N;
p=1;
TK=(beta-alfa)/(b-a);
continuar=true;
X=[]; G=[];
fprintf(' \n\t MÉTODO DE METODO DEL DISPARO PARA ECUACION NO LINEAL \n\n');
fprintf('\t------------------------------------------\n');
fprintf('\t t(i)\t  x1(ti)\t    y(ti)\t   error\n');
fprintf('\t------------------------------------------\n');

while(p<=M && continuar)
    w(1,1)=alfa; 
    w(2,1)=TK;
    u1=0;
    u2=1;
    for i=2:N+1
        x1=a+(i-2)*h;
        k(1,1)=h*w(2,i-1);
        k(1,2)=h*f(x1,w(1,i-1),w(2,i-1));
        k(2,1)=h*(w(2,i-1)+k(1,2)./2);
        k(2,2)=h*f(x1+h./2,w(1,i-1)+k(1,1)./2,w(2,i-1)+k(1,2)./2);
        k(3,1)=h*(w(2,i-1)+k(2,2)./2);
        k(3,2)=h*f(x1+h./2,w(1,i-1)+k(2,1)./2,w(2,i-1)+k(2,2)./2);
        k(4,1)=h*(w(2,i-1)+k(3,2));
        k(4,2)=h*f(x1+h,w(1,i-1)+k(3,1),w(2,i-1)+k(3,2));
        w(1,i)=w(1,i-1)+(k(1,1)+2*k(2,1)+2*k(3,1)+k(4,1))/6;
        w(2,i)=w(2,i-1)+(k(1,2)+2*k(2,2)+2*k(3,2)+k(4,2))/6;
        r(1,1)=h*u2;
        r(1,2)=h*((fy(x1,w(1,i-1),w(2,i-1))*u1+fy1(x1,w(1,i-1),w(2,i-1))*u2));
        r(2,1)=h*(u2+r(1,2)./2);
        r(2,2)=h*(fy(x1+h./2,w(1,i-1),w(2,i-1))*(u1+r(1,1)./2)+fy1(x1+h./2,w(1,i-1),w(2,i-1))*(u2+r(1,2)./2));
        r(3,1)=h*(u2+r(2,2)./2);
        r(3,2)=h*(fy(x1+h./2,w(1,i-1),w(2,i-1))*(u1+r(2,1)./2)+fy1(x1+h./2,w(1,i-1),w(2,i-1))*(u2+r(2,2)./2));
        r(4,1)=h*(u2+r(3,2));
        r(4,2)=h*(fy(x1+h,w(1,i-1),w(2,i-1))*(u1+r(3,1))+fy1(x1+h,w(1,i-1),w(2,i-1))*(u2+r(3,2)));
        u1=u1+(r(1,1)+2*r(2,1)+2*r(3,1)+r(4,1))/6;
        u2=u2+(r(1,2)+2*r(2,2)+2*r(3,2)+r(4,2))/6;     
    end
          if abs(w(1,N+1)-beta)<=tol
             for i=1:N+1
                x1=a+(i-1)*h;
                X=[X x1];
                fprintf('\t %3.2f\t %3.6f\t %3.6f\t %3.6f\n',x1,w(1,i),g(x1),abs(g(x1)-w(1,i)))              
            end
            fprintf('procedimento terminado\n')
            continuar=false;
             
         else
            TK=TK-((w(1,N+1)-beta)./u1);
            p=p+1;
          end     
end
fprintf('el numero maximo de iteraciones excedio\n')
x2=1:0.001:3;
G=[G g(x2)'];
plot(X',w(1,:)')
hold on 
plot(x2',G','r')


           
                
                
                
        




