function c = leastSquares(X,Y)
A = [];    
g = @(x) [1,x^2,x^4];
n = length(X);
for i = 1:n
    A = [A;g(X(i))];
end
c = A\(Y.');

