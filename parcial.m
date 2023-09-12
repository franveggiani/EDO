function parcial 

    %Definiciones

    t0 = 0.000;
    tf = 15.7080;
    N = 3000;
    dt = (tf - t0)/N;
    dim = N + 1;

    y = zeros(2, N);
    x = zeros(1, N);

    y(1) = 0;
    y(2) = 0;
    t(1) = 0;

    %Euler

    for i=1 : dim - 1
        k1 = dt * f_pend(t(i),y(:,i));
        y(:,i+1) = y(:,i) + k1;
        t(i+1) = t(i) + dt;
    endfor

    figure(1)
    plot(t, y(1,:), "black");

    %Derivada

    for i=1 : dim
        if(i==1)
            yprima(i) = (-3/(2*dt)) * y(i) + (4/(2*dt)) * y(i+1) + (-1/(2*dt)) * y(i+2);
        elseif(i<dim)
            yprima(i) = (-1/(2*dt)) * y(i-1) + 0 * y(i) + (1/(2*dt)) * y(i+1);
        else 
            yprima(i) = (3/(2*dt)) * y(i-2) + (-4/(2*dt)) * y(i-1) + (1/(2*dt)) * y(i);
        endif
    endfor

    figure(2)
    plot(t, yprima ,"black");

    %Valores concretos

    display(y(1, dim));
    display(y(2, dim));

    %Integral de Y1*Y1

    I11 = 0;

    for i=1 : dim
        func1(i) = y(1,i) * y(1,i);
        if(i >= 2)
            I11 = I11 + ((func1(i-1) + func1(i))/2) * dt;
        endif
    endfor

    display(I11);

    %Integral I12

    I12 = 0;
    
    for i=1 : dim
        func2(i) = y(1,i) * yprima(1,i);
        if(i >= 2)
            I12 = I12 + ((func2(i-1) + func2(i))/2) * dt;
        endif
    endfor

    display(I12);

    % I11/I12

    display(I11/I12);

    %Método simpson

    ISimp = 0;

    for i=1:2:dim-1
        ISimp = ISimp + (y(1,i) + 4*y(1,i+1) + y(1,i+2)) * (dt/3);
    endfor

    display(ISimp);

    %Comparación con el de los trapecios para corroborar que esté bien 

    ITrap = 0;

    for i=1:dim-1
        ITrap = ITrap + ((y(1,i) + y(1,i+1))/2) * dt;
    endfor

    display(ITrap);

end

function [fy] = f_pend(x,z)

    fy(1,1) = z(2);
    fy(2,1) = -(4^2)*z(1) - sin(4.8 * x);

end