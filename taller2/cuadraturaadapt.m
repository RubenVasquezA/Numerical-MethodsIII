function cuadraturaadapt(a,b,Tol,N,g)
Toli=[]; ai=[]; hi=[]; FAi=[];FCi=[];FBi=[]; Si=[];Li=[];
f=inline(g,'x');
APP=0;
i=1;
Toli(1)=15*Tol;
ai(1)=a;
hi(1)=(b-a)/2;
FAi(1)=f(a);
FCi(1)=f(a+hi(1));
FBi(1)=f(b);
Si(1)=hi(1)*(FAi(1)+4*FCi(1)+FBi(1))/3;
Li(1)=1;
while i>0 
    FD=f(ai(i)+(hi(i)/2));
    FE=f(ai(i)+(3*hi(i)/2));
    S1=hi(i)*(FAi(i)+4*FD+FCi(i))/6;
    
    S2=hi(i)*(FCi(i)+4*FE+FBi(i))/6;
    v1=ai(i);
    v2=FAi(i);
    v3=FCi(i);
    v4=FBi(i);
    v5=hi(i);
    v6=Toli(i);
    v7=Si(i);
    v8=Li(i);
    i=i-1;
    if abs(S1+S2-v7)<v6
        APP=APP+(S1+S2);
      else
        if v8>=N
        fprintf('nivel excedido\n')
        break 
        else 
        i=i+1;
        ai(i)=v1+v5;
        FAi(i)=v3;
        FCi(i)=FE;
        FBi(i)=v4;
        hi(i)=v5/2;
        Toli(i)=v6/2;
        Si(i)=S2;
        Li(i)=v8+1;
        i=i+1;
        ai(i)=v1;
        FAi(i)=v2;
        FCi(i)=FD;
        FBi(i)=v3;
        hi(i)=hi(i-1);
        Toli(i)=Toli(i-1);
        Si(i)=S1;
        Li(i)=Li(i-1);
        end
    end
    APP;
end
APP

        
        
        
        
