function Plotting()
a = 0;
b = 4;
xo = 1;
n = 40;

[y,x] = Euler(a,b,xo,n);
plot(x,y);

hold on

[y,x] = trapEuler(a,b,xo,n);
plot(x,y);

[y,x] = midpointEuler(a,b,xo,n);
plot(x,y,'s');

[y,x] = RungeOrder2(a,b,xo,n);
plot(x,y,'.');

[y,x] = RungeOrder4(a,b,xo,n);
plot(x,y);

legend('Euler','trapezoid','midpoint','R-K order 2','R-K order 4')
hold off
end




