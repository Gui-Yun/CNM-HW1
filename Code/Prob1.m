%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This is the script for Problem 1. 
% Your task is to fill in a few lines in this file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load c2p3.mat
stim=double(stim);  % Convert stim to double
window=12;          % 12 steps; each step corresponds to 15.6 ms 

%----------calculate the spike-triggered average --------
n=length(counts);    % Number of time bins
C=zeros(16,16,window); 

% Loop through all time bins to calculate the spike-triggered average
for t=window:n
    if counts(t) > 0  % Only consider bins where there are spikes
        for tau=1:window
            C(:,:,tau) = C(:,:,tau) + counts(t) * stim(:,:,t-tau+1); 
        end
    end
end

% Normalize the results by the total number of spikes
total_spikes = sum(counts(window:end));  % Sum of spikes after the first window
C = C / total_spikes;

% Create the directory to save figures if it doesn't exist
if ~exist('../Figure', 'dir')
   mkdir('../Figure');
end

%---------- plot the results ---------------
figure(1)
for i=1:window 
    subplot(3,4,i);
    imagesc(C(:,:,i));  
    colormap(gray)
    str = sprintf('tau=%d*15.6 ms',window-i); % Plot in reverse order of time    
    title(str)
    axis off
end
% Save the figure for spike-triggered averages
saveas(gcf, '../Figure/spike_triggered_average.png')

%----- summing up the images across one spatial dimension -----
% Sum the images along one dimension (e.g., along x-axis)
summed_C = squeeze(sum(C, 1));

% Plot the summed results (3D mesh plot)
figure(2)
mesh(summed_C); % 3D plot
xlabel('y dimension');
ylabel('Time step');
zlabel('Summed value');
title('Summed response across x dimension');
colorbar;  % Add colorbar for reference

% Save the 3D mesh plot
saveas(gcf, '../Figure/summed_response_3D.png')

%----- plot the contour map -----
figure(3)
contour(summed_C, 20);  % Generate a contour plot with 20 contour lines
xlabel('y dimension');
ylabel('Time step');
title('Contour of summed response across x dimension');
colorbar;

% Save the contour plot
saveas(gcf, '../Figure/summed_response_contour.png')

return
