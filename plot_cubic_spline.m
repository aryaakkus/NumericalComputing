function plot_cubic_spline(x,s0,s1,s2,s3)

n = length(x);

inner_points = 20;

for i=1:n-1
   xx = linspace(x(i),x(i+1),inner_points);
   xi = repmat(x(i),1,inner_points);
   yy = s0(i) + s1(i)*(xx-xi) + ... 
     s2(i)*(xx-xi).^2 + s3(i)*(xx - xi).^3;
   plot(xx,yy,'b')
   plot(x(i),0,'r');
end