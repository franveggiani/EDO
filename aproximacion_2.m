function aproximacion_2

    y = [1.3; 4.2; 5.7; 8.2];

    phi = [1, 0.5; 1, 1.5; 1, 2.5; 1, 3.5];

    A = phi' * phi;
    B = phi' * y;

    a = inv(A) * B;

    display(a);

    p = phi * a;

    display(p);

    r = y - phi * a;

    display(r)

end