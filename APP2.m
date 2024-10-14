%Initialize
global lambda N
N=200;
x=(0:N)/(N);
h=x(2)-x(1);
y=zeros(1,N+1);

lambda=-0.25;

for i = 2 : N+1
    y(i)=RKF45(y(i-1),x(i-1),h);
end

plot(x,y,'o-',LineWidth=0.5);
legend("lambda="+lambda);
grid minor
hold off