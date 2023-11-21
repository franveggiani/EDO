function convolucion_01

    p = 0.5;
    A = 0.2;

    t0 = 0;
    tf = 2*(5/p);

    N = 200;
    dt = (tf-t0)/N;

    for i = 1 : N
        t(i) = t0 + (i-1)*dt;
        g(i) = 1;
        h(i) = e^(-p*t(i));
    end

    y = conv(h, A*g);

    figure(1)
    plot(t, y(1:length(t)));
    title("Solución con convolución")

    figure(2)
    plot(t, A*g, "red", t, h, "blue");
    title("A*g(t) y h(t)")



end