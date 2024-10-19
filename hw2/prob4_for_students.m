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

for i = 1:1:N_theta
    theta = thetas(i);
    for trial=1:1:N_trial
        %
        % PUT YOUR CODES HERE
        %
        % You need to estimate theta_est
        % Hint: you may need this MATLAB function cart2pol();
        %
        error(i) = error(i) + (theta/pi*180 - theta_est/pi*180)^2;
    end
    error(i) = sqrt(error(i) / N_trial);
end

figure(1)
%
% PUT YOUR CODES HERE
% Plot the results
% 
xlabel("\theta (degree)");
ylabel("error (degree)");