function forTesting( )

% for fast testing

addpath('/Users/camilletoarmino/Documents/MATLAB/4speakerSoftware/11s_male_spontaneous');
addpath('/Users/camilletoarmino/Documents/MATLAB/4speakerSoftware/15_s_female_antiphonal');

% Primary Parameters

max_time = 60; 
anti_win = 8;
anti_lat1 = 3;
anti_lat2 = 5;
spont_lat1 = 10; 
spont_lat2 = 12; 
prob_resp = 100;
stim_likelihood = 100;

lat_syn_party();
M_handles = getappdata(0,'party_handles');

set(M_handles.expt_length, 'String', max_time);
M_handles.expt_length = max_time;

set(M_handles.anti_win, 'String', anti_win);
M_handles.anti_win = anti_win;

set(M_handles.anti_low, 'String', anti_lat1);
M_handles.anti_low = anti_lat1;

set(M_handles.anti_hi, 'String', anti_lat2);
M_handles.anti_hi = anti_lat2;

set(M_handles.spont_low, 'String', spont_lat1);
M_handles.spont_low = spont_lat1;

set(M_handles.spont_hi, 'String', spont_lat2);
M_handles.spont_hi = spont_lat2;

set(M_handles.prob_response, 'String', prob_resp);
M_handles.prob_response = prob_resp;

set(M_handles.stim_likelihood, 'String', stim_likelihood);
M_handles.stim_likelihood = stim_likelihood;

M_handles.channel = 1;

randomizeAntiphonalCallbacks(M_handles.stim_list)


% Distracter
    distract_spont_windowL = 10;
    distract_spont_windowH = 14;
    distract_anti_windowL = 10;
    distract_anti_windowH = 14;
    
    
    distracter_speaker();
    D_handles = getappdata(0,'distracter_speaker_handles');
    
    set(D_handles.dis_spont_low, 'String', distract_spont_windowL);
    D_handles.distracter_speaker.spont_low = distract_spont_windowL;
    set(D_handles.dis_spont_hi, 'String', distract_spont_windowH);
    D_handles.distracter_speaker.spont_hi = distract_spont_windowH;
   
    set(D_handles.dis_anti_low, 'String', distract_anti_windowL);
    D_handles.distracter_speaker.anti_low = distract_anti_windowL;
    set(D_handles.dis_anti_hi, 'String', distract_anti_windowH);
    D_handles.distracter_speaker.anti_hi = distract_anti_windowH;
    D_handles.distracter_speaker.channel = 2;
    
    setappdata(0, 'distracter_speaker', D_handles);
   
    randomizeAntiphonalCallbacks(D_handles.dis_stimList, D_handles.distracter_speaker);


function randomizeAntiphonalCallbacks(handles)

    dir_path = pwd;
    
    dir_name = strcat(dir_path, '/11s_male_spontaneous/'); 
     
    
	if(ischar(dir_name)) 
    	wavfiles = dir(fullfile(dir_name, '*.wav'));
        if(numel(wavfiles)==0)
        	errordlg(['no wav file in ', dir_name]);
        else
            rand_wavfiles = randomize_list({wavfiles(:).name});
            %adds all wavfiles to playback list
            set(M_handles.stim_list,'String',rand_wavfiles','Value',1);
            %adds all the files queued to handles structure
            for i=1:numel(rand_wavfiles)
                callback_wavs(i) = cellstr(fullfile(dir_name, char(rand_wavfiles(i))));
            end
        end
    end    
end
            

function rand_list = randomize_list(file_list)
	%randomize the playback files
    len = length(file_list);
    rand_list = cell(1,len);
	for i=1:len
    	index = ceil(rand*length(file_list));
        rand_list{i} = file_list{index};
        file_list(index) = [];
	end
end

end