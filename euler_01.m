function euler_01

  %Condición y valor inicial%
  y0=2;
  t0=0;

  %Intervalos%
  dt=0.10;
  ndt=100;

  %Definición de vectores%
  y=zeros(ndt, 1);
  t=zeros(ndt, 1);

  %Establecer valores iniciales en vectores%
  y(1)=y0;
  t(1)=t0;

  %Euler%
  for j=1:ndt-1
    k1 = dt * f_ord_1(y(j), t(j));
    y(j+1) = y(j) + k1;
    t(j+1) = t(j) + dt;
  endfor

  figure(1)
  plot(t, y(:,1), 'b');

  %Comparación de Euler con función exacta%
  for i=1:ndt
    yex(i) = e^(2*t(i)) + t(i) + 1;
    err(i) = abs(yex(i)-y(i));
  endfor

  normerr = norm(err, inf);
  disp('Norma a infinito'), normerr;

  figure(2);
  plot(t, yex, 'r', t, y, 'b', t, err, 'g');

end

function fy=f_ord_1(z,x)
  fy=2*z-2*x-1;
end
