global lambda N
N=200;
x=(0:N)/(N);
h=x(2)-x(1);
y=zeros(1,N+1);

a=-0.5;
b=-0.25;
ya=-0.5;
yb=1;
z=1;
while z>=1e-12
    lambda=(a+b)/2;
    for i = 2 : N+1
        y(i)=RKF45(y(i-1),x(i-1),h);
    end
    fprintf("%.12f %.14f \n",lambda,y(N+1));
    if ya*y(N+1)<0
        b=lambda;
        yb=y(N+1);
        z=abs(yb);
    else
        a=lambda;
        ya=y(N+1);
        z=abs(ya);
    end
end
