function diff_coefficient=NewtonInterpolation(x,y)
%NewtonInterpolation Finds Coefficients of Newton interpolation polynomial
%    [b0 b1 b2...] = NewtonInterpolation(x,y) where vector [b0 b1 b2...] is
%    the coefficients of Newton interpolation polynomial:
% 
%    N(x) = b0+b1(x-x0)+b2(x-x0)(x-x1)+...
% 
% Note that both x, y should be 1-D vector with the same dimension.

% comparing size of x and y for robust programming
if ((size(x,2)-size(y,2)~=0)...
        ||...
        (size(x,1)~=1)...
        ||...
        (size(y,1)~=1))
    error('x and y must both be 1-D vector with the same dimension.')
end

n=length(x);
% NOTICE that to save memory, y actually holds all difference coefficient
% for the final polynomial function. So let's reform y this way:
y=y';
y(n,n)=0;
% this loop complete y as difference coefficient triangle
for column=2:n
    for row=column:n
        y(row,column)=(y(row,column-1)-y(row-1,column-1))/...
            (x(row)-x(row-column+1));
    end
end
% extracting coefficient from y to diff_coefficient
diff_coefficient(n)=0;
for row=1:n
    diff_coefficient(row)=y(row,row);
end
end