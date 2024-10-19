%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This is the script for Problem 4. 
% Your task is to fill in a few lines in this file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;

% cricket's coordinates
phi = pi/4:pi/2:7*pi/4; % preferred angles of the 4 interneurons

N_theta = 500;	% number of samples
N_trial = 1000;	% number of trials
error = zeros(1, N_theta); 	% results 
thetas = -pi/2:pi/(N_theta-1):pi/2;	% ground truth

for i = 1:N_theta
    theta = thetas(i);
    % Generate average firing rates for the 4 interneurons
    r_mean = 50 * cos(theta - phi);  % Mean firing rates
    r_mean(r_mean < 0) = 0;  % Set negative rates to zero

    % Initialize actual firing rates with noise
    r_actual = r_mean + randn(1, 4) * 5;  % Add Gaussian noise
    r_actual(r_actual < 0) = 0;  % Ensure non-negative firing rates

    % Calculate the x and y components of the population vector
    x = sum(r_actual .* cos(phi));
    y = sum(r_actual .* sin(phi));

    % Estimate the wind direction
    theta_est = atan2(y, x);  % Estimate the direction in radians

    % Convert theta and theta_est to degrees for error calculation
    error(i) = error(i) + (theta/pi*180 - theta_est/pi*180)^2;
end

% Average the error over trials
error = sqrt(error / N_trial);

% Plot the results
figure(1);
plot(thetas * 180 / pi, error, 'LineWidth', 2);
ylim([0 1.5]);
xlabel("\theta (degree)");
ylabel("error (degree)");
title("Error in Wind Direction Estimation");
grid on;

% Create the directory to save figures if it doesn't exist
if ~exist('../Figure', 'dir')
    mkdir('../Figure');
end

% Save the figure
saveas(gcf, '../Figure/wind_direction_error.png');
