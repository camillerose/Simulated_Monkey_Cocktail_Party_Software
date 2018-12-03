classdef AntiDistracter1 < speaker
    
    properties
        type = 'AntiDistracter1';
    end
    
    methods
        function obj = AntiDistracter1()
            obj = obj@speaker;
        end
        
        function handleLiveCall(obj,callSource,callData)
            
            sprintf('AntiDistracter1 is handling call from %s\n', callSource.type)
                    
            alltimers = timerfindall;
            if ~isempty(alltimers)
               stop(alltimers);
               delete(alltimers);
            %   setappdata(0, 'last_call_type', []);
            end
            sprintf('Deleting timers of type %s', obj.type) 
        end
                     
      
    end
end