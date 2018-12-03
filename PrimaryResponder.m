classdef PrimaryResponder < speaker
    
    properties 
        type = 'Primary';
        
    end
    
    methods 
        function obj = PrimaryResponder()
            obj = obj@speaker;
        end
        
        function handleLiveCall(obj,callSource,callData)
            
            sprintf('PrimaryResponder is handling call from %s\n', callSource.type)
                    
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