%% Determine is incoming recording has frequency components of a phee

function is_phee = determinePhee(r)

% checking to see if frequency componenets match that of a phee

% don't look at frequencies below 2500 hz
freq_cutoff = 2500;

% create a Welch spectral estimator, welch is a type of spectral estimator.
% each one estimates in different ways - hamming window, 50% overlap, 64
% segment length

spectWelch = spectrum.welch;

% calculate the power density estimate 

rawPSD = psd(spectWelch, r, 'fs', record_params.fs);

% get indices for the data within the frequency bounds
low_ind = find(rawPSD.Frequencies > record_params.min_freq); % find indexes of freqs > min freq
up_ind = find(rawPSD.Frequencies < record_params.max_freq);

lowValInd = find(rawPSD.Frequencies, freq_cutoff);
upValInd = up_ind(end) + 1;

boundsIndex = [ low_ind(1), up_ind(end) ];

% sum the data within the phee frequencies
targetFreqBand = sum(rawPSD.Data(boundsIndex(1):boundsIndex(2)));

% sum the data outside of the phee-frequencies
low_ignore = sum(rawPSD.Data(lowValInd:boundsIndex(1)));
up_ignore = sum(rawPSD.Data(upValInd:end));

totalIgnore = low_ignore + up_ignore;
totalIgnore = totalIgnore + totalIgnore*0.5;

% check that a sufficient component of the signal is within phee-freq range
is_phee = totalIgnore < targetFreqBand;

end






