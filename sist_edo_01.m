function sist_edo_01

    %definiciones iniciales

    ndt = 30000;
    dt = 0.001;

    t0 = 0; 
    y01 = 0;
    y02 = 10;

    t = zeros(1, ndt);
    y = zeros(2, ndt);

    t(1) = 0;
    y(1,1) = 0;
    y(2,1) = 10;

    for i=1 : ndt + 1
        k1 = dt * f_pend(t(i), y(:,i));
        y(:,i+1) = y(:,i) + k1;
        t(i+1) = i * dt;
    endfor

    figure(1)
    plot(t, y(1, :), "blue");

    figure(2)
    plot(y(1, :), y(2, :), "black");


end

function [fy]=f_pend(x,z)

    alfa = 3;

    fy(1,1) = 0 * z(1) + z(2) + sin(alfa * x) * 0;
    fy(2,1) = -9 * z(1) - 0.06 * z(2) + sin(alfa * x) * 15;

end