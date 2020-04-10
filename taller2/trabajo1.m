x=input('numero favorito: ');
n=20;
for i=1:n
    f=(exp(x+10^-i)*sin(x+10^-i)-(exp(x)*sin(x)))/(10^-i)
end

