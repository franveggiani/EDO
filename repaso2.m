function repaso2

    w = 20;
    N = 2000;
    tf = 10*((2*pi)/w);
    t0 = 0;
    dt = (tf-t0)/N;
    sigma = 0.1*w;

    y(1,1) = 0;
    y(2,1) = 0;

    for i=1 : N
        t(i+1) = (i) * dt;
        g(i) = 1; 
        k1 = dt * f_pend(g(i), y(:,i));
        y(:,i+1) = y(:,i) + k1;
    end

    figure(1)
    plot(t, y(2,:), 'red', t, y(1,:), 'blue');

    for i=1 : N + 1
        h(i) = (e^(-sigma*t(i))*sin(w*t(i))/(w));
    end

    figure(2)
    plot(t, h, 'blue', t, y(2,:), 'red');

    norm(h)

    norm(h-y(2,:))

    for i=1:N+1
        if(i == 1) 
            yd(i) = (-3*h(i) + 4*h(i+1) - 1*h(i+2))/(2*dt);
        elseif (i > 1 && i < N+1)
            yd(i) = ((-1)*h(i-1) + 0 + 1*h(i+1))/(dt*2);
        else
            yd(i) = (3*h(i) - 4*h(i-1) + 1*h(i-2))/(dt*2);
        endif
    end

    figure(3)
    plot(t, yd, 'red')
    grid on


end

function [fy] = f_pend(x,y)

    w = 20;
    sigma = 0.1*w;

    fy(1,1) = y(1) * 0 + y(2) * 1 + 0;
    fy(2,1) = -(sigma^2 + w^2)*y(1) - 2*sigma*y(2) + 1*x(1);

end