function min_cuad_per

    w = 2*pi;
    Tp = 10;
    N = 8;
    g = [1;1;1;1;0;0;0;0];
    Dt = Tp/N;
    dim = N-1;
    k = floor(dim/2);

    for i=1 : N
        t(i) = i * Dt;
    endfor

    figure(1)
    plot(t, g, 'or')

    phi = calcular_matriz_phi(N, dim);

    display(phi);

end

function [phi] = calcular_matriz_phi(N, dim)

    phi = zeros(N, dim);

    w = 2*pi;
    k = 1; 
    phi(:, 1) = 1;

    %Se va a completar una matriz de N columnas y N filas. Cada columna corresponde a un vector columna PHI_i dependiendo de la base.

    for i=2 : N 
        if(mod(i, 2) == 0)
            %% Llena columna par con Phi_2k
            for j=1 : N
                phi(j,i) = cos(k*(w/N)*(j-1));
            endfor 
        else
            %% Llena una columna impar con Phi_2k+1
            for j=1 : N
                phi(j,i) = sin(k*(w/N)*(j-1));
            endfor 
            %% aumenta k en 1
            k = k + 1;
        end
    end

end