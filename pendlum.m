N = 100000000;
t_final = 20;
h = t_final/N;

x = zeros(1, N);
y = zeros(1, N);
v_x = zeros(1, N);
v_y = zeros(1, N);

v_init = 0.0;
x_init = 3.;
y_init = -4.;

x(1) = x_init;
y(1) = y_init;

% in this case all projection are zeros
v_x(1) = v_init;
v_y(1) = v_init;


m = 1;
L = 5;

%acc_error = 0.1

for ii = 1:N
  g = 9.81 + 0.05 * sin(2*pi*h*ii);
  T_x = abs(m * g * (x(ii)/L));
  x(ii + 1) = x(ii) + h*v_x(ii);
  v_x(ii + 1) = v_x(ii) - (h * x(ii) * T_x)/(L * m);
  T_y = abs(m * g * (y(ii)/L));
  y(ii + 1) = y(ii) + h*v_y(ii);
  v_y(ii + 1) = v_y(ii) - h * (y(ii) * T_y)/(L * m) - h * g;
%  if x(ii)^2 + y(ii)^2 >= L^2 + acc_error || x(ii)^2 + y(ii)^2 <= L^2 - acc_error
%    fprintf('Divergence. Change modeling parameters.\n')
%    return;
%  end
end

l_hat =  sqrt(x.^2 + y.^2);

figure(1)
plot(x)
figure(2)
plot(y)
figure(3)
plot(l_hat)
