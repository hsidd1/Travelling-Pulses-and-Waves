% Exercise 2 - Hamza Siddiqui - 400407170 - siddih38
clear all; close all %#ok<CLALL> reset everything

% phase velocity
c = 299792458;        % speed of light
eps_r = 1.0;          % relative permittivity
vp = c / sqrt(eps_r); % phase velocity

f = 10^3;             % frequency of sinusoid
A = 5;                % amplitude
w = 2*pi*f;           % omega value for frequency 
lambda = vp/f;        % wave length
%beta = 2*pi/lambda;  % phase constant 
% spatial and temporal axes
dz = lambda; z = linspace(-3*dz, +3*dz, 1001);
dt = 1/f; t = linspace(-3*dt, +3*dt, 3001);

% function for sinusoidal wave
sinusoid = @(tau) A * cos(w * tau);
% function for the corresponding wave over all points z at single time ti
wave = @(z, ti) sinusoid(ti - z / vp);

% plot specification
%In the first subplot, an animated red line shows the sinusoid traveling in the +z direction
subplot(3, 1, 1)                                  % 3x1 grid, 1st plot
line1 = animatedline('Color', 'red');             % line in the plot
title("Sinusoid traveling in the +z direction")   % title
xlabel("z [m]"); ylabel("amplitude")              % axis labels
xlim(z([1 end])); ylim([-A A])                     % axis limits

%In the second subplot, an animated blue line shows the sinusoid traveling in the −z direction
subplot(3, 1, 2)                                  % 3x1 grid, 2nd plot
line2 = animatedline('Color', 'blue');            % line in the plot
title("Sinusoid traveling in -z direction")       % title
xlabel("z [m]"); ylabel("amplitude")              % axis labels
xlim(z([1 end])); ylim([-A A])                     % axis limits

%In the third subplot, an animated magenta line shows the superposition of the preceding two
%waves
subplot(3, 1, 3)                                  % 3x1 grid, 3rd plot
line3 = animatedline('Color', 'magenta');         % line in the plot
title("Superposition of the preceding two waves") % title
xlabel("z [m]"); ylabel("amplitude")              % axis labels
xlim(z([1 end])); ylim([-2*A 2*A])                   % axis limits


% animation instructions
for ti = t
    clearpoints(line1)
    clearpoints(line2)
    clearpoints(line3)
    addpoints(line1, z, wave(+z, ti))
    addpoints(line2, z, wave(-z, ti))
    addpoints(line3, z, wave(+z, ti)+wave(-z, ti))
    drawnow limitrate
end