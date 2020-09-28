function [x,y] = bwEuler(f,interval,IC,m)

a = interval(1); 
b = interval(2); 
h = (b-a)/m;
x = linspace(a,b,m+1)'; 
y = zeros(length(IC),m+1); 
y(:,1) = IC'; 
for i = 1:m
    x_ii = x(i+1); 
    y_i = y(:,i); 
    
    res = @(Y)(y_i + h*f(x_ii,Y) - Y ); 
    options = optimoptions('fsolve','Display','off');
    y(:,i+1) = fsolve(res, y_i,options);
end
y = y'; 
