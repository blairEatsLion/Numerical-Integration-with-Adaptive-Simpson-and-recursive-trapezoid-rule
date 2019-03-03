function [numI,level] = adaptSimpson(f,a,b,tol,level,level_max,fa,fb,fc)

% Input:  fun  = function name: m file
%         a,b  = lower and upper bound
%         tol  = error tolerance
%         maxLevel 
% Output:  numI = approximate value of the integral

level = level + 1; 
h = b - a;
c = (a + b)/2;

I1 = h*(fa + 4*fc + fb)/6;

d = (a + c)/2;
e = (c + b)/2;
fd = feval(f,d);
fe = feval(f,e);
I2 = h*(fa + 4*fd + 2*fc + 4*fe + fb)/12;

global count;
count = count + 2;
if level > level_max
    numI = I2;
else
if abs(I2 - I1) < 15*tol
    numI = I2;  % numI = I2 + 1/15* (I2 - I1)
else
    numI = adaptSimpson(f, a, c, tol/2, level, level_max,fa,fc,fd) + adaptSimpson(f, c, b, tol/2, level, level_max,fc,fb,fe);
end
end
%fprintf('adaptive Simpson result %i, evaluated %i times  \n\n', numI, count);



