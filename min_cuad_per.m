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

    phi = calcular_matriz_phi(N, dim); % Llamada a función

    % PHI' * PHI * a = PHI' * g

    A = phi' * phi;
    B = phi' * g;

    display(A)

    %Coeficientes (vector a)

    a = inv(A) * B;

    display(a);

    %Amplitud

    [tAmp, Amp] = calcular_amplitudes(dim, a); % Llamada a función

    display(Amp');

    %Gráfico de barras

    figure(2)
    bar(tAmp, Amp)

    %Función contínua

    dtc = 1/100;
    ndt = 100;

    P(1) = a(1);
    t(1) = 0;

    %P(i) =  cos(1*(w/N)*(i - t(1))) + sin(1*(w/N)*(i - t(1))) + cos(2*(w/N)*(i - t(1))) + sin(2*(w/N)*(i - t(1))) + cos(3*(w/N)*(i - t(1))) + sin(3*(w/N)*(i - t(1)));


end

function [phi] = calcular_matriz_phi(N, dim)

    phi = zeros(N, dim);

    w = 2*pi;
    k = 1; 
    phi(:, 1) = 1;

    %Se va a completar una matriz de N columnas y N filas. Cada columna corresponde a un vector columna PHI_i dependiendo de la base.

    for i=2 : dim 
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

function [tAmp, Amp] = calcular_amplitudes(dim, a) % Devuelve el vector tAmp para poder graficar y el vector Amp que es el vector de amplitudes

    Amp(1) = a(1); % A(0) = a0
    tAmp(1) = 0;

    contador = 2;

    for i=2 : ((dim-1)/2) + 1 

        x = a(contador); % Se obtiene elemento a (elementos pares del vector a)
        y = a(contador + 1); % Se obtiene el elemento b (elementos impares del vector b)

        Amp(i)=(x^2 + y^2)^(1/2); % Se calcula la amplitud

        tAmp(i) = tAmp(i-1) + i; % Vector t para poder graficar

        contador = contador + 2;

    endfor

end