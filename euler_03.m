function euler_03

    %Definiciones%

    dt=0.01;
    ndt = 100;

    y=zeros(ndt, 1);
    t=zeros(ndt, 1);

    %Valores iniciales

    y(1) = 1;
    t(1) = 0;

    %Euler

    for j=1:ndt-1
        k1 = dt*funcion(t(j), y(j));
        y(j+1) = y(j) + k1;
        t(j+1) = t(j) + dt;
    endfor

    %Comparación

    for i=1:ndt
        yex(i) = 1/(1-t(i)^2);
        er(i) = abs(yex(i)-y(i));
    endfor

    figure(1)
    plot(t, y, 'r');

    figure(2)
    plot(t, yex, 'b', t, y, 'r', t, er, 'g');

end

function fy=funcion(x,z)
    fy = 2*x*(z^2);
end