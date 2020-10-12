function [x,y] = adaptEuler(f,interval,IC,tol)

a = interval(1); 
b = interval(2); 
x = [a]'; 
y = IC'; 
h = 1e-1;
x_i = a;
y_i = IC';
p = 1;
tol = 1e-3;
while x_i <= b
    
    %calcul y + 1
    f_i = f(x_i,y_i);
    y_h = y_i + h*f_i;
    %calcul y + 1 precisa
    y_h2 = y_i +(h/2)*f_i;
    f_h2 = f(x_i + h/2,y_h2);
    y_h2 = y_h2 + (h/2)*f_h2;
    %calcul eps
    eps = norm((y_h2 -y_h) /2^(p-1));
    % if
    if eps < tol
        
        x_i = x_i+h;
        x = [x x_i];
        y = [y y_h2];
        y_i = y_h2;
    end
    % nova h
    h= h*(tol/eps) ^(1/(1+p));
end
y = y'; 
 % tenim h del pas anterior
 % Eps=(y_(h/2) -y_(h)) /2^(p-1)
 %  h=h(eps/tol) ^(1/(1+p))
 % calculem eps
 % correcte? golokos i mantenim la h
 % contenedor? nova h i tornem a comprovar