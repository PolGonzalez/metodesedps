function [x,y] = Heun(f,interval,IC,m)

a = interval(1); 
b = interval(2); 
h = (b-a)/m;
x = linspace(a,b,m+1)'; 
y = zeros(length(IC),m+1); 
y(:,1) = IC'; 
for i = 1:m
    x_i = x(i); 
    y_i = y(:,i); 
    f_i = f(x_i,y_i); 
    
    x_ii = x(i+1); 
    y_aux = y_i + h*f_i; 
    f_aux = f(x_ii,y_aux); 
    
    y(:,i+1) = y_i + h/2*(f_i+f_aux);
end
y = y'; 