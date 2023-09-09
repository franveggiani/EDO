function integrador

    %Definiciones iniciales

    dt = 0.01;
    ndt = 500;

    dim = ndt + 1;

    y = zeros(ndt, 1);
    x = zeros(ndt, 1);

    y(1) = 1/10;
    t(1) = 0;

    %EULER
    for i=1 : dim - 1 
        k = dt * f_pend(t(i), y(i));
        y(i+1) = y(i) + k;
        t(i+1) = t(1) + i * dt;
    endfor

    figure(1)
    plot(t, y, "black")
    grid on

    %FUNCION EXACTA Y ERROR
    for i=1 : dim
        yex(i) = (1/10)*e^(-2*t(i)) + t(i)*e^(-2*t(i)); 
        err(i) = abs(yex(i) - y(i));
    endfor

    figure(2)
    plot(t, yex, "blue", t, err, "red", t, y, "black")
    grid on

    %DERIVADA PRIMERA
    for i=1 : dim 
        if (i == 1)
            yprima(i) = (-3/(2*dt)) * y(i) + (4/(2*dt)) * y(i+1) + (-1/(2*dt)) * y(i+2);
        elseif (i < dim) 
            yprima(i) = (-1/(2*dt)) * y(i-1) + 0 * y(i) + (1/(2*dt)) * y(i+1);
        else
            yprima(i) = (3/(2*dt)) * y(i-2) + (-4/(2*dt)) * y(i-1) + (1/(2*dt)) * y(i);
        endif
    endfor    

    figure(3)
    plot(t, y, "black", t, yprima, "red");
    grid on

    %DERIVADA SEGUNDA
    for i=1 : dim
        if (i == 1)
            yprima2(i) = (2/(dt^2)) * y(i) + (-5/(dt^2)) * y(i+1) + (4/(dt^2)) * y(i+2) + (-1/(dt^2)) * y(i+3);
        elseif (i < dim)
            yprima2(i) = (1/(dt^2)) * y(i-1) + (-2/(dt^2)) * y(i) + (1/(dt^2)) * y(i+1);
        else
            yprima2(i) = (2/(dt^2)) * y(i-3) + (-5/(dt^2)) * y(i-2) + (4/(dt^2)) * y(i-1) + (-1/(dt^2)) * y(i);
        endif
    endfor

    figure(4)
    plot(t, y, "black", t, yprima, "red", t, yprima2, "blue");
    grid on

end

function fy = f_pend(x,z)
    fy = e^(-2*x) - 2 * z;
end