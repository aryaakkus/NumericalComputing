function trapApproximate()
n=1;
It=0;
h=1/2;
ItPrevious=(1/2)*h*(2/sqrt(pi))*(exp(0)+(exp(-1)))+h*(2/sqrt(pi))*(exp(-(h^2)));

while((abs(It-erf(1)))>10^(-6))
    n=n+1;
    h=1/(2^n);
    It=0;
    for i=1:(2^(n-1))
        It=It+(2/sqrt(pi))*exp(-((2*i-1)*h)^2);
    end
    It=(1/2)*ItPrevious*It*h;
    ItPrevious=It;
end
disp(n)
disp(It)
disp("the error is");
error=erf(1)-It;
disp(error)
end