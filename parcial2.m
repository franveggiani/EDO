function parcial2

    %TDF 

    g=load("RegistroParcial.txt", "-ascii");
    N = length(g)
    dt = 0.06732;
    A1 = 1/3;

    t0 = 0;

    for i=1 : N
        tn(i) = t0 + (i-1)*dt;
    end

    figure(1)
    plot(tn,g,"red");

    y_max=max(g(1:N/2))                 %Sacamos el máximo de la funcion

    find(g==y_max)                      %Encontramos el punto donde g es máximo
    g(304)                              %valor de g máximo
    tn(304)                             %valor de tn donde g es máximo

    %%VAMOS MESSI%%

    %Valores máximos de TDF

    G_tdf = fft(g);
    G_tdf_abs = abs(G_tdf);

    G_tdf_MAX = max(G_tdf_abs)          %Sacamos el máximo de la funcion

    diezporciento = 0.10*G_tdf_MAX

    bar(G_tdf_abs(1:10));

    %Aproximacion de mínimos cuadrados

    Tp = dt * N;
    wd = (2*pi)/Tp;
    w0 = (2*pi)/N;

    for i=1:N
        phi(i,1)=1;
        for k=1:3
            phi(i,2*k)=cos(k*w0*(i-1));
            phi(i,2*k+1)=sin(k*w0*(i-1));
        endfor
    endfor

    a = inv(phi'*phi)*phi'*g;

    sumatoria = 0;    

    for i=1 : N/2
        for k=1 : 3
            sumatoria = sumatoria + a(2*k) * cos(k*wd*(tn(i)-tn(1))) + a(2*k+1) * sin(k*wd*(tn(i)-tn(1)));
        end
        p(i) = a(1) + sumatoria;
    end

    figure(2)
    plot(tn(1:N/2), p, "red")

    Pa_max = max(p)

    puntomax = find(p == Pa_max)

    tPa_max = tn(puntomax)

    %%Convolución

    A1 = 1/3;

    for i=1 : N
        tn(i) = t0 + (i-1)*dt;
        h(i) = exp(-A1*tn(i));
    end

    y = dt * conv(g,h);
    
    for n=1:N
        y2(n) = 0;
        for j=1:n
          y2(n) = y2(n) + g(n + 1 - j) * h(j) * dt;
        endfor
    endfor

    figure(3)
    plot(tn, y(1:length(tn)), "red", tn, y2((1:length(tn))), "black")

end