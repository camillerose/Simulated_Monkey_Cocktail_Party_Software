function fMRIcode
% CODE for fMRI experiment
persistent lastInput 

addpath('/Users/camilletoarmino/Documents/MATLAB/fMRI stimuli/stimuli');

curr_stimNumber = 1;

dir_name = uigetdir('Change path to');

wavfiles = dir(fullfile(dir_name, '*.wav'));

randomizedStimuli = randomize_list({wavfiles(:).name});
 
for i = 0:10 
    %X number of pulses/images
    
   % access to digital I/O device
   % need to customize this
   % or would this be a com port?
   d = digitalio('nidaq', 'Dev1');
   
   analog_out = analogoutput('XXXX'); % probably winsound 
   
   currentInput = getvalue(d.Line(1));
   
   if lastInput == 0 && currentInput == 1 % Onset of TTL pulse?
       
     i = i + 1; % one instance of acquistion
       
     % if there is a TTL pulse, nothing should happen for 25 seconds
     
     % 25 second timer? at offset, play another stimulus?
     
     delayTimer = timer('TimerFcn',@startStimulus, 'StartDelay', 25.0);
     
     start(delayTimer)
    
   end
end
   


function startStimulus
        
    
    stim_to_play = (randomizedStimuli{curr_stimNumber});
    
    [y,fs] = wavread(stim_to_play);
    
    wavplay(y,fs);
    
    curr_stimNumber = curr_stimNumber + 1;
   
    % then acquire the images
    
end


end




