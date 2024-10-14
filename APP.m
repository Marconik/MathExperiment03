%Initialize
global lambda N
N=200;
x=(0:N+1)/(N+1);
h=x(2)-x(1);
A=zeros(N,N);   %Global stiffness matrix
F=zeros(N,1);

lambda=-0.37;

%Compute the FEM system
for i = 1:N
    for j = 1:N
        A(i,j)=integral(@(t) Dk(t,i).*k(t,j)-lambda*sin(k(t,i)).^2.*k(t,j),0,1,ArrayValued=true,RelTol=1e-6);
    end
    F(i)=integral(@(t) (lambda*(1+sin(t).^2)+t).*k(t,i),0,1,ArrayValued=true,RelTol=1e-6);
end

%Solve the system and output the result
%
U=A\F;
rst=[0,U',0];
%

%Plot the exact solution and FEM solution
%{
y=(0:1e2)/(1e2);
ext=exactU(y);
plot(y,ext,'o');
hold on
%}
%
plot(x,rst,'o-',LineWidth=2);
grid minor
hold off
%

%Calculate error under Lebesgue norm and Hilbert norm
%{
s1=integral(@(t) (exactU(t)-U(1)*t/h).^2,x(1),x(2))+integral(@(t) (exactU(t)-U(N)*(x(N+2)-t)/h).^2,x(N+1),x(N+2));
s2=integral(@(t) (exactU(t)-U(1)*t/h).^2+(exactDU(t)-U(1)/h).^2,x(1),x(2))+integral(@(t) (exactU(t)-U(N)*(x(N+2)-t)/h).^2+(exactDU(t)+U(N)/h).^2,x(N+1),x(N+2));
for i = 2:N
    s1=s1+integral(@(t) (exactU(t)-U(i-1)*(x(i+1)-t)/h+U(i)*(x(i)-t)/h).^2,x(i),x(i+1));
    s2=s2+integral(@(t) (exactU(t)-U(i-1)*(x(i+1)-t)/h+U(i)*(x(i)-t)/h).^2+(exactDU(t)+U(i-1)/h-U(i)/h).^2,x(i),x(i+1));
end
s1=sqrt(s1);s2=sqrt(s2);
fprintf("%.12e %.12e\n",s1,s2);
%}