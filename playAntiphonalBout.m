function playAntiphonalBout(antiDis1_obj, antiDis2_obj)         

        randNum = round(rand(1)*100);
        
        if randNum <= 50
           setappdata(0, 'last_distracter_call', 'AntiDis1');
        else
           setappdata(0, 'last_distracter_call', 'AntiDis2');
        end

        last_distracter_call = getappdata(0, 'last_distracter_call');    
            
        last_speaker_call = getappdata(0, 'last_speaker_call');
        
            if strcmp(last_speaker_call, '')
                goAhead = 1;
            else
                goAhead = 0;
            end
            
            
        bout(antiDis1_obj, antiDis2_obj)
           
    
   
end