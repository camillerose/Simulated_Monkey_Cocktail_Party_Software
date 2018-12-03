classdef AntiDistracter2 < speaker
    
    properties
        type = 'AntiDistracter2';
    end
    
    methods
        function obj = AntiDistracter2()
            obj = obj@speaker;
        end
        
        function handleLiveCall(obj,callSource,callData)
            
            sprintf('AntiDistracter2  is handling call from %s\n', callSource.type)
                    
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