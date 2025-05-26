clear; clc;

c = 3e8;
q = 1.6e-19;         
epsilon0 = 8.854e-12;
mu0 = 4*pi*1e-7;
R0 = 0.1;            
f = 1e9;             
omega = 2*pi*f;
T = 1/f;

N = 15;
r_vals = linspace(0.5, 2, N);
theta_vals = linspace(0, pi, N);
phi_vals = linspace(0, 2*pi, N);
[R, Theta, Phi] = meshgrid(r_vals, theta_vals, phi_vals);

X = R .* sin(Theta) .* cos(Phi);
Y = R .* sin(Theta) .* sin(Phi);
Z = R .* cos(Theta);

fig = figure;
ax = axes('Parent', fig);
axis vis3d
view(3)
xlabel('X'); ylabel('Y'); zlabel('Z');
title('Radiation from a Revolving Electron');
hold on

Ex = zeros(size(X));
Ey = zeros(size(Y));
Ez = zeros(size(Z));
qv = quiver3(X, Y, Z, Ex, Ey, Ez, 0.5, 'Color', 'b');

frame = 1;
dt = T / 100;

while ishandle(fig)
    t = mod((frame - 1) * dt, T);

    xe = R0 * cos(omega * t);
    ye = R0 * sin(omega * t);
    ae_x = -R0 * omega^2 * cos(omega * t);
    ae_y = -R0 * omega^2 * sin(omega * t);
    ae_z = 0;

    Ex = zeros(size(X));
    Ey = zeros(size(Y));
    Ez = zeros(size(Z));

    for i = 1:numel(X)
        Rx = X(i) - xe;
        Ry = Y(i) - ye;
        Rz = Z(i);
        Rmag = sqrt(Rx^2 + Ry^2 + Rz^2);
        Rhat = [Rx; Ry; Rz]/Rmag;

        a = [ae_x; ae_y; ae_z];
        E = (q / (4*pi*epsilon0*c^2*Rmag)) * cross(Rhat, cross(Rhat, a));

        Ex(i) = E(1);
        Ey(i) = E(2);
        Ez(i) = E(3);
    end

    delete(qv);
    qv = quiver3(X, Y, Z, Ex, Ey, Ez, 0.5, 'Color', 'b');
    drawnow;
    frame = frame + 1;
end
