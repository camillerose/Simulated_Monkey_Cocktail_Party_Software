classdef speaker < handle 
   
    % Properties that objects from this class can potentially have.
    properties
        
    anti_low = 0; 
    anti_hi = 0;
    spont_low = 0;
    spont_hi = 0;
    callerobj;
    goAhead = 0;
    
    num_calls_done = 0;
    num_spont_calls_done = 0;
    num_anti_calls_done = 0;
    
    spont_call = 0; % if 1, uses spontaneous callbacks
    
    callback_wavs = {}; % list of antiphonal calls to play
    curr_callback_wav = 1;
    curr_spont_callback_wav = 1;
    spont_callback_wavs = {}; % list of spont calls to play
    
    call_in_progress = 0; % call in progress, binary
    start_time = 0; % start time of speaker call
    end_time = 0; % end of speaker call
    
    anti_win = 0; % max time in seconds for a call to be considered antiphonal
    
    num_marm_response = 0; % the number of antiphonal responses by the subject
    
    replyValid = 0;
    
    calling = 0;
    call_canceled = 0;
    callCurrent = 0;
    latency_sum = 0;
    
    probResponse = 0;
    channel = 0;
    
    probe_response_count = 0;
    probe_number_played = 0;
    probe_type = 0;
    min_stim = 0;
    
    bout_number = 0;
    in_bout = 0;
    
    end  
    
    
    
    methods 
        
        function obj = speaker() % instantiate speaker
            
        end
        
        
        % Set antiphonal latency
        function setAntiLat(obj, anti_low, anti_hi)
            obj.anti_low = anti_low;
            obj.anti_hi = anti_hi;
        end
        
        
        % Set spontaneous latency
        function setSpontLat(obj, spont_low, spont_hi)
            obj.spont_low = spont_low;
            obj.spont_hi = spont_hi;
        end
        
        function getWavFiles(obj, wavs)
            obj.callback_wavs = wavs;
        end
        
        
        % Play a call from list of calls
%         function phee_played = phee_play(obj)
%             
%             filepath = [];
%             
%             if (~isempty(obj.callback_wavs))
%                 filepath = obj.callback_wavs{obj.curr_callback_wav};
%                 
%                 % Check if at the end of the list, if so then rerandomize
%                 % list
%                 
%                 if obj.curr_callback_wav >= length(obj.callback_wavs)
%                     obj.callback_wavs = speaker.randomize_list(obj.callback_wavs);
%                     % Reset the counter
%                     obj.curr_callback_wav = 1;
%                 else
%                     obj.curr_callback_wav = obj.curr_callback_wav + 1;
%                 end 
%             end
%                 
%             
%             try
%                 [y, fs, bits] = wavread(filepath);
%             catch e
%                 str = sprintf('Playback file is not a .wav file!', filepath);
%                 errordlg(str); % Error dialogue box displaying string
%                 disp(e); % display error
%                 phee_played = 0; % return 0 as phee play failure
%                 return;
%                 
%             end
%             
%             % find first and last indexes
%             first = find(y > .01, 1, 'first');
%             last = find(y > .01, 1, 'last');
%             
%             % bounds check
%             if(~first)
%                first = 1;
%             end
%             if(first<101)
%                 first = 101;
%             end
%             if(~last)
%                 last = length(y);
%             end
%             if(last>length(y)-101)
%                 last = length(y)-101;
%             end
%             y = y(first-100:last+100);
%             
%             % play phee call
%             phee_played = wavplay(y, fs);
%             
%             % if a call was played...
%             if(phee_played)
%                sprintf('Speaker call has been broadcast');
%                setappdata(0, 'last_call_type', obj.type);
%                obj.num_calls_done = obj.num_calls_done + 1; % update number of calls
%                obj.call_in_progress = 1;
%                
%                eTimer = getappdata(0, 'exptTimer');
%                obj.start_time = toc(eTimer); % get the time the call started
%                call_length = length(y)/fs;
%                obj.end_time = obj.start_time + call_length;
%                notify(obj, 'Calling');
%                % might need to make user-defined event data
%                
%             end
%             
%             
%         end
         
        % antiphonal timer
        function createAntiTimer(obj)
            range =  obj.anti_low:obj.anti_hi;
            nums = length(range);
            ind = ceil(nums*rand(1));
            latency = range(ind);
            
            % create timer
            antiTimer = timer('StartDelay', latency);
            set(antiTimer, 'ExecutionMode', 'SingleShot');
            set(antiTimer, 'TimerFcn', 'phee_play');
            
            % start timer
            start(antiTimer)
            sprintf('antiphonal timer started')
            
            
        end
        
        function createSpontTimer(obj)
            range =  obj.spont_low:obj.spont_hi;
            nums = length(range);
            ind = ceil(nums*rand(1));
            latency = range(ind);
            
            % create timer
            spontTimer = timer('StartDelay', latency);
            set(spontTimer, 'ExecutionMode', 'SingleShot');
            spontTimer.TimerFcn = { @phee_play, obj };
            %set(spontTimer, 'TimerFcn', @phee_play);
            
            
            % start timer
            start(spontTimer)
            sprintf('spontaneous timer started')
            
            
        end
        
        % indicates if a speaker is currently calling
        function calling = currently_calling(obj)
            
            eTimer = getappdata(0, 'exptTimer');
            curr_time = toc(eTimer);
            
            % extra time for after the call
            phee_err_margin = 0.3;
            
            if (obj.end_time + phee_err_margin) >= curr_time && obj.end_time > 0
                calling = 1;
            else
                calling = 0;
            end
        end 
       
        % randomize playback list
        function rand_list = randomize_list(file_list)
        
        len = length(file_list);
        rand_list = cell(1,len);
        
        for i = 1:len
            index = ceil(rand*length(file_list));
            rand_list{i} = file_list{index};
            file_list(index) = [];
        end
        
        end
    end
    
    events
       Calling
    end
    
end