function aproximacion_2

  %registro del aula
  g = load("datosfuncion.txt", "-ascii");
  N = length(g);
  w0 = (2 * pi) / N;
  Dt = 0.042;
  t0=0;
  m=fix((N-1)/2);
  dim=2*m+1;


  Tp=N*Dt;      %Rango de Abscisas
  w1=(2*pi)/Tp; 

  %GRAFICA DE FUNCION G
  for k=1:N
    t(k)=t0+(k-1)*Dt;
  endfor

  figure(1)
  grid on
  plot(t,g,'b')

  %TDF

  tdfG=fft(g,N);      %TDF

  modulo=abs(tdfG);   %modulo

  %Crear un vector de frecuencias
  frecuencias=w1*(0:(N-1));

  %Grafica en frecuencias
  figure(2)
  plot(frecuencias(1:N/2), modulo(1:N/2))

  %Matriz PHI
  phi=zeros(N,dim);
  phi(:,1)=1;
  for j=1:N
    for k=1:m
      phi(j,2*k)=cos(w0*k*(j-1));
      phi(j,2*k+1)=sin(w0*k*(j-1));
    endfor
  endfor

  G=phi'*g;
  a=zeros(dim,1);

  a=inv(phi'*phi)*G;  %Otra forma de calcular 'a' mejor
  display(a)



  %Aprox con MIN Cuadrado y Funciones Trigonometricas
  pa=phi*a;

  figure(4)
  plot(t, pa,'r',t,g,'b')
  grid on
  legend


  %%NO PODEMOS VARIAR M PARA VER DIFERENTES RESULTADOS

  %h o g significa g convolucion h. h y g van a tener N elementos porque son en funcion de t.
  %y(t) va a tener 2 * N - 1 elementos

  %Convolucion
  k=3;
  p=w1*k;

  for k=1:N
      h(k)=e^(-p*t(k));
  endfor
  y=conv(g,h);

  display(length(y))

  figure(5);
  plot(t,y(1:(length(t))),'g');

endfunction