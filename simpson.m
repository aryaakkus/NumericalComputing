function [numI,calls,error] = simpson(a,b,error,level,level_max,calls)
if level == 1
    setCalls(0);
end
    
h = b - a;
c = (a+b)/2;
I1 = h*(f(a)+4*f(c)+f(b))/6;
level = level +1;
d = (a+c)/2;
e = (c+d)/2;
I2 = h*(f(a) + 4*f(d) + 2*f(c) + 4*f(e) + f(b))/12;
if level >= level_max
    numI = I2;
else
    if abs(I2-I1) <= 15*error 
        numI = I2 + (1/15)*(I2-I1);
    else
        numI = simpson(a,c,error/2,level,level_max,calls) + ...
            simpson(c,b,error/2,level,level_max,calls);
        setCalls(getCalls + 2)
    end
end

if level == 2
    calls = getCalls();
end
    
end

function f = f(x)
f = (2/sqrt(pi))*exp(-(x^2));
end

function r = getCalls()
global calls;
r = calls;
end

function setCalls(val)
global calls
calls = val;
end