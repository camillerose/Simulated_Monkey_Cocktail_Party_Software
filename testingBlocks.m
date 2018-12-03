function testingBlocks(primary_obj, spont_dis_obj, antiDis1_obj, antiDis2_obj)

rand_num1 = round(rand(1)*100);
    
           primary_obj.spont_call = 0; 
           
           spont_dis_obj.spont_call = 0;
           
           antiDis1_obj.spont_call = 0;
           
           antiDis2_obj.spont_call = 0;
           
           % equal probability of spont call from each speaker 
           
           if rand_num1 <= 25 %play a primary call
                  
                  primary_obj.spont_call = 1;
                  
                  phee_to_play = speakerTimer(primary_obj, primary_obj.spont_low, primary_obj.spont_hi); % spont 
                  
                  setappdata(0, 'speaker_response_type', 'spontaneous');
                  
                  primary_obj.probe_type = 'Primary';
                  
                  phee_to_play.CallStart(); %begin timer for call countdown
                  
                  disp('Played a Primary TEST call')
               
                  setappdata(0, 'last_call_type', phee_to_play.callerObj.type);
                  
                  setappdata(0, 'last_speaker_call', phee_to_play.callerObj.type);
           
           elseif rand_num1 > 25 && rand_num1 <= 50 % play a spont dis call  
               
                  spont_dis_obj.spont_call = 1;
                  
                  phee_to_play = speakerTimer(spont_dis_obj, spont_dis_obj.spont_low, spont_dis_obj.spont_hi); % spont 
                  
                  setappdata(0, 'speaker_response_type', 'spontaneous');
                  
                  spont_dis_obj.probe_type = 'SpontaneousDistracter';
                  
                  phee_to_play.CallStart(); %begin timer for call countdown
                  
                  disp('Played a SpontDis TEST call')
             
                  setappdata(0, 'last_call_type', phee_to_play.callerObj.type);
                  
                  setappdata(0, 'last_speaker_call', phee_to_play.callerObj.type);
          
           elseif rand_num1 > 50 && rand_num1 < 75 % play an anti dis 1 call
                     
                  antiDis1_obj.spont_call = 1;
                  
                  phee_to_play = speakerTimer(antiDis1_obj, antiDis1_obj.spont_low, antiDis1_obj.spont_hi); % spont 
                  
                  setappdata(0, 'speaker_response_type', 'spontaneous');
                  
                  spont_dis_obj.probe_type = 'AntiDis1';
                  
                  phee_to_play.CallStart(); %begin timer for call countdown
                  
                  disp('Played an AntiDis1 TEST call')
             
                  setappdata(0, 'last_call_type', phee_to_play.callerObj.type);
                  
                  setappdata(0, 'last_speaker_call', phee_to_play.callerObj.type);
           else
               
                  antiDis2_obj.spont_call = 1;
                  
                  phee_to_play = speakerTimer(antiDis2_obj, antiDis2_obj.spont_low, antiDis2_obj.spont_hi); % spont 
                  
                  setappdata(0, 'speaker_response_type', 'spontaneous');
                  
                  spont_dis_obj.probe_type = 'AntiDis2';
                  
                  phee_to_play.CallStart(); %begin timer for call countdown
             
                  disp('Played an AntiDis 2 TEST call')
                  
                  setappdata(0, 'last_call_type', phee_to_play.callerObj.type);
                  
                  setappdata(0, 'last_speaker_call', phee_to_play.callerObj.type);
                 
           end
end