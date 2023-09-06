function int_02

    w = 2;

    t0 = 0;
    tf = 6/w;

    n_intervalos = 6;
    dim = n_intervalos + 1;

    dt = (tf-t0)/6;

    %Funcion sin integrar
    
    for j=1 : dim
        t(j) = t0 + (j-1) * dt;
        y(j) = e ^ (-w * t(j));
    endfor

    figure(1)
    plot(t, y, 'ob')
    grid on

    %Valor integral definida

    ITrap = 0;

    for i=1 : dim-1
        ITrap = ITrap + dt * ((y(i+1) - y(i))/2);
    endfor

end