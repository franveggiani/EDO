function sist_edo_02 

    %definiciones iniciales

    dt = 0.001;
    ndt = 30000;

    t = zeros(1, ndt);
    y = zeros(2, ndt);

    t(1) = 0;
    y(1,1) = 0;
    y(2,1) = 10;

    for i=1 : ndt+1
        k1 = dt * f_pend(t(i), y(:,i));
        y(:,i+1) = y(:,i) + k1;
        t(i+1) = t(i) + dt;
    endfor

    figure(1)
    plot(t, y(1,:), "black");

    figure(2)
    plot(y(1,:), y(2,:), "black");

end

function [fy]=f_pend(x,z)

    alfa = -0.6;

    fy(1,1) = z(2)
    fy(2,1) = -4 * z(1) + alfa * z(2) + sin(4*x) * 15;

end