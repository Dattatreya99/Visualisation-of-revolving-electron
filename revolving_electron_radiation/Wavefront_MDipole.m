clear; clc;

c = 3e8;
q = 1.6e-19;   
epsilon0 = 8.854e-12;
mu0 = 4*pi*1e-7;
R0 = 0.1;      
f = 1e9;       
omega = 2*pi*f;
T = 1/f;
lambda = c / f;

fig = figure;
ax = axes('Parent', fig);
axis vis3d
view(3)
xlabel('X'); ylabel('Y'); zlabel('Z');
title('Radiation Wavefronts from a Revolving Electron');
hold on
grid on

dt = T / 100;
frame = 1;
max_time = 5 * T;

wavefronts = [];

[sx, sy, sz] = sphere(30);

while ishandle(fig)
    t = (frame - 1) * dt;
    if t > max_time
        break;
    end

    xe = R0 * cos(omega * t);
    ye = R0 * sin(omega * t);
    ze = 0;

    cla;
    plot3(xe, ye, ze, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 6);
    
    if mod(frame, round(T/dt/5)) == 0
        wavefronts{end+1} = struct('x0', xe, 'y0', ye, 'z0', ze, 't0', t);
    end

    for k = 1:length(wavefronts)
        tau = t - wavefronts{k}.t0;  
        r = c * tau;                 

        if r > 0 && r < 3 * lambda
            xs = r * sx + wavefronts{k}.x0;
            ys = r * sy + wavefronts{k}.y0;
            zs = r * sz + wavefronts{k}.z0;

            surf(xs, ys, zs, 'FaceAlpha', 0.1, 'EdgeColor', 'none', 'FaceColor', 'b');
        end
    end

    xlim([-1 1]*lambda); ylim([-1 1]*lambda); zlim([-1 1]*lambda);
    drawnow;
    frame = frame + 1;
end
