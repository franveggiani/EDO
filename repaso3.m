function repaso3

    clc

    #PONER FORMAT LONG
    format long

    g = load('RegistroRecuperatorio2.txt');
    N = length(g)
    dt = 0.083776;
    w0 = (2*pi)/N
    dw = w0 / dt
    p = 8 * dw;
    A1 = 1/2;

    for i=1 : N
        t(i) = (i-1) * dt;
        h(i) = A1 * t(i) * exp(-p*t(i));
    end 

    figure(1);
    plot(t, g, 'red');
    grid on;

    norm(g)

    G = abs(fft(g));

    norm(G)

    figure(2)
    stem(G(1:N/9))
    grid on;

    figure(3)
    plot(t, h, 'b');
    grid on;

    zz = dt * conv(h,g);

    figure(4)
    plot(t, zz(1:length(t)), 'b');
    grid on;

    H = fft(h);

    Yc = H.*G;

    yc = ifft(Yc);

    figure(5)
    plot(t, zz(1:length(t)), 'b', t ,yc, 'red');
    grid on;

end
