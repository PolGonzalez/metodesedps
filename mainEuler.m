% Numerical checking of absolute stability for Euler and Backward Euler
% methods solving dy/dx=a y with constant a
%
% ToDo:
% 1) Try different values of m and a=5,10,20 and experimentally guess
% the stability bound for ah (critical value)
% 2) Same for backward Euler
% 3) For a=-10, plot the error at x=0.3, in terms of $h$. What the is
% experimental order of convergence? Is it in agreement with the theory?
% 4) Do the same experimental analysis for Heun's method

interval=[0,pi];
IC=[1,0];
%f=@(x,y) a*y;
f = @(x,y) [-16*y(1) + 12*y(2) + 16*cos(x) - 13*sin(x);
    12*y(1) - 9*y(2) - 11*cos(x) + 9*sin(x)];
%analytical solution
xa=[0:0.01:pi]; ya=cos(xa);

[x,Y] = euler(f,interval,IC,100);
subplot(1,2,1);
figure(1), plot(x,Y(:,1),'*-',xa,ya,'k:') 
xlabel('x'), ylabel('Y'), 
title(sprintf('Euler (explicit)'))

E = [];
for i = 20:200
    m = i;
    [x,Y1]= euler(f,[0,pi],IC,m);
    ijk = [Y1(end,1) + 1,Y1(end,2)];
    E = [E,norm(ijk)];
    %E = [E,norm(ijk)/norm([Y2(end,1),Y2(end,2)])];
end
subplot(1,2,2);
figure(1),hold on,plot(log10([1:50]),log10(E),'-*');

% [x5,Ym5] = euler(f,interval,IC,5);
% [x10,Ym10] = euler(f,interval,IC,10);
% [x20,Ym20] = euler(f,interval,IC,20);
% [x40,Ym40] = euler(f,interval,IC,40);
% figure(1), plot(x5,Ym5,'o-',x10,Ym10,'o-',x20,Ym20,'o-',x40,Ym40,'o-',xa,ya,'k:') 
% xlabel('x'), ylabel('Y'), 
% title(sprintf('Euler (explicit) a=%g',a))
% legend('m=5','m=10','m=20','m=40','analytical')


