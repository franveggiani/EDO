function runge_kutta

    %Definiciones%

    w=1;

    dt=0.01;
    ndt = 1000;

    y=zeros(ndt, 1);
    t=zeros(ndt, 1);

    %Valores iniciales

    y(1) = 4;
    t(1) = 0;

    %Euler

    for j=1:ndt-1
        k1 = dt * funcion(t(j), y(j));
        yg = y(j) + k1/(2*w);
        tg = t(j) + dt/(2*w);
        k2 = dt * funcion(tg, yg);
        y(j+1) = y(j) + (1-w) * k1 + w * k2;
        display(yg);
        t(j+1) = t(j) + dt;
    endfor

    %Comparación

    figure(1)
    plot(t, y, 'r');

end

function fy=funcion(x,z)
    fy = (x/2) - (z/2);
end