function K = RungeKutta(t, Y)
    % 1. GRS80 constants
    GM = 3.986005*10^14;
    a_e = 6378137;

    % 2. zonal geopotential coefficient J2.
    j3 = -2.54*10^-6;
    j4 = -1.62*10^-6;
    j5 = -0.23*10^-6;
    j6 = 0.54*10^-6;
    GM=3.986005*10^14;

    % input with: j2
    j2=1082.63*10^-6;
    r = sqrt(Y(1)^2+Y(2)^2+Y(3)^2);
    ax = -GM*Y(1)/r^3*(1-j2*1.5*(a_e/r)^2*(5*(Y(3)/r)^2-1));
    ay = ax*Y(2)/Y(1);
    az = -GM*Y(3)/r^3*(1+j2*1.5*(a_e/r)^2*(3-5*(Y(3)/r)^2));
    K=[Y(4) Y(5) Y(6) ax ay az];
end
