function [x,y] = bwEuler(f,interval,IC,m)

a = interval(1); 
b = interval(2); 
h = (b-a)/m;
x = linspace(a,b,m+1)'; 
y = zeros(length(IC),m+1); 
y(:,1) = IC'; 
for i = 1:m
    x_i = x(i); 
    y_i = y(:,i); 
    
    k_1 = h*f( x_i,y_i);
    k_2 = h*f( x_i+(1/2)*h , y_i + (1/2)*k_1);
    k_3 = h*f( x_i - h , y_i + (1/2)*k_1 - (3/2)*k_2);
    k_4 = h*f( x_i + h , y_i + (4/3)*k_2 - (1/3)*k_3);
     
    y(:,i+1) = y(:,i) + (1/6)*k_1 + (2/3)*k_2 + (1/6)*k_4;
end
y = y'; 

