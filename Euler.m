function [x,t] = Euler(a,b,xo,n)
x = zeros(1,n+1);
h = (b-a)/n;
x(1) = xo;
t(1) = a;
for i=1:n
    x(i+1) = x(i) + h*x(i);
    t(i+1) = t(i) + h;
end
end
    
    