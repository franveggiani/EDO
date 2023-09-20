function aproximacion 

matriz = zeros(3, 2);
y = zeros(3, 1);

matriz = [1, 1 ; 2, 2.5; 3,4];
matriz_T = matriz';

y(1,1) = 2.3;
y(2,1) = 4.5;
y(3,1) = 7.3;

A = matriz_T * matriz;
B = matriz_T * y;


a = inv(A) * B;

display(a);

p = matriz*a;

display(p);

r = y - p; %Vector 3x1

display (r)

modr = (r(1,1)^2 + r(2,1)^2 + r(3,1)^2);

display(modr)

end

