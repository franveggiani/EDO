function RK2_03_con_Euler_Vectorial
% y1' =  (-10y1 + 4 y2)    con y1(0)=5
% y2' =  (-4 y1 + 0 y2)    con y2(0)=3
% yex1= (1/3)*exp(-2*t)+(14/3)*exp(-8*t));
% yex2= (2/3)*exp(-2*t)+(7/3)*exp(-8*t));
clc,clear
% Datos
y10=5;     % Valores Iniciales
y20=3;
t0=0;
Dt=0.01;  % incremento de tiempo
NDt=100;  % cantidad de Dt a realizar
w = 0.5;
% Dimensionamiento
t=zeros(1,NDt);   % vector fila para el tiempo
y=zeros(2,NDt);   % Matriz para el vector soluci�n y(t)
k1=zeros(2,1);
k2=zeros(2,1);
% Inicializaci�n del primer estado soluci�n
t(1)=t0;
y(1,1)=y10;
y(2,1)=y20;

% RUNGE KUTTA

for j=1:NDt-1

   k1 = Dt * f_sist_1(y(:,j),t(j));
   
   tg = t(j) + (Dt/(2*w));
   yg = y(:,j) + (k1)/(2*w);    %No hace declarar que sea una matriz, porque automaticamente es un vector.
   
   k2 = Dt * f_sist_1(yg,tg);
   
   y(:,j+1) = y(:,j) + (1-w) * k1 + w * k2;
   t(j+1)    = t(j) + Dt;

end

figure(1)
plot(t, y(1,:), 'b', t, y(2,:), 'r');
title ('Soluci�n de EDO con Euler')
legend('y(1)', 'y(2)')
grid on

%Comparación con solución exacta
for i=1:NDt
    yex(i)=(1/3)*exp(-2*t(i))+(14/3)*exp(-8*t(i));
    er(i)=abs(yex(i)-y(1,i));
end
normer=norm(er,inf)

figure(3)
plot(t,er)
title ('Error en y(1) entre Sol Exacta y Soluci�n de EDO con Euler')
grid on

figure (4)
plot (t,y(1,:),'--b',t,yex,'r', t, y(2, :), '--g')
title ('Soluci�n de EDO')
legend('y(1) aprox', 'y(1) exacta')
grid on

end %Function

function [fy]=f_sist_1(z,x)
  fy(1,1)=(-10*z(1) + 4*z(2));
  fy(2,1)=(-4*z(1)+0*z(2));
end