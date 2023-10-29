function aprox_nop_1

    Td = 5;                 %No nula en el intervalo Td
    Tp = 4*Td;             %Agrego el cuádruple de puntos %20 puntos
    N = 4*8;               %Inicialmente N = 8            %32 puntos
    dt = Tp/N               %Se mantiene constante

    t0 = 0;
    for i=1 : N
        t(i) = t0 + (i-1)*dt;
        if(t(i) < Td)
            g(i,1) = 1;
        else
            g(i,1) = 0;
        end
    end

    figure(1)
    plot(t,g,"xb")
    title("Función g(t) de duración Td y periodo Tp")
    grid on

    %Matriz phi

    m = (N-1)/2;
    dim = 2*m+1;
    wl = (2*pi)/Tp;
    w0 = (2*pi)/N;
    dw0 = w0/dt;

    phi(:, 1) = 1;
    for i=1 : N 
        for k=1 : m
            phi(i, 2*k) = cos(k * wl * (t(i) - t(1))); 
            phi(i, 2*k+1) = sin(k * wl * (t(i) - t(1))); 
        end
    end

    a = inv(phi'*phi)*(phi'*g);
    p = phi * a;

    figure(2)
    plot(t,g,"xb",t,p,"red")
    title("Función g(t) y aproximacion p(t)")
    grid on

    %Amplitudes

    %A(1,1) = a(1,1);

    %for i=1 : m
    %    A(i+1,1) = abs(a(2*(i)) + a(2*(i)+1));
    %end

    %f = dw0 * (1:(m+1));       %Vector de frecuencia

    %figure(3)
    %bar(f, A)

    %%FFT

    fft_g = fft(g, N);

    fft_g_abs = abs(fft_g);

    f = 1 * (0:(N/2));

    figure(4)
    bar(f, fft_g_abs(1:length(f)))

end