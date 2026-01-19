% Controls - Lab 1 - Exercise 2
% Donnellan - 01/16/26
% Code written by Aidan Donnellan

% Constants
m = 10; % Mass (kg)
b = 1; % Damping (Ns/m)
k = 10; % Spring Constant (N/m)

% Calculated values:
dec = 0.05; % Decay rate
omeg = sqrt(3.99) / 2; % Damped frequency 

% Based on assumed initial conditions
% x(0) = 1, x'(0) = 0
A = 1;
B = dec / omeg;

% Time vector 
t = 0:0.01:100; % Time from 0 to 100 seconds with 0.01s intervals

% Solution
x_t = exp(-dec*t) .* (A*cos(omeg*t) + B*sin(omeg*t));

% Plot the solution
figure;
plot(t, x_t);
xlabel('Time (s)');
ylabel('Displacement (m)');
title('Damped Harmonic Motion');
grid on;

