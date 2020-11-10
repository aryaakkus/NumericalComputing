function [x,t] = RungeOrder4(a,b,xo,n)
h = (b-a)/n;
x = zeros(1,n+1);
t = zeros(1,n+1);
x(1) = xo;
t(1) = a;

for i=1:n
    K1 = h*x(i);
    K2 = h*(x(i) + (1/2)*K1);
    K3 = h*(x(i)+(1/2)*K2);
    K4 = h*(x(i)+K3);
    x(i+1) = x(i) + (1/6)*(K1+2*K2+2*K3+K4);
    t(i+1) = t(i) + h;
end
end