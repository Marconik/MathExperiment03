function y=g(x,y)
global lambda
y=lambda*(1+sin(x).^2+sin(y).^2)+x;
end