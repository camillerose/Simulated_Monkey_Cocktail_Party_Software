function bout(antiDis1_obj, antiDis2_obj)

last_distracter_call = getappdata(0, 'last_distracter_call');  

last_speaker_call = getappdata(0, 'last_speaker_call');

if strcmp(last_speaker_call, '')
      goAhead = 1;
else
      goAhead = 0;
end

    if strcmp(last_distracter_call, 'AntiDis2') && goAhead == 1
                
               phee_to_play = speakerTimer(antiDis1_obj, antiDis1_obj.anti_low, antiDis1_obj.anti_hi); % antiphonal call
           
               setappdata(0, 'speaker_response_type', 'antiphonal');
  
               phee_to_play.CallStart(); %begin timer for call countdown
               
               antiDis1_obj.bout_number = antiDis1_obj.bout_number + 1; %update bout count
               
               disp('Played an antiDis1 antiphonal call after marmoset call during testing')
           
               setappdata(0, 'last_distracter_call', phee_to_play.callerObj.type);
  
               setappdata(0, 'last_speaker_call', phee_to_play.callerObj.type); 
               
               setappdata(0, 'last_call', phee_to_play.callerObj.type); 
               
            elseif strcmp(last_distracter_call, 'AntiDis1') && goAhead == 1
                     
               phee_to_play = speakerTimer(antiDis2_obj, antiDis2_obj.anti_low, antiDis2_obj.anti_hi); % antiphonal call
           
               setappdata(0, 'speaker_response_type', 'antiphonal');
    
               phee_to_play.CallStart(); %begin timer for call countdown
               
               antiDis1_obj.bout_number = antiDis1_obj.bout_number + 1;
               
               disp('Played an antiDis2 antiphonal call after marmoset call during testing')
           
               setappdata(0, 'last_distracter_call', phee_to_play.callerObj.type);

               setappdata(0, 'last_call', phee_to_play.callerObj.type); 
               
               setappdata(0, 'last_speaker_call', phee_to_play.callerObj.type);
                        
    end
           
    if  antiDis1_obj.bout_number < 2 && antiDis1_obj.bout_number > 0  
         antiDis1_obj.in_bout = 1;     
     else
         antiDis1_obj.in_bout = 0; 
         antiDis1_obj.bout_number = 0;
     end
     
     
     if  antiDis2_obj.bout_number < 2 && antiDis2_obj.bout_number > 0  
         antiDis2_obj.in_bout = 1;     
     else  
         antiDis2_obj.in_bout = 0; 
         antiDis2_obj.bout_number = 0;
     end
     
     if antiDis2_obj.in_bout == 0 && antiDis1_obj.in_bout == 0
        setappdata(0, 'last_distracter_call', '');
     end
end