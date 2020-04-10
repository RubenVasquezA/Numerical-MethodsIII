function milne(f,x0,x);
f=inline(f,'x');
h=(x-x0)/4;
integral=2*h*(7*f(x0)+32*f(x0+h)+12*f(x0+2*h)+32*f(x0+3*h)+7*f(x))/45
