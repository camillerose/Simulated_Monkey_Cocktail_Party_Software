function varargout = lat_syn_party(varargin)
% LAT_SYN_PARTY M-file for lat_syn_party.fig
%      LAT_SYN_PARTY, by itself, creates a new LAT_SYN_PARTY or raises the existing
%      singleton*.
%
%      H = LAT_SYN_PARTY returns the handle to a new LAT_SYN_PARTY or the handle to
%      the existing singleton*.
%
%      LAT_SYN_PARTY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAT_SYN_PARTY.M with the given input arguments.
%
%      LAT_SYN_PARTY('Property','Value',...) creates a new LAT_SYN_PARTY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lat_syn_party_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lat_syn_party_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help lat_syn_party

% Last Modified by GUIDE v2.5 16-Aug-2012 11:31:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lat_syn_party_OpeningFcn, ...
                   'gui_OutputFcn',  @lat_syn_party_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
end

% --- Executes just before lat_syn_party is made visible.
function lat_syn_party_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lat_syn_party (see VARARGIN)

% Choose default command line output for lat_syn_party
handles.output = hObject;

% Update handles structure

addpath(genpath('C:\Users\millerlabexpt\Documents\MATLAB\cocktailParty_latSync\Familiar_stimuli'))

set(handles.marm_box, 'Color', 'k');
set(handles.primary_box, 'Color', 'k');
set(handles.distracter_box, 'Color', 'k');
set(handles.antiDis1_box, 'Color', 'k');
set(handles.antiDis2_box, 'Color', 'k');

handles.primary_obj = PrimaryResponder();

% for fast testing...


setappdata(0,'party_handles', handles);
guidata(hObject, handles);

% UIWAIT makes lat_syn_party wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end

% --- Outputs from this function are returned to the command line.
function varargout = lat_syn_party_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end


function expt_length_Callback(hObject, eventdata, handles)
% hObject    handle to expt_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of expt_length as text
%        str2double(get(hObject,'String')) returns contents of expt_length as a double
end

