function T = recTrapezoid(f,a,b,e)
%   f   name of function
%   a   left  endpoint of [a,b]
%   b   right endpoint of [a,b]
%   T   recursive trapezoidal rule list
%   n   number of levels
%   r   final result 

n = 1;
h = (b-a)/n; 
T = zeros(1,n+1);

% base case at n = 1
%T(2) = 0.5 * h * (f(a)+f(b)) + h * f(a+(2*1-1)*h);  %i=1 when n = 1
T(2) = 0.5 * h * (f(a)+f(b));

r = T(2);
count = 2;
while(abs(T(2^n)-T(2^(n-1)))> e)
  %fprintf('at %i with result %i \n', n,r);
  h = h/2;
  s = 0;
  for i=1:2^(n-1)
      count = count+1;
    x = a + h*(2*i-1);
    s = s + feval(f,x);
  end
  n = n + 1;
  
  T(2^n) = T(2^(n-1))/2 + h*s;
  r = T(2^n);
end

fprintf('recursive Trapezoid result %i, evaluated %i times  \n\n', T(2^n),count);