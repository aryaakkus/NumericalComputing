function interpolation_driver(num_points)
function1= @(x) 1./(1+ 25*x.^2);
x = linspace(-1,1,num_points);
x2=linspace(-1,1,13);
disp(x2)
 x=double.empty(0,7);

% for i=0:6
%     x(i+1)=cos((2*i + 1)*pi/(2*6 + 2));
% end
% disp(x)
y = function1(x);
y2=function1(x2);
%disp("f(x) is:")
%disp("The cubic spline S(x)'s coefficients are")
[s0,s1,s2,s3] = cubic_spline(x,y);
s= cubic_spline(x,y);
%disp("The Newton (in the newton form) coefficients are")
%diff_coefficient=NewtonInterpolation(x,y);
%disp("The Newton interpolated polynomial P(x)'s coefficients are")
p=newpoly(x,y);
c=leastSquares(x,y);
g = @(x) c(1) + c(2)*x.^2 + c(3)*x.^4;
plot_points = 1000;
xx = linspace(-1,1,plot_points);
yy = function1(xx);

 T =zeros(13,4);
  for k = 1 : length(x2)
     j = x2(k);
  T(k,1) = feval(function1, j);
  T(k,2) = feval(function1,j)-polyval(p,j);
  T(k,3) = feval(function1,j)-polyval(s,j); 
  T(k,4) = feval(function1,j)- feval(g,j);
  end 
VarNames = {'fx', 'fx-px', 'fx - Sx', 'fx - gx'};
 N=matlab.lang.makeValidName(VarNames);
 table(T(:,1),T(:,2),T(:,3),T(:,4), 'VariableNames', N)  

% plot(xx,yy,'r');
% hold on;
% plot_cubic_spline(x,s0,s1,s2,s3);
% plot(xx,polyval(p,xx),'g')
% plot(xx, g(xx), 'm');
% hold on;