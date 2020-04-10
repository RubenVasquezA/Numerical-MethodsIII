% df(g,x,h)
f=input('dame la funcion : ','s')
g=inline(f,'x');
x=input('ingresa un vector: ')
A=[];
for i=1:length(x)
    h(i)=g(x(i));
    A=[A h(i)]
    
end



