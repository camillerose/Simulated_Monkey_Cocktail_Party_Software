function saveSession(handles, Marm, primary_obj, spont_dis_obj, antiDis1_obj, antiDis2_obj)

% Basic session data


experimenter = get(handles.experimenter, 'String');
condition = get(handles.condition, 'String');
date = get(handles.date, 'String');
subject = get(handles.subject, 'String');
length = get(handles.time_elapsed, 'String');

session_params = struct('experimenter', experimenter, 'condition', condition, 'date',  date,...
    'subject', subject, 'length', length);
    

% Speaker data

antiDis1_total_calls = antiDis1_obj.num_calls_done;
antiDis1_anti_calls = antiDis1_obj.num_anti_calls_done;
antiDis1_spont_calls = antiDis1_obj.num_spont_calls_done;
antiDis1_test_calls = antiDis1_obj.probe_number_played;

antiDis2_total_calls = antiDis2_obj.num_calls_done;
antiDis2_anti_calls = antiDis2_obj.num_anti_calls_done;
antiDis2_spont_calls = antiDis2_obj.num_spont_calls_done;
antiDis2_test_calls = antiDis2_obj.probe_number_played;

spontDis_total_calls = spont_dis_obj.num_calls_done;
spontDis_anti_calls = spont_dis_obj.num_anti_calls_done;
spontDis_spont_calls = spont_dis_obj.num_spont_calls_done;
spontDis_test_calls = spont_dis_obj.probe_number_played;

primary_total_calls = primary_obj.num_calls_done;
primary_anti_calls = primary_obj.num_anti_calls_done;
primary_test_calls = primary_obj.probe_number_played;


speaker_data = struct('antiDis1_total_calls', antiDis1_total_calls, 'antiDis1_anti_calls', antiDis1_anti_calls,...
    'antiDis1_spont_calls', antiDis1_spont_calls, 'antiDis1_test_calls', antiDis1_test_calls, 'antiDis2_total_calls',...
    antiDis2_total_calls, 'antiDis2_anti_calls', antiDis2_anti_calls,'antiDis2_spont_calls', antiDis2_spont_calls,...
    'antiDis2_test_calls', antiDis2_test_calls, 'spontDis_total_calls', spontDis_total_calls, 'spontDis_anti_calls',...
    spontDis_anti_calls,'spontDis_spont_calls', spontDis_spont_calls, 'spontDis_test_calls', spontDis_test_calls,...
    'primary_total_calls', primary_total_calls, 'primary_anti_calls', primary_anti_calls,'primary_test_calls', primary_test_calls);


% Subject data

% overall response probabilities
overall_RP_primary = Marm.live_anti_calls/primary_obj.num_calls_done;
overall_RP_spontDis = Marm.live_anti_2_distracter/spont_dis_obj.num_calls_done;
overall_RP_antiDis1 = Marm.live_anti_2_antiDis1/antiDis1_obj.num_calls_done;
overall_RP_antiDis2 = Marm.live_anti_2_antiDis2/antiDis2_obj.num_calls_done;

% response probabilities to test calls
RP_to_primary_test = Marm.live_probe_primary_response/primary_obj.probe_number_played;
RP_to_spontDis_test = Marm.live_probe_spontDis_response/spont_dis_obj.probe_number_played;
RP_to_antiDis1_test = Marm.live_probe_antiDis1_response/antiDis1_obj.probe_number_played;
RP_to_antiDis2_test = Marm.live_probe_antiDis2_response/antiDis2_obj.probe_number_played;

% total calls to each stimulus class
calls_to_primary = Marm.live_anti_calls;
calls_to_spontDis = Marm.live_anti_2_distracter;
calls_to_antiDis1 = Marm.live_anti_2_antiDis1;
calls_to_antiDis2 = Marm.live_anti_2_antiDis2;

% calls to test calls
calls_to_primary_test = Marm.live_probe_primary_response;
calls_to_spontDis_test = Marm.live_probe_spontDis_response;
calls_to_antiDis1_test = Marm.live_probe_antiDis1_response;
calls_to_antiDis2_test = Marm.live_probe_antiDis2_response;

% latency

latency_to_primary = primary_obj.latency_sum/primary_obj.num_marm_response;
latency_to_spontDis = spont_dis_obj.latency_sum/spont_dis_obj.num_marm_response;
latency_to_antiDis1 = antiDis1_obj.latency_sum/antiDis1_obj.num_marm_response;
latency_to_antiDis2 = antiDis2_obj.latency_sum/antiDis2_obj.num_marm_response;

% spont & total calls
spontaneous_calls = Marm.live_spont_calls;
total_calls = Marm.pheeCallCounter;

subject_data = struct('overall_RP_primary', overall_RP_primary, 'RP_to_primary_test', RP_to_primary_test,...
    'calls_to_primary', calls_to_primary, 'calls_to_primary_test', calls_to_primary_test, 'latency_to_primary',...
    latency_to_primary,'overall_RP_spontDis', overall_RP_spontDis, 'RP_to_spontDis_test', RP_to_spontDis_test,...
    'calls_to_spontDis', calls_to_spontDis, 'calls_to_spontDis_test', calls_to_spontDis_test, 'latency_to_spontDis',...
    latency_to_spontDis,'overall_RP_antiDis1', overall_RP_antiDis1, 'RP_to_antiDis1_test', RP_to_antiDis1_test,...
    'calls_to_antiDis1', calls_to_antiDis1, 'calls_to_antiDis1_test', calls_to_antiDis1_test, 'latency_to_antiDis1',...
    latency_to_antiDis1, 'overall_RP_antiDis2', overall_RP_antiDis2, 'RP_to_antiDis2_test', RP_to_antiDis2_test,...
    'calls_to_antiDis2', calls_to_antiDis2, 'calls_to_antiDis2_test', calls_to_antiDis2_test, 'latency_to_antiDis2',...
    latency_to_antiDis2, 'spontaneous_calls', spontaneous_calls, 'total_calls', total_calls);


filename = strcat(subject,'_',date,'_',condition);

save(filename, 'session_params', 'speaker_data', 'subject_data');

end