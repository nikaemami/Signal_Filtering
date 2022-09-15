function [y,u] = HW1_sensor(n)
w = mod(n,1000);
n0 = mod(w,10);
w = (w - n0)/10;
n1 = mod(w,10);
w = (w - n1)/10;
n2 = mod(w,10);
%%
t = 0:1:99+30;
u = (n1+2)*sin((n0+2)*t)+(n0+n2+1)*(n1+2)*sin((n0+2)*(n2+3)*t)+(n1+n2+n0+2)*sin((n0+n2+n1)*t)+(n1+n0+6)*sin((n1+2)*10*t)+(n1+5)*sin((n0+3)*t)+(n1*n2+2)*sin((n2+2)*t)+(n1+n2+2)*sin((n1+10)*t);
%%
a1 = 1.8;
a2 = 1.203;
a3 = 0.3743;
a4 = 0.05425;
a5 = 0.00294;
b0 = 1.1;
b1 = 4.3;
b2 = 2.5;
y(1:5) = 0;
for i = 6:length(u)
    y(i) = -[a1 a2 a3 a4 a5]*y(i-1:-1:i-5)' + [b0 b1 b2]*u(i:-1:i-2)';
end
y = y(end-99:end);
u = u(end-99:end);
end