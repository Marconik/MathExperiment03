function y=k(x,i)
global N
if x<=i/(N+1) & x>(i-1)/(N+1)
    y=(x-(i-1)/(N+1))*(N+1);
elseif x>i/(N+1) & x<(i+1)/(N+1)
    y=-(x-(i+1)/(N+1))*(N+1);
else
    y=0;
end
end