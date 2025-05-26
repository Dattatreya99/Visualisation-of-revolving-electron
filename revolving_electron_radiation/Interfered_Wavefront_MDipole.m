clear; clc;

c = 3e8;
f = 1e9;
omega = 2*pi*f;
lambda = c/f;
T = 1/f;

R0 = 0.1;   
N_wavefronts = 20;  


N = 200;
x = linspace(-2, 2, N);
y = linspace(-2, 2, N);
z = 0;  
[XX, YY] = meshgrid(x, y);
ZZ = z * ones(size(XX));

dt = T / 30;
frame = 1;

fig = figure;
axis equal
colormap turbo

while ishandle(fig)
    t = (frame-1)*dt;
    
    Field = zeros(size(XX));
    
    for n = 1:N_wavefronts
        t_emit = t - (n-1)*dt;
        if t_emit < 0
            continue
        end

        xe = R0 * cos(omega * t_emit);
        ye = R0 * sin(omega * t_emit);
        ze = 0;

        R = sqrt((XX - xe).^2 + (YY - ye).^2 + (ZZ - ze).^2);

        phase = omega * (t - t_emit - R/c);
        envelope = 1 ./ (R + 0.01);  
        Field = Field + envelope .* cos(phase);  
    end

    imagesc(x, y, Field);
    axis xy
    colorbar
    title(sprintf('Interference of Spherical Wavefronts at t = %.2e s', t));
    xlabel('x (m)'); ylabel('y (m)');
    drawnow;
    frame = frame + 1;
end
