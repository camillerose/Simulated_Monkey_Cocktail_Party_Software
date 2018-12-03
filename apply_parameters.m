function apply_parameters(handles, primary_obj, spont_dis, anti_dis_1, anti_dis_2)

addpath('/Users/camilletoarmino/Documents/MATLAB/4speakerSoftware/11s_male_spontaneous');
addpath('/Users/camilletoarmino/Documents/MATLAB/4speakerSoftware/15_s_female_antiphonal');

wavfiles = dir(fullfile('/Users/camilletoarmino/Documents/MATLAB/4speakerSoftware/15_s_female_antiphonal', '*.wav'));
wavfiles = {wavfiles(:).name};

% set primary speaker parameters
primary_obj.anti_low = 2;
primary_obj.anti_hi = 4;
primary_obj.spont_low = 3;
primary_obj.spont_hi = 5;
primary_obj.type = 'Primary';
primary_obj.callback_wavs = wavfiles;
primary_obj.spont_callback_wavs = wavfiles;
primary_obj.probResponse = 10;
primary_obj.min_stim = 3;

% set universal parameters
handles.stim_likelihood = 100;

% set spont dis parameters
spont_dis.anti_low = 2;
spont_dis.anti_hi = 4;
spont_dis.spont_low = 3;
spont_dis.spont_hi = 5;
spont_dis.type = 'SpontaneousDistracter';
spont_dis.callback_wavs = wavfiles;
spont_dis.spont_callback_wavs = wavfiles;
spont_dis.probResponse = 10;
spont_dis.min_stim = 3;

% set antiphonal distracter #1 parameters
anti_dis_1.anti_low = 2;
anti_dis_1.anti_hi = 4;
anti_dis_1.spont_low = 4;
anti_dis_1.spont_hi = 6;
anti_dis_1.type = 'AntiDis1';
anti_dis_1.callback_wavs = wavfiles;
anti_dis_1.spont_callback_wavs = wavfiles;
anti_dis_1.probResponse = 40;
anti_dis_1.min_stim = 3;

% set antiphonal distracter #2 parameters
anti_dis_2.anti_low = 2;
anti_dis_2.anti_hi = 4;
anti_dis_2.spont_low = 8;
anti_dis_2.spont_hi = 10;
anti_dis_2.type = 'AntiDis2';
anti_dis_2.callback_wavs = wavfiles;
anti_dis_2.spont_callback_wavs = wavfiles;
anti_dis_2.probResponse = 40;
anti_dis_2.min_stim = 3;



end