function aprox_3 

    alpha = 0.05;
    Tp = 3*((2*pi)/0.5);
    N = 100;
    dt = Tp / N
    t0 = 0;

    f0 = 1/N;
    w0 = (2*pi)*f0;
    wd = (2*pi)/Tp;
    dw0 = w0/dt;

    m = (N-1)/2
    dim = 2*m+1;

    for i=1 : N
        t(i) = t0 + (i-1)*dt;
        g(i,1) = 10*cos(0.5*t(i)) + 2*cos(5*t(i));
    end

    figure(1)
    plot(t,g,"red")
    title("Función g(t)")

    phi(:,1) = 1;
    for i=1 : N
        for k=1 : m
            phi(i ,2*k) = cos(k*wd*(t(i)-t(1)));
            phi(i ,2*k+1) = sin(k*wd*(t(i)-t(1)));
        endfor
    end

    %phi'*phi*a = phi'*g

    ladoa = phi'*phi;
    ladob = phi'*g;

    a = inv(ladoa) * ladob;

    p = phi * a;
    
    figure(2)
    plot(t,p,"blue", t, g, "red")
    title("g(t), p(t)")

    A(1,1) = a(1);

    for i=1 : m           %2                 %3
        A(i+1, 1) = abs(a(2*(i)) + a(2*(i)+1));         %sqrt(a(2*(i))^2 + a((2*(i))+1)^2); 
        phase(i) = atan(a((2*(i)+1))/a(2*(i)));
    end 

    f = dw0*(1:(m+1));                                  %Vector de frecuencias

    bar(f,A)
 
end