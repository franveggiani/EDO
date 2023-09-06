function runge_kutta_sistema_01

    y0_1 = 0;
    y0_2 = 0;

    t0 = 0;

    dt = 0.01;
    ndt = 2000;

    w = 1;

    t = zeros(1, ndt);
    y = zeros(2, ndt);

    k1 = zeros(2,1);
    k2 = zeros(2,1);

    t(1)=t0;
    y(1,1) = y0_1;
    y(2,1) = y0_2;

    %RANGE KUTTA

    for j=1: ndt-1

        k1 = dt * funcion(y(:,j), t(j));

        tg = t(j) + (dt/(2*w));
        yg = y(:,j) + k1/(2*w);

        k2 = dt * funcion(yg, tg);

        y(:, j+1) = y(:,j) + (1-w) * k1 + w * k2;
        t(j+1) = t(j) + dt;

    endfor

    figure(1)
    plot(t, y(1,:), 'b', t, y(2,:), 'r')
    grid on

end

function [fy]=funcion(z,x)
    fy(1,1) = (0*z(1) + 1*z(2)) + sin(2.5*x)*0;
    fy(2,1) = (-4*z(1) + 0*z(2)) + sin(2.5*x)*-1;
end