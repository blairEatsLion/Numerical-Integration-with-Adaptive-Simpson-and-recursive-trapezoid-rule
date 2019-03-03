%Xiaohui Wang 260719359

recTrapezoid(funcc,0,2*pi,10^(-4));

fa = feval(funcc,0);
fb = feval(funcc,2*pi);
fc = feval(funcc,pi);
global count;
count = 3;
res = adaptSimpson(funcc,0,2*pi,10^(-4),0,20,fa,fb,fc);
fprintf('Adaptive Simpsons gives result %d \n', res);
fprintf('number of evaluations %d \n', count);