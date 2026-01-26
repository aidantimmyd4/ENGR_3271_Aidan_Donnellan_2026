% Controls Lab 2 - 1a
% Donnellan - 01/26
% Code written by Google Gemini Pro when fed differential equation
% derivation

function controls_lab2_1a()

% Define Variables for the system
m1 = 5; % kg
m2 = 5; % kg
b1 = 1; % N s/m
b2 = 1; % N s/m
k1 = 5; % N/m
k2 = 5; % N/m
k3 = 5; % N/m

% Time span
tspan = [0 30]; % 0-30 seconds

% Initial conditions
z0 = [0; 0; 0; 0]; % [x1; dx1; x2; dx2]

% Solve ODE
[t, z] = ode45(@(t, z) dynamics(t, z, m1, m2, b1, b2, k1, k2, k3), tspan, z0);

% Plot
figure;
plot(t, z(:,1), 'R'); 
hold on;
plot(t, z(:, 3), 'G');
xlabel('Time(s)')
ylabel('Displacement (m)')
title('Coupled System Response to Step Input y(t)');
legend('x_1 (Mass 1)', 'x_2 (Mass 2)');
grid on; 

end 

% State Variable function
function dzdt = dynamics(t, z, m1, m2, b1, b2, k1, k2, k3)
    y = 1; % unit step
    x1 = z(1);
    dx1 = z(2);
    x2 = z(3);
    dx2 = z(4);

    % State Equations
    dz1 = dx1;
    dz2 = (1/m1) * (-b1*dx1 - k1*x1 + k2*(x2 - x1));
    dz3 = dx2;
    dz4 = (1/m2) * (-b2*dx2 - k2*(x2 - x1) + k3*(y - x2));

    dzdt = [dz1; dz2; dz3; dz4];

end
