function y=Dk(x,i)
global N
if x<=i/(N+1) & x>(i-1)/(N+1)
    y=(N+1);
elseif x>i/(N+1) & x<(i+1)/(N+1)
    y=-(N+1);
else
    y=0;
end
end