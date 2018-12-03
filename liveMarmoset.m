classdef liveMarmoset < handle
    
   properties
       
       start_time = 0;
       end_time = 0;
       prev_start_time = 0;
       prev_end_time = 0;
       
       % number of live marmoset calls
       pheeCallCounter = 0;
       
       % number of antiphonal and spont calls
       live_anti_calls = 0;
       live_spont_calls = 0;
       live_anti_2_distracter = 0;
       live_anti_2_antiDis1 = 0;
       live_anti_2_antiDis2 = 0;
       
       % if a phee by the marmoset is in progress
       phee_inprogress = 0;
       
       live_probe_primary_response = 0;
       live_probe_spontDis_response = 0;
       live_probe_antiDis1_response = 0;
       live_probe_antiDis2_response = 0;
      
       
       % the first up-edge of a new phee
       new_phee = 0;
       
       % anything for 0-x considered an antiphonal call
       anti_win = 0;
       
       % max inter pulse interval before it is considered a new phee
       gap_time = 1.5;
       
       prev_pulseTime = 0;
       
       type = 'liveMarmoset'
       

   end
    
   properties(Constant)
       
       phee_min_len = .001;
       maxPulseGap = 1.5;
       
   end
       
       
    methods
        function obj = liveMarmoset()
        
        end
        
        % more stipulations are found in this function, but will not be
        % implemented until we started debugging 
        
        function endFound = endOfPheeFound(obj,endTime)
            endFound = 1;
            
            phee_call_len = obj.prev_pulseTime - obj.start_time;
            if phee_call_len < obj.phee_min_len
                endFound = 0;
              %  sprintf('Phee duration is under minimum time, do not count as phee!');
                return;
            end
            
            if obj.pheeCallCounter <= 0
                endFound = 0;
                sprintf('No phee end found!');
            else 
            
            % if it's the same end time, don't take it as a new one
                if obj.end_time == endTime
                      endFound = 0;
                   %   sprintf('Same end time a previous');
                      return;
                end
            end
            
            
%             if primaryStart > 0
%                if primaryStart - obj.start_time < 1.3 
%                    endFound = 1;
%                    obj.end_time = obj.start_time + 2;
%                    sprintf('assigned end time due to overlap of speaker call')
%                end
%             end
%             
%             if spontDisStart > 0
%                if spontDisStart - obj.start_time < 1.3
%                    endFound = 1;
%                    obj.end_time = obj.start_time + 2;
%                    sprintf('assigned end time due to overlap of speaker call')
%                end
%             end
                  
            %check if the time-gap since the last pulse is large enough to
            %call this the ending (or if it's just a continuation of the 
            %current phee)
            experimentTimer = getappdata(0, 'exptTimer');
            if (toc(experimentTimer) - obj.prev_pulseTime) < obj.maxPulseGap
                endFound = 0;
              %  sprintf('Continuation of phee')
                return;
            end
            
            if endFound == 1
             %  sprintf('Phee detected')
            end
            
        end
        
        function isUpEdge = isUpEdgePhee(obj, prev_isphee)
            
            isUpEdge = 0;

            
            if obj.new_phee == 0 && prev_isphee == 0
                isUpEdge = 1;
            end
        end
                
        function isNew = isNewPhee(obj, pheeTime)
            isNew = 0;
            if (pheeTime - obj.prev_pulseTime) > obj.maxPulseGap || obj.pheeCallCounter == 0
                isNew = 1;
            end
            
            if(obj.prev_end_time < obj.prev_start_time)
                isNew = 0;
            end
        end
            
        
    end
    
    events
        
        MarmosetCall
    end
    
end