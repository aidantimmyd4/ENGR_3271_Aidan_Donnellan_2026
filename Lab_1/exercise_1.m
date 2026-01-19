% Controls - Lab 1 - Exercise 1
% Donnellan - 01/15/26
% Code written by Aidan Donnellan

% parameters
m = 10; % mass (kg)
l = 5; % length (m)
g = 9.81; % gravity (m/s^2)
theta0_deg = 90; % intial angle (deg)
theta0 = deg2rad(theta0_deg); % initial angle in radians

% Frequency and Time
omeg = sqrt(g/l); % Natural frequency derived from equation
t  = linspace(0, 10, 500); % Graph setup

% Linear response
theta_rad = theta0 * cos(omeg * t); % equation from final derivation
theta_deg = rad2deg(theta_rad); % Converting from rad to degree

% Graph periodic wing of pendulum
figure;
plot(t, theta_deg);
xlabel('Time (s)');
ylabel('Angle (degrees)');
title('Linear Response of Pendulum (\theta_0 = 90^\circ)');
grid on;
