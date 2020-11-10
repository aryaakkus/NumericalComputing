function [x,t] = RungeOrder2(a,b,xo,n)
alpha = 0.25;
h = (b-a)/n;
x = zeros(1,n+1);
t = zeros(1,n+1);
x(1) = xo;
t(1) = a;

for i=1:n
    x(i+1) = x(i) + (1-1/(2*alpha))*h*x(i) + ...
        (1/(2*alpha))*h*(x(i)+alpha*h*x(i));
    t(i+1) = t(i) + h;
end
end
