function int_01

    %Definiciones varias

    w = pi;

    t0 = 0;
    tf = 0.5;
    n_intervalos = 80;
    dim = n_intervalos + 1;

    dt = (tf-t0)/n_intervalos;


    %Funcion a integrar
    for j=1 : dim
        t(j) = t0 + (j-1) * dt;
        fy(j) = sin(w * t(j));
    endfor

    figure(1)
    plot (t, fy, 'or');

    %Integración por trapecios
    trap = 0;

    for i=1 : dim-1
        trap = trap + (dt * ((fy(i) + fy(i+1))/2));
    endfor

    display(trap), "La integral por trapecios es: ";

end