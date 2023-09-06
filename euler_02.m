function euler_02

    %Definición de cosas%
    dt=0.10;
    ndt=100;

    t0=0;
    y0=4;

    y=zeros(ndt, 1);
    t=zeros(ndt, 1);

    y(1) = y0;
    t(1) = t0;

    %Euler%
    for j=1:ndt-1 %Es ndt-1 porque acá se está definiendo el punto siguiente
        k1 = dt*f_ord_1(t(j), y(j));
        y(j+1) = y(j) + k1;
        t(j+1) = t(j) + dt;
    endfor

    figure(1)
    grid on
    plot(t, y, 'r');

    %Comparación%

    for i=1 : ndt %Es ndt porque acá no se está definiendo el siguiente punto sino el actual
        yex(i) = 6*e^(-t(i)/2)-2+t(i);
        er(i) = abs(yex(i)-y(i));
    endfor

    normer = norm(er, inf);

    display(normer), "Este es el error máximo";

    figure(2);
    plot(t, yex, 'b', t, y, 'r', t, er, 'g');

end 

function fy=f_ord_1(x,z)
    fy=(x/2)-((1/2)*z);
end