function euler_04

    %definiciones
    dt = 0.1;
    ndt = 50;

    y = zeros(ndt, 1);
    t = zeros(ndt, 1);

    y(1) = 1;
    t(1) = 0;

    %Euler
    for i=1:ndt-1
        y(i+1) = y(i) + dt * f_pendiente(t(i), y(i));
        t(i+1) = t(1) + (i*dt);
    endfor

    %Comparación
    for j=1:ndt
        yex(j) = e^(-(t(j)^2)/2);
        err(j) = abs(yex(j) - y(j));
    endfor

    figure(1)
    plot(t, y, 'r');

    figure(2)
    plot(t, y, 'black', t, yex, 'b', t, err, 'red')

    normer = norm(err, inf);
    display(normer);
    
    %Integración por trapecios
    ITrap = 0;
    
    for k=1 : ndt-1
        ITrap = ITrap + ((y(k)+y(k+1))/2)*dt;
    endfor


    display(ITrap);

    %Derivación
    for i = 1 : ndt
        t_derivada(i) = i*dt;
        if(i==1)
            yprima(i) = (-3 / (2*dt)) * y(i) + (4 / (2*dt)) * y(i+1) + (-1 / (2*dt)) * y(i+2);
        elseif(i>1 && i < ndt)
            yprima(i) = (-1 / (2*dt)) * y(i-1) + (0) * y(i) + (1 / (2*dt)) * y(i+1);
        else 
            yprima(i) = (3 / (2*dt)) * y(i) + (-4 / (2*dt)) * y(i-1) + (1 / (2*dt)) * y(i-2);
            display("b");
        endif
    endfor

    %Derivada segunda
    for i = 1 : ndt
        t_derivada2(i) = i*dt;
        if(i==1)
            yprima2(i) = (2/dt^2) * y(i) + (-5/dt^2) * y(i+1) + (4/dt^2) * y(i+2) + (-1/dt^2) * y(i+3);
        elseif(i>1 && i < ndt)
            yprima2(i) = (1 / dt^2) * y(i-1) + (-2/dt^2) * y(i) + (1/dt^2) * y(i+1);
        else
            yprima2(i) = (2/dt^2) * y(i) + (-5/dt^2) * y(i-1) + (4/dt^2) * y(i-2) + (-1/dt^2) * y(i-3);
            display("b");
        endif
    endfor

    figure(3)
    plot(t, yprima, "blue", t, yprima2, "red", t, y, "black");

end


function fy = f_pendiente(x,z)
    fy = - x * z
end