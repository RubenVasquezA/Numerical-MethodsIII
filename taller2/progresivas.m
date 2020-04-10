%diferencias progresivas 
function[resultado]=progresivas(ff,x0,h)
f=inline(ff,'x');
resultado=(f(x0+h)-f(x0))/h;