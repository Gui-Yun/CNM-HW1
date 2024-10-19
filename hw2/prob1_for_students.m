%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This is the script for roblem 1. 
% Your task is to fill in a few lines in this file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load c2p3.mat
stim=double(stim);
window=12; %steps; each step corresponds to 15.6 ms 

%----------calculate the spike-triggered average --------
n=length(counts);
C=zeros(16,16,window); 

%
% PUT YOUR CODES HERE
%
% C(:,:,1) should corresponds to the stimulus at tau=11 time steps
% C(:,:,2) should corresponds to the stimulus at tau=10 time steps
%   ...
% C(:,:,12) should corresponds to the stimulus at tau=0
%

%%---------- plot the results ---------------
figure(1)
for i=1:window 
    subplot(3,4,i);
    imagesc(C(:,:,i));  
    colormap(gray)
    str = sprintf('tau=%d*15.6 ms',window-i); %plot in the reverse direction of time    
    title(str)
    axis off
end

%----- summing up the images across one spatial dimension -----
%
% PUT YOUR CODES HERE
% you may need to use the commands: mesh, contour, colorbar, etc
%

return
