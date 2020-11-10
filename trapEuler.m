function [x,t] = trapEuler(a,b,xo,n)

h = (b-a)/n;
X = zeros(1,n+1);
x = zeros(1,n+1);
t = zeros(1,n+1);
t(1) =a;
x(1) = xo;
X(1) = xo;

for i=1:n
    X(i+1) = x(i) + h*x(i);
    x(i+1) = x(i) + (1/2)*h*(x(i)+X(i+1));
    t(i+1) = t(i) + h;
end
end