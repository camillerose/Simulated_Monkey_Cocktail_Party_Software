function randomizeAntiphonalCallbacks(hObject, handles, obj)

    dir_name = uigetdir('Change path to');
	if(ischar(dir_name))
    	wavfiles = dir(fullfile(dir_name, '*.wav'));
        if(numel(wavfiles)==0)
        	errordlg(['no wav file in ', dir_name]);
        else
            rand_wavfiles = randomize_list({wavfiles(:).name});
            %adds all wavfiles to playback list
            set(handles,'String',{rand_wavfiles}','Value',1);
            %adds all the files queued to handles structure
            for i=1:numel(rand_wavfiles)
                obj.callback_wavs(i) = cellstr(fullfile(dir_name, char(rand_wavfiles(i))));
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
