function repaso

  w = 3;
  t0 = 0;
  tf = 4*((2*pi)/w)
  N = 1000;
  b = 1.9;
  dt = (tf-t0)/N;

  t(1) = t0;
  y(1,1) = 0;
  y(2,1) = 0;

  for i=1 : N + 1
    k1 = dt * funcion_pend(t(i), y(:,i));
    y(:,i+1) = y(:,i) + k1;
    t(i+1) = (i) * dt;
  endfor

  figure(1)
  plot(t, y(1, :) ,"red")
  grid on

  figure(2)
  plot(t, y(2, :), "red")
  grid on

  t1 = tf/4

  j = find(t == t1)

  t(j)

  y(1,j)
  y(2,j)

  ######INTEGRALEEEEEEEEEEEEEEEES

  trap1 = 0;
  trap2 = 0;

  for i=1: N-1
    trap1 = trap1 + (dt * (y(1,i) + y(1,i+1))/2);
    trap2 = trap2 + (dt * (y(2,i) + y(2,i+1))/2);
  endfor

  trap1
  trap2


end

function [fy]= funcion_pend(x,z)

  w = 3;
  beta = 1.9;

  fy(1,1) = 0*z(1) + z(2) + sin(beta * x) * 0;
  fy(2,1) = -(w^2) * z(1) - 0 * z(2) + sin(beta * x);

end

