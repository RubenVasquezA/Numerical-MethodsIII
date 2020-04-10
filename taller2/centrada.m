%diferencias progresivas 
function[r]=centrada(ff,x0,h)
f=inline(ff,'x');
r=(f(x0+h)-f(x0-h))/(2*h);