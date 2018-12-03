function varargout = distracter_speaker(varargin)
% DISTRACTER_SPEAKER M-file for distracter_speaker.fig
%      DISTRACTER_SPEAKER, by itself, creates a new DISTRACTER_SPEAKER or raises the existing
%      singleton*.
%
%      H = DISTRACTER_SPEAKER returns the handle to a new DISTRACTER_SPEAKER or the handle to
%      the existing singleton*.
%
%      DISTRACTER_SPEAKER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DISTRACTER_SPEAKER.M with the given input arguments.
%
%      DISTRACTER_SPEAKER('Property','Value',...) creates a new DISTRACTER_SPEAKER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before distracter_speaker_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to distracter_speaker_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help distracter_speaker

% Last Modified by GUIDE v2.5 28-Aug-2012 12:00:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @distracter_speaker_OpeningFcn, ...
                   'gui_OutputFcn',  @distracter_speaker_OutputFcn, ...
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

% --- Executes just before distracter_speaker is made visible.
function distracter_speaker_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to distracter_speaker (see VARARGIN)

% Choose default command line output for distracter_speaker
handles.output = hObject;

handles.distracter_obj = SpontaneousDistracter();

guidata(hObject, handles);

%fast testing
setappdata(0, 'distracter_speaker_handles', handles);

% Update handles structure

% UIWAIT makes distracter_speaker wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end

% --- Outputs from this function are returned to the command line.
function varargout = distracter_speaker_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end


function dis_anti_low_Callback(hObject, eventdata, handles)
% hObject    handle to dis_anti_low (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dis_anti_low as text
%        str2double(get(hObject,'String')) returns contents of dis_anti_low as a double


handles.distracter_obj.anti_low = str2double(get(hObject,'String'));
guidata(hObject, handles);
end
% --- Executes during object creation, after setting all properties.
function dis_anti_low_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dis_anti_low (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end

function dis_anti_hi_Callback(hObject, eventdata, handles)
% hObject    handle to dis_anti_hi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dis_anti_hi as text
%        str2double(get(hObject,'String')) returns contents of dis_anti_hi as a double
handles.distracter_obj.anti_hi = str2double(get(hObject,'String'));
guidata(hObject, handles);
end
% --- Executes during object creation, after setting all properties.
function dis_anti_hi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dis_anti_hi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function dis_prob_response_Callback(hObject, eventdata, handles)
% hObject    handle to dis_prob_response (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dis_prob_response as text
%        str2double(get(hObject,'String')) returns contents of dis_prob_response as a double

handles.distracter_obj.probResponse = str2double(get(hObject,'String'));

end
% --- Executes during object creation, after setting all properties.
function dis_prob_response_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dis_prob_response (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end

function dis_spont_low_Callback(hObject, eventdata, handles)
% hObject    handle to dis_spont_low (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dis_spont_low as text
%        str2double(get(hObject,'String')) returns contents of dis_spont_low as a double

handles.distracter_obj.spont_low = str2double(get(hObject,'String'));
guidata(hObject, handles);
end
% --- Executes during object creation, after setting all properties.
function dis_spont_low_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dis_spont_low (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function dis_spont_hi_Callback(hObject, eventdata, handles)
% hObject    handle to dis_spont_hi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dis_spont_hi as text
%        str2double(get(hObject,'String')) returns contents of dis_spont_hi as a double

handles.distracter_obj.spont_hi = str2double(get(hObject,'String'));
guidata(hObject, handles);
end
% --- Executes during object creation, after setting all properties.
function dis_spont_hi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dis_spont_hi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function dis_channel_Callback(hObject, eventdata, handles)
% hObject    handle to dis_channel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dis_channel as text
%        str2double(get(hObject,'String')) returns contents of dis_channel as a double
handles.distracter_obj.channel = str2double(get(hObject,'String'));
guidata(hObject, handles);
end
% --- Executes during object creation, after setting all properties.
function dis_channel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dis_channel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on selection change in dis_stimList.
function dis_stimList_Callback(hObject, eventdata, handles)
% hObject    handle to dis_stimList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns dis_stimList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from dis_stimList
end

% --- Executes during object creation, after setting all properties.
function dis_stimList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dis_stimList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on button press in dis_load_stim.
function dis_load_stim_Callback(hObject, eventdata, handles)
% hObject    handle to dis_load_stim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

randomizeAntiphonalCallbacks(hObject, handles.dis_stimList, handles.distracter_obj)
guidata(hObject, handles);
end

% --- Executes on button press in load_dis.
function load_dis_Callback(hObject, eventdata, handles)
% hObject    handle to load_dis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setappdata(0, 'distracter_speaker', handles.distracter_obj);
set(handles.text11, 'String', 'LOADED');
guidata(hObject, handles);

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


% --- Executes on button press in load_spont.
function load_spont_Callback(hObject, eventdata, handles)
% hObject    handle to load_spont (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

randomizeSpontaneousCallbacks(hObject, handles.spont_stim_list, handles.distracter_obj)
guidata(hObject, handles);

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



function distracter_min_stim_Callback(hObject, eventdata, handles)
% hObject    handle to distracter_min_stim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of distracter_min_stim as text
%        str2double(get(hObject,'String')) returns contents of distracter_min_stim as a double

handles.distracter_obj.min_stim = str2double(get(hObject,'String'));
end

% --- Executes during object creation, after setting all properties.
function distracter_min_stim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to distracter_min_stim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


% --- Executes on button press in fill_button.
function fill_button_Callback(hObject, eventdata, handles)
% hObject    handle to fill_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end