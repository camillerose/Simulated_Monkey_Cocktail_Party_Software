classdef SpontaneousDistracter < speaker
    
    properties
        type = 'SpontaneousDistracter';
        callerObj;
        callTimer;
    end
    
    methods
        function obj = SpontaneousDistracter()
            obj = obj@speaker;
        end
        
        function handleLiveCall(obj,callSource,callData)
            
            sprintf('SpontaneousDistracter is handling call from %s\n', callSource.type)
                    
            alltimers = timerfindall;
            if ~isempty(alltimers)
               stop(alltimers);
               delete(alltimers);
            %   setappdata(0, 'last_call_type', []);
            end
            sprintf('Deleting timers of type %s', obj.type) 
        end
        
        
%         function createTimer(obj,lat1,lat2)
%             obj.callerObj = obj; %define what object is being encapsulated
%             
%             %construct timer object name
%             objTname = strcat(obj.callerObj.type, '-', num2str(obj.callerObj.num_calls_done));
%             timerName = sprintf('TIMER-%s', objTname);
%             sprintf('Creating Timer object %s', timerName)
%             
%             range =  lat1:lat2;
%             nums = length(range);
%             ind = ceil(nums*rand(1));
%             latency = range(ind);
%             
%             obj.callerObj.callCurrent = 1; % alert object it has a call timer created
%             
%             % create timer with a countdown of latency seconds
%             obj.callTimer = timer('Name', timerName, 'StartDelay', latency, 'TasksToExecute', 1, 'ExecutionMode', 'fixedSpacing');
%             obj.callTimer.TimerFcn = {@startTimer, obj};
%             obj.callTimer.StopFcn = {@stopTimer,obj};
%         end
%         
%         function startTimer(timerObj, timerData, obj)
%             
%             filepath = [];
%               
%         obj = obj.callerObj;
%         obj.replyValid = 0;
%         
%         if obj.spont_call == 1
%             if (~isempty(obj.spont_callback_wavs))
% 
%                 % Check if at the end of the list, if so then rerandomize
%                 % list
%                 
%                 if obj.curr_spont_callback_wav >= length(obj.spont_callback_wavs)
%                     %obj.callback_wavs = obj.randomize_list(obj.callback_wavs);
%                     % Reset the counter
%                     obj.curr_spont_callback_wav = 1;
%                 else
%                     obj.curr_spont_callback_wav = obj.curr_spont_callback_wav + 1;
%                 end 
%            end
%            
%           % sprintf('obj curr callback wav is %d', obj.curr_spont_callback_wav)
%            filepath = obj.spont_callback_wavs{obj.curr_spont_callback_wav};
%           % sprintf('filepath is %s', filepath)    
%         else
%             if (~isempty(obj.callback_wavs))
% 
%                 % Check if at the end of the list, if so then rerandomize
%                 % list
%                 
%                 if obj.curr_callback_wav >= length(obj.callback_wavs)
%                     %obj.callback_wavs = obj.randomize_list(obj.callback_wavs);
%                     % Reset the counter
%                     obj.curr_callback_wav = 1;
%                 else
%                     obj.curr_callback_wav = obj.curr_callback_wav + 1;
%                 end 
%            end
%            
%           % sprintf('obj curr callback wav is %d', obj.curr_callback_wav)
%            filepath = obj.callback_wavs{obj.curr_callback_wav};
%           % sprintf('filepath is %s', filepath)   
%         end
%            % need a way to access files better 
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
%             time = getappdata(0,'exptTimer');
%             obj.start_time = toc(time);
%             
%             ao = getappdata(0, 'analogOutput');
%             
%             % play the call
%             call_played = PlayAnalogS(y, fs, ao, obj);
% 
%             % play phee call
%             %wavplay(y, fs);
%             
%             
%             time = getappdata(0,'exptTimer');
%             %obj.end_time = toc(time);
%             phee_played = 1; 
%             obj.replyValid = 1; % if the call was played successfully
%             
%             speaker_response_type = getappdata(0, 'speaker_response_type');
%             % if a call was played...
%             if(call_played)
%              %  sprintf('Speaker call has been broadcast')
%                setappdata(0, 'last_call_type', obj.type);
%                obj.num_calls_done = obj.num_calls_done + 1; % update number of calls
%                obj.call_in_progress = 1;
%                setappdata(0, 'speaker', 'speaker_call');
%                eTimer = getappdata(0, 'exptTimer');
%               % obj.start_time = toc(eTimer); % get the time the call started
%                call_length = length(y)/fs;
%                obj.end_time = obj.start_time + call_length;
%                notify(obj, 'Calling');
%                % might need to make user-defined event data  
%           
%                if strcmp(speaker_response_type, 'antiphonal') && strcmp(obj.type, 'Primary')
%                   setappdata(0, 'spont_call_type', 'primary_anti');
%                   obj.num_anti_calls_done = obj.num_anti_calls_done + 1;
%                   sprintf('Primary antiphonal call has been broadcast.')
%                end
%                
%                if strcmp(speaker_response_type, 'spontaneous') && strcmp(obj.type, 'Primary') && obj.min_stim > obj.num_calls_done
%                end
%                
%                if strcmp(speaker_response_type, 'spont_spontaneous') && strcmp(obj.type, 'SpontaneousDistracter') && obj.min_stim > obj.num_calls_done
%                    obj.num_spont_calls_done = obj.num_spont_calls_done + 1;
%                    
%                end
%                
%                if strcmp(speaker_response_type, 'spont_anti') && strcmp(obj.type, 'SpontaneousDistracter')
%                    setappdata(0, 'spont_call_type', 'spont_anti')
%                    obj.num_anti_calls_done = obj.num_anti_calls_done + 1;
%                  
%                    sprintf('Spontaneous Distracter antiphonal call has been broadcast.')
%                end
%                    
%                prob_type = getappdata(0, 'spont_call_type');
%                
%                if strcmp(obj.probe_type, 'SpontaneousDistracter') && ~strcmp(prob_type, 'spont_anti') && obj.min_stim <= obj.num_calls_done
%                    setappdata(0, 'spont_call_type', 'spontaneousDistracter')
%                    obj.probe_number_played = obj.probe_number_played + 1;
%                    sprintf('Spontaneous Distracter probe has been broadcast.')
%                end
%                
%                if strcmp(obj.probe_type, 'Primary') && ~strcmp(prob_type, 'primary_anti') && obj.min_stim <= obj.num_calls_done
%                    setappdata(0, 'spont_call_type', 'primaryResponder');
%                    obj.probe_number_played = obj.probe_number_played + 1;
%                    sprintf('Primary Responder probe has been broadcast')
%                end
%                
%             end
%            
%         end
%         
%         function stopTimer(timerObj, timerData, obj)
%             
%             stop(obj.callTimer)
%             %delete(obj.callTimer)
%         end
%         
        
    end    
end