function integral=pr5(g,h,x,y)
f=inline(g,'x','y');

integral=(f(x+h,y)-f(x-h,y))/(2*h);