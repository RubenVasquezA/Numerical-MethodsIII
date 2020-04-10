function simpsoncompuesta(a,b,m,n)
syms f(x,y);
syms c(x);
syms d(x);
f(x,y)=input('f(x,y)= ');
c(x)=input('c(x)= ');
d(x)=input('d(x)= ');
h=(b-a)/n;%1° paso
J1=0;%TERMINOS EXTREMOS
J2=0;%TERMINOS PARES
J3=0;%TERMINOS IMPARES
for i=0:n
    x1=a+i*h
    HX=(d-c)/m
    K1=f(x1,c)+f(x1,d)
    K2=0;
    K3=0;
    for j=1:m-1 
        y1=c+j*HX%paso 5
        Q=f(x1,y1)
        if mod(j,2)==0 %paso 6
            K2=K2+Q
        else
            K3=K3+Q
        end
    end
   
    L=(K1+2*K2+4*K3)*HX/3%paso 7
    if i==0 || i==n
        J1=J1+L(x1)
    else
        if mod(i,2)==0
        J2=J2+L(x1)
        else
        J3=J3+L(x1)
        end
         
    end
      
end
J=h*(J1+2*J2+4*J3)/3;
J
    
 


 
 



        
        
        
