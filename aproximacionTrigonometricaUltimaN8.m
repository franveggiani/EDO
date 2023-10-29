function aproximacionTrigonometricaUltimaN8
  % EN ESTE PROGRAMA LO QUE ESTÁ MAL ES EL VECTOR g, YA QUE ESTÁ DE 1 a N Y DEBERÍA SER DE 0 a Tp %
  clc, clear
  N=8;%numero de intervalos o puntos
  m=3;%tiene que ser menor que (N-1)/2
  pi=pi;
  w0=(2*pi)/N;
  dim=2*m+1;%%incognitas
  %%gt es una funcion periodica, el ultimo punto coincide con el primero
  %%g es un vector=[1 1 0 0]
  %%t es un vector= [0dt dt 2dt 3dt]
  %%n es el ORDEN de los componentes n=[1 2 3 4]
  %%Tita va desde 0 a 2pi
  %%AProximacion: por minimos cuadrados. Base={1; cos(algo);sen(algo) hasta lo que haga falta para hacer la aproximacion
  %%con la condicion de q las bases sean ortogonales entre si en el periodo 0-2pi
  %%CAMBIO DE VARIABLES, TRABAJAMOS EN EL DOMINIO TIEMPO
  %%tOMAMOS UN TITA CUALQUIERA Y COMPARANDO CON EL DOMINIO TIEMPO
  n=zeros(1,N);
  g=zeros(N,1);
  for k=1:N
    n(1,k)=k;
    if k<=N/2
      g(k,1)=1;
    else
      g(k,1)=0;
    endif
  endfor

  phi=zeros(N,dim);
  %%p(t)=a0 * 1 + ak cos(k * (2pi/TP)(n-1))
  %%n va desde 1 hasta N
  %%k va desde 1 a m

	phi(:,1) = 1;

  for n=1:N
    %%phi(n,1)=1;
    for k=1:m
      phi(n,2*k)=cos(k*w0*(n-1));
      phi(n,2*k+1)=sin(k*w0*(n-1));
    endfor
  endfor

  diag = phi'* phi			%%chequeamos que la matriz sea diagonal
  coef = phi'* g				%%vector de coeficientes

  alfa = zeros(dim,1);

  alfa(1,1)=coef(1,1)/N;
  for j=2:dim
##    alfa(k,1)=coef(k,1)/diag(k,k)  OTRA FORMA DE HACERLO
    alfa(j,1)=coef(j,1)/(N/2)
  endfor
  %%phi'*phi*alfa=phi'*g

  k=zeros(1,m+1);%%vector K
  for j=1:m+1
    k(1,j)=j-1;
  endfor

  A=zeros(1, m+1)
  A(1,1)=alfa(1,1);

  for j=1:m
    A(1,j+1)=sqrt((alfa(2*j,1))^2+(alfa(2*j+1,1))^2)
    titan(j)=atan(-(alfa(2*j+1,1))/(alfa(2*j,1))); %es para el 2do método, que usa el atang(-bk/ak)
  endfor

  figure (1)
  bar(k,A,'b')
  grid on
  title('Amplitud para cada k-ésima frecuencia')

  Tp=10;
  dw=(2*pi)/Tp;
  dt=0.01;
  t0=0;
  t=zeros(1,(2*(Tp/dt)));

  P(j)=alfa(1,1)*1;

  for j=1:(2*(Tp/dt)) %% j=1 : N
    t(1,j)=t0+(j-1)*(dt);
    for i=1:m
      P(j)= P(j) + alfa(2*i,1)*cos(i*dw(t(1,j)-t0)) + alfa(2*i+1,1)*sin(i*dw(t(1,j)-t0)); %%PRIMER MÉTODO
      p(j)= p(j) + A(1,i+1) * cos(i((2*pi)/Tp)*(t(1,j))+titan(i)); %%SEGUNDO MÉTODO
    endfor
  endfor

  figure(2)
  plot(t,P,'b',g,'or')
  title('Aproximación P(t) continua, 1er método')
  figure(3)
  plot(t,p,'b')
  title('Aproximación P(t) continua, 2do método')
  figure(4)
  plot(g,'og')
	
endfunction