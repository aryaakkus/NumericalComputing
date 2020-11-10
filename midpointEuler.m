function [x,t] = midpointEuler(a,b,xo,n)

h = (b-a)/n;
x = zeros(1,n+1);
t = zeros(1,n+1);
x(1) = xo;
t(1) = a;

for i=1:n
    x(i+1) = x(i) + (1/2)*h*x(i);
    x(i+1) = x(i) + h*x(i+1);
    t(i+1) = t(i) + h;
end
end
    