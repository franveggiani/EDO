function aproximacion_3

    y = [0.31568758; 0.31765512; 0.31814624];

    phi = [1, 1/(5^2); 1, 1/(10^2); 1, 1/(20^2)];

    A = phi' * phi;
    B = phi' * y;

    a = inv(A) * B;

    r = y - phi * a;

    display(a);

    display (r);


end