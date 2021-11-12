% 0. first second: epoch 0h
x = -7856125.132570323;
y = -3153615.476193391;
z = -8815677.901873229;
vx = 2296.291456475990;
vy = 3944.771956823101;
vz = -3449.641080085869;

% input & output
Y = zeros(25, 6);
Y(1,:) = [x y z vx vy vz];

% 4. Runge Kutta method: y_n+1=y_n+h(k1+2k2+2k3+k4)/6
% h is the step-size(time interval): t_n+1=t_1+h
% see Runge Kutta.pdf
t = 0;
h = 360;

% totally 24hrs, every hour is seperated into 3600/h intervals.
K = zeros(3600/h+1, 6);
fprintf(['0 h \t%7.6f\t\t\t%7.6f\n' ...
    '\t\t%7.6f\t\t\t%7.6f\n' ...
    '\t\t%7.6f\t\t\t%7.6f\n'], Y(1,1), Y(1,4), Y(1,2), Y(1,5),  Y(1,3), Y(1,6))
for hr = 2:25
    K(1,:) = Y(hr-1,:);
    for i=1:3600/h
        k1 = RungeKutta(t, K(i,:));
        k2 = RungeKutta(t+h/2, K(i,:)+h*k1/2);
        k3 = RungeKutta(t+h/2, K(i,:)+h*k2/2);
        k4 = RungeKutta(t+h, K(i,:)+h*k3);
        K(i+1,:) = K(i,:)+h*(k1+2*k2+2*k3+k4)/6;
        t = t+h;
    end
    Y(hr,:) = K((3600/h)+1,:);
    fprintf(['%d h \t%7.6f\t\t\t%7.6f\n' ...
    '\t\t%7.6f\t\t\t%7.6f\n' ...
     '\t\t%7.6f\t\t\t%7.6f\n'],hr-1, Y(hr,1), Y(hr,4), Y(hr,2), Y(hr,5),  Y(hr,3), Y(hr,6))
end 