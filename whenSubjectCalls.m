function played_antiDis_call = whenSubjectCalls (primary_obj, spont_dis_obj, antiDis1_obj, antiDis2_obj, playPrimaryCall, playAnyCall)

new_rand = round(rand(1)*100);

    if playPrimaryCall == 1 && playAnyCall == 0

       sprintf('In PRIMARY callback after marmoset call block during TRAINING')
       
       phee_to_play = speakerTimer(primary_obj, primary_obj.anti_low, primary_obj.anti_hi); % antiphonal call
           
       setappdata(0, 'speaker_response_type', 'antiphonal');
  
       phee_to_play.CallStart(); %begin timer for call countdown
           
       setappdata(0, 'last_call_type', phee_to_play.callerObj.type);
       
       setappdata(0, 'last_speaker_call', phee_to_play.callerObj.type); 
       
       setappdata(0, 'last_call', phee_to_play.callerObj.type); 
               
       
    end
    
    
    
    if playAnyCall == 1 && playPrimaryCall == 0
        
           if new_rand >= (spont_dis_obj.probResponse + antiDis1_obj.probResponse + antiDis2_obj.probResponse) % new rand must be greater than, say 30...
           
                phee_to_play = speakerTimer(primary_obj, primary_obj.anti_low, primary_obj.anti_hi); % antiphonal call
           
                setappdata(0, 'speaker_response_type', 'antiphonal');
  
                phee_to_play.CallStart(); %begin timer for call countdown
           
                disp('Played primary antiphonal call after marmoset call during testing')
           
                setappdata(0, 'last_call_type', phee_to_play.callerObj.type);

                setappdata(0, 'last_speaker_call', phee_to_play.callerObj.type); 
                
                setappdata(0, 'last_call', phee_to_play.callerObj.type); 
               
           
          
           elseif new_rand > spont_dis_obj.probResponse && new_rand < (spont_dis_obj.probResponse + antiDis1_obj.probResponse + antiDis2_obj.probResponse) % play a antiDis call
           % new_rand is greater than 10, but less than 30 (20%)
          
                playAntiphonalBout(antiDis1_obj, antiDis2_obj);
 
                played_antiDis_call = 1;
                
           elseif new_rand <= spont_dis_obj.probResponse
            %new_rand is less than or equal to 10
            
                
                phee_to_play = speakerTimer(spont_dis_obj, spont_dis_obj.anti_low, spont_dis_obj.anti_hi); % antiphonal call
           
                setappdata(0, 'speaker_response_type', 'antiphonal');
  
                phee_to_play.CallStart(); %begin timer for call countdown
                
                disp('Played a spontDis antiphonal call after marmoset call during testing')
           
                setappdata(0, 'last_call_type', phee_to_play.callerObj.type);
                
                setappdata(0, 'last_speaker_call', phee_to_play.callerObj.type); 
                
                setappdata(0, 'last_call', phee_to_play.callerObj.type); 
               
           
    end
    




end