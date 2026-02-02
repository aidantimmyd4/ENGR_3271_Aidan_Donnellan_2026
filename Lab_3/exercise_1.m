%% Controls Lab 3 - Exercise 1
% Donnellan - 02/01/26
% Code from UMich Controls Tutorials for Matlab and Simulink: Ball & Beam
% System Modeling
% Some portions written by Google Gemini Pro commented accordingly

% Define parameters
m = 0.11; % kg
R = 0.015;% m
g = -9.8; % m/s^2
L = 1.0; % m
d = 0.03; % m
J = 9.99e-6; % kg-m^2

K = -m*g*d/L/(J/R^2+m);
s = tf('s');
P_ball = K/s^2

% State Space Equations based on matrices
A = [0 1; 0 0];
B = [0; K];
C = [1 0];
D = 0;
sys = ss(A, B, C, D)

% ------------- Remaining code not from UMich Controls --------- -%

% Eigenvectors and Eigen Values: This section assisted by Gemini Pro
[V, eigVals] = eig(sys.A);
fprintf("Eigenvectors:\n")
disp(diag(eigVals));
fprintf("Eigenvalues:\n")
disp(V);

% Plot response
t = 0:0.01:5; % 0 - 5 seconds with 0.01 step resolution
[y, t_out] = step(sys, t); % This line written by Google Gemini Pro during error correction
figure;
plot(t_out, y);
grid on;
title('Ball Position Step Response');
xlabel('Time (s)');
ylabel('Position (m)');
