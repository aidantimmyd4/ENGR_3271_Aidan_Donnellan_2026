% Controls - Lab 1 - Exercise 3
% Donnellan - 01/18/26
% All code written by Google Gemini Pro
% All intial calculations done by self, was not sure how to approach this
% code by myself

clear; clc; close all

% Constants
m = 5;      % kg
b = 1;      % N*s/m
k = 5;      % N/m

% Choose input frequency omega
% For this system (with k,k,k), undamped natural mode freqs are about:
% w1 = sqrt(k/m) and w2 = sqrt(3k/m)
w1 = sqrt(k/m);
w2 = sqrt(3*k/m);

% Pick omega near one of them to see resonance-like behavior
omega = w1;  % try w1 or w2

% Input function u(t) = sin(omega t)
u = @(t) sin(omega*t);

% State-space ODE for ode45
% x = [q1; q1dot; q2; q2dot]
odefun = @(t,x) [
    x(2);                                              % q1dot
    (-b*x(2) - 2*k*x(1) + k*x(3))/m;                    % q1ddot
    x(4);                                              % q2dot
    (-b*x(4) + k*x(1) - 2*k*x(3) + k*u(t))/m            % q2ddot (forced by u)
];

% Simulation time + initial conditions
tspan = [0 60];                 % longer time helps you see steady-state
x0 = [0; 0; 0; 0];              % start at rest (you can change this)

% Solve
opts = odeset('RelTol',1e-8,'AbsTol',1e-10);
[t,x] = ode45(odefun, tspan, x0, opts);

q1 = x(:,1);
q2 = x(:,3);
ut = u(t);

% Plot displacements
figure;
plot(t, q1, 'LineWidth', 1.5); hold on;
plot(t, q2, 'LineWidth', 1.5);
plot(t, ut, '--', 'LineWidth', 1.2);
grid on;
xlabel('Time (s)');
ylabel('Displacement (m)');
legend('q_1(t)','q_2(t)','u(t) = sin(\omega t)');
title(sprintf('Coupled masses response, \\omega = %.3f rad/s', omega));

% (Optional) Plot relative motion between the masses
figure;
plot(t, q2 - q1, 'LineWidth', 1.5);
grid on;
xlabel('Time (s)');
ylabel('q_2 - q_1 (m)');
title('Relative displacement between masses');