% --- Executes during object creation, after setting all properties.
function expt_length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to expt_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function anti_win_Callback(hObject, eventdata, handles)
% hObject    handle to anti_win (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of anti_win as text
%        str2double(get(hObject,'String')) returns contents of anti_win as a double
end


% --- Executes during object creation, after setting all properties.
function anti_win_CreateFcn(hObject, eventdata, handles)
% hObject    handle to anti_win (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function anti_low_Callback(hObject, eventdata, handles)
% hObject    handle to anti_low (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of anti_low as text
%        str2double(get(hObject,'String')) returns contents of anti_low as a double

handles.primary_obj.anti_low = str2double(get(hObject,'String'));
guidata(hObject, handles);

end

% --- Executes during object creation, after setting all properties.
function anti_low_CreateFcn(hObject, eventdata, handles)
% hObject    handle to anti_low (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function anti_hi_Callback(hObject, eventdata, handles)
% hObject    handle to anti_hi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of anti_hi as text
%        str2double(get(hObject,'String')) returns contents of anti_hi as a double

handles.primary_obj.anti_hi = str2double(get(hObject,'String'));
guidata(hObject, handles);

end

% --- Executes during object creation, after setting all properties.
function anti_hi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to anti_hi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end

function prob_response_Callback(hObject, eventdata, handles)
% hObject    handle to prob_response (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of prob_response as text
%        str2double(get(hObject,'String')) returns contents of prob_response as a double

handles.primary_obj.probResponse = str2double(get(hObject,'String'));
guidata(hObject, handles);

end

% --- Executes during object creation, after setting all properties.
function prob_response_CreateFcn(hObject, eventdata, handles)
% hObject    handle to prob_response (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function spont_low_Callback(hObject, eventdata, handles)
% hObject    handle to spont_low (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of spont_low as text
%        str2double(get(hObject,'String')) returns contents of spont_low as a double

handles.primary_obj.spont_low = str2double(get(hObject,'String'));
guidata(hObject, handles);
end

% --- Executes during object creation, after setting all properties.
function spont_low_CreateFcn(hObject, eventdata, handles)
% hObject    handle to spont_low (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function spont_hi_Callback(hObject, eventdata, handles)
% hObject    handle to spont_hi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of spont_hi as text
%        str2double(get(hObject,'String')) returns contents of spont_hi as a double

handles.primary_obj.spont_hi = str2double(get(hObject,'String'));
guidata(hObject, handles);

end

% --- Executes during object creation, after setting all properties.
function spont_hi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to spont_hi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on button press in load_stim.
function load_stim_Callback(hObject, eventdata, handles)
% hObject    handle to load_stim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


randomizeAntiphonalCallbacks(hObject, handles.stim_list, handles.primary_obj)
guidata(hObject, handles);
end


% --- Executes on selection change in stim_list.
function stim_list_Callback(hObject, eventdata, handles)
% hObject    handle to stim_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns stim_list contents as cell array
%        contents{get(hObject,'Value')} returns selected item from stim_list
end

% --- Executes during object creation, after setting all properties.
function stim_list_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stim_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


% --- Executes on selection change in spont_list.
function spont_list_Callback(hObject, eventdata, handles)
% hObject    handle to spont_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns spont_list contents as cell array
%        contents{get(hObject,'Value')} returns selected item from spont_list
end

% --- Executes during object creation, after setting all properties.
function spont_list_CreateFcn(hObject, eventdata, handles)
% hObject    handle to spont_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on selection change in anti_list.
function anti_list_Callback(hObject, eventdata, handles)
% hObject    handle to anti_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns anti_list contents as cell array
%        contents{get(hObject,'Value')} returns selected item from anti_list
end

% --- Executes during object creation, after setting all properties.
function anti_list_CreateFcn(hObject, eventdata, handles)
% hObject    handle to anti_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on selection change in grand_list.
function grand_list_Callback(hObject, eventdata, handles)
% hObject    handle to grand_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns grand_list contents as cell array
%        contents{get(hObject,'Value')} returns selected item from grand_list
end

% --- Executes during object creation, after setting all properties.
function grand_list_CreateFcn(hObject, eventdata, handles)
% hObject    handle to grand_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on button press in start_button.
function start_button_Callback(hObject, eventdata, handles)
% hObject    handle to start_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% %COMMENT BACK IN FOR TESTING

% sprintf('Creating the DAQ object....\n')
         
% %Create analog output object

% %This part of the code needs to be changed. To intialize the DAQ
% %device, the analog output should reflect the current DAQ card system.
% %Previously, we used a winsound card with only two channels. I don?t know
% %how the name of the DAQ card is relected in matlab, that?s why I need you
% %to change this part. It could be something along the lines of...
% %ao = analogoutput('nidaq, 'Dev1')...

% %Previous analog output code
% ao = analogoutput('winsound',0); 

% %add four channels to the object
% addchannel(ao, [1 2 3 4]); 

% %The sound card should be sufficient for recording, but if that is buggy
% %for some reason, the analog input code is almost exactly the same and
% %should look something like this:

% %ai = analoginput('nidaq', 'Dev1');
% %addchannel(ai, 0) % Channel Zero;
% %setappdata(0, 'analogInput', ai);

% setappdata(0, 'analogOutput', ao);

% FAST TESTING!!! 
spont_dis = SpontaneousDistracter();
anti_dis_1 = AntiDistracter1();
anti_dis_2 = AntiDistracter2();
primary_obj = PrimaryResponder();

apply_parameters(handles, primary_obj, spont_dis, anti_dis_1, anti_dis_2);

%setappdata(0, 'primary_obj', handles.primary_obj);
% spont_dis = getappdata(0, 'distracter_speaker');
% anti_dis_1 = getappdata(0, 'antiDistracter1');
% anti_dis_2 = getappdata(0, 'antiDistracter2');
% primary_obj = getappdata(0, 'primary_obj');
% 
% spont_dis = spont_dis.distracter_obj;

% entry point for this experiment
Processing(handles, primary_obj, spont_dis, anti_dis_1, anti_dis_2);

disp('Experiment is over, make sure file has saved before closing GUI')
end


function experimenter_Callback(hObject, eventdata, handles)
% hObject    handle to experimenter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of experimenter as text
%        str2double(get(hObject,'String')) returns contents of experimenter as a double

end
% --- Executes during object creation, after setting all properties.
function experimenter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to experimenter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end

function subject_Callback(hObject, eventdata, handles)
% hObject    handle to text34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text34 as text
%        str2double(get(hObject,'String')) returns contents of text34 as a double

end
% --- Executes during object creation, after setting all properties.
function subject_CreateFcn(hObject, eventdata, handles)
% hObject    handle to date (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function date_Callback(hObject, eventdata, handles)
% hObject    handle to date (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of date as text
%        str2double(get(hObject,'String')) returns contents of date as a double
end

% --- Executes during object creation, after setting all properties.
function date_CreateFcn(hObject, eventdata, handles)
% hObject    handle to date (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end

function condition_Callback(hObject, eventdata, handles)
% hObject    handle to condition (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of condition as text
%        str2double(get(hObject,'String')) returns contents of condition as a double

end
% --- Executes during object creation, after setting all properties.
function condition_CreateFcn(hObject, eventdata, handles)
% hObject    handle to condition (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on selection change in add_distracters.
function add_distracters_Callback(hObject, eventdata, handles)
% hObject    handle to add_distracters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns add_distracters contents as cell array
%        contents{get(hObject,'Value')} returns selected item from add_distracters

contents = cellstr(get(hObject, 'String'));
subGUI = contents{get(hObject, 'Value')};
   
    if strcmp(subGUI, 'Spontaneous Distracter')
        distracter_speaker();
    elseif strcmp(subGUI, 'Antiphonal Distracters')
        AntiphonalDistracterGUIs();     
    else
        set(handles.error_string, 'String', 'Invalid distracter selection');
    end
end


% --- Executes during object creation, after setting all properties.
function add_distracters_CreateFcn(hObject, eventdata, handles)
% hObject    handle to add_distracters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function prim_channel_Callback(hObject, eventdata, handles)
% hObject    handle to prim_channel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of prim_channel as text
%        str2double(get(hObject,'String')) returns contents of prim_channel as a double

end
% --- Executes during object creation, after setting all properties.
function prim_channel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to prim_channel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end
% --- Executes on selection change in anti_2_dis_list.
function anti_2_dis_list_Callback(hObject, eventdata, handles)
% hObject    handle to anti_2_dis_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns anti_2_dis_list contents as cell array
%        contents{get(hObject,'Value')} returns selected item from anti_2_dis_list
end

% --- Executes during object creation, after setting all properties.
function anti_2_dis_list_CreateFcn(hObject, eventdata, handles)
% hObject    handle to anti_2_dis_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end

function randomizeAntiphonalCallbacks(hObject, handles, obj)

    dir_name = uigetdir('Change path to');
	if(ischar(dir_name))
    	wavfiles = dir(fullfile(dir_name, '*.wav'));
        if(numel(wavfiles)==0)
        	errordlg(['no wav file in ', dir_name]);
        else
            rand_wavfiles = randomize_list({wavfiles(:).name});
            %adds all wavfiles to playback list
            set(handles,'String',rand_wavfiles','Value',1);
            %adds all the files queued to handles structure
            for i=1:numel(rand_wavfiles)
                obj.callback_wavs(i) = cellstr(fullfile(dir_name, char(rand_wavfiles(i))));
            end
        end
    end    
end
            
function randomizeSpontaneousCallbacks(hObject, handles, obj)

    dir_name = uigetdir('Change path to');
	if(ischar(dir_name))
    	wavfiles = dir(fullfile(dir_name, '*.wav'));
        if(numel(wavfiles)==0)
        	errordlg(['no wav file in ', dir_name]);
        else
            rand_wavfiles = randomize_list({wavfiles(:).name});
            %adds all wavfiles to playback list
            set(handles,'String',rand_wavfiles','Value',1);
            %adds all the files queued to handles structure
            for i=1:numel(rand_wavfiles)
                obj.spont_callback_wavs(i) = cellstr(fullfile(dir_name, char(rand_wavfiles(i))));
            end
        end
    end    
end
function rand_list = randomize_list(file_list)
	%randomize the playback files
    len = length(file_list);
    rand_list = cell(1,len);
	for i=1:len
    	index = ceil(rand*length(file_list));
        rand_list{i} = file_list{index};
        file_list(index) = [];
	end
end



function stim_likelihood_Callback(hObject, eventdata, handles)
% hObject    handle to stim_likelihood (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of stim_likelihood as text
%        str2double(get(hObject,'String')) returns contents of stim_likelihood as a double

end

% --- Executes during object creation, after setting all properties.
function stim_likelihood_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stim_likelihood (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



% --- Executes on selection change in spont_stim_list.
function spont_stim_list_Callback(hObject, eventdata, handles)
% hObject    handle to spont_stim_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns spont_stim_list contents as cell array
%        contents{get(hObject,'Value')} returns selected item from spont_stim_list

end
% --- Executes during object creation, after setting all properties.
function spont_stim_list_CreateFcn(hObject, eventdata, handles)
% hObject    handle to spont_stim_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on button press in load_spont.
function load_spont_Callback(hObject, eventdata, handles)
% hObject    handle to load_spont (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

randomizeSpontaneousCallbacks(hObject, handles.spont_stim_list, handles.primary_obj)
guidata(hObject, handles);

end


% --- Executes on selection change in anti_2_antiDis1_list.
function anti_2_antiDis1_list_Callback(hObject, eventdata, handles)
% hObject    handle to anti_2_antiDis1_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns anti_2_antiDis1_list contents as cell array
%        contents{get(hObject,'Value')} returns selected item from anti_2_antiDis1_list
end

% --- Executes during object creation, after setting all properties.
function anti_2_antiDis1_list_CreateFcn(hObject, eventdata, handles)
% hObject    handle to anti_2_antiDis1_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end
% --- Executes on selection change in anti_2_antiDis2_list.
function anti_2_antiDis2_list_Callback(hObject, eventdata, handles)
% hObject    handle to anti_2_antiDis2_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns anti_2_antiDis2_list contents as cell array
%        contents{get(hObject,'Value')} returns selected item from anti_2_antiDis2_list
end

% --- Executes during object creation, after setting all properties.
function anti_2_antiDis2_list_CreateFcn(hObject, eventdata, handles)
% hObject    handle to anti_2_antiDis2_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
