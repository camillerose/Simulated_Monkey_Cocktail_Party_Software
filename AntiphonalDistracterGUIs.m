function varargout = AntiphonalDistracterGUIs(varargin)
% ANTIPHONALDISTRACTERGUIS M-file for AntiphonalDistracterGUIs.fig
%      ANTIPHONALDISTRACTERGUIS, by itself, creates a new ANTIPHONALDISTRACTERGUIS or raises the existing
%      singleton*.
%
%      H = ANTIPHONALDISTRACTERGUIS returns the handle to a new ANTIPHONALDISTRACTERGUIS or the handle to
%      the existing singleton*.
%
%      ANTIPHONALDISTRACTERGUIS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANTIPHONALDISTRACTERGUIS.M with the given input arguments.
%
%      ANTIPHONALDISTRACTERGUIS('Property','Value',...) creates a new ANTIPHONALDISTRACTERGUIS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AntiphonalDistracterGUIs_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AntiphonalDistracterGUIs_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AntiphonalDistracterGUIs

% Last Modified by GUIDE v2.5 14-Aug-2012 14:59:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AntiphonalDistracterGUIs_OpeningFcn, ...
                   'gui_OutputFcn',  @AntiphonalDistracterGUIs_OutputFcn, ...
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


% --- Executes just before AntiphonalDistracterGUIs is made visible.
function AntiphonalDistracterGUIs_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AntiphonalDistracterGUIs (see VARARGIN)

% Choose default command line output for AntiphonalDistracterGUIs
handles.output = hObject;


handles.antiDistracter1_obj = AntiDistracter1();
handles.antiDistracter2_obj = AntiDistracter2();


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AntiphonalDistracterGUIs wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end

% --- Outputs from this function are returned to the command line.
function varargout = AntiphonalDistracterGUIs_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end


function AD1_antiLow_Callback(hObject, eventdata, handles)
% hObject    handle to AD1_antiLow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AD1_antiLow as text
%        str2double(get(hObject,'String')) returns contents of AD1_antiLow as a double

handles.antiDistracter1_obj.anti_low = str2double(get(hObject, 'String'));
guidata(hObject, handles);
end

% --- Executes during object creation, after setting all properties.
function AD1_antiLow_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AD1_antiLow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function AD1_antiHi_Callback(hObject, eventdata, handles)
% hObject    handle to AD1_antiHi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AD1_antiHi as text
%        str2double(get(hObject,'String')) returns contents of AD1_antiHi as a double
handles.antiDistracter1_obj.anti_hi = str2double(get(hObject, 'String'));
guidata(hObject, handles);
end


% --- Executes during object creation, after setting all properties.
function AD1_antiHi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AD1_antiHi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function AD1_probResp_Callback(hObject, eventdata, handles)
% hObject    handle to AD1_probResp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AD1_probResp as text
%        str2double(get(hObject,'String')) returns contents of AD1_probResp as a double
handles.antiDistracter1_obj.probResponse = str2double(get(hObject, 'String'));
guidata(hObject, handles);
end



% --- Executes during object creation, after setting all properties.
function AD1_probResp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AD1_probResp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


% --- Executes on selection change in AD1_antiStimList.
function AD1_antiStimList_Callback(hObject, eventdata, handles)
% hObject    handle to AD1_antiStimList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns AD1_antiStimList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from AD1_antiStimList
end


% --- Executes during object creation, after setting all properties.
function AD1_antiStimList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AD1_antiStimList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on button press in AD1_loadAnti.
function AD1_loadAnti_Callback(hObject, eventdata, handles)
% hObject    handle to AD1_loadAnti (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
randomizeAntiphonalCallbacks(hObject, handles.AD1_antiStimList, handles.antiDistracter1_obj)
guidata(hObject, handles);
end


% --- Executes on button press in AD1_loadParams.
function AD1_loadParams_Callback(hObject, eventdata, handles)
% hObject    handle to AD1_loadParams (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0, 'antiDistracter1', handles.antiDistracter1_obj);
set(handles.AD1_paramStatus, 'String', 'LOADED');
guidata(hObject, handles);
end


% --- Executes on button press in AD1_loadSpont.
function AD1_loadSpont_Callback(hObject, eventdata, handles)
% hObject    handle to AD1_loadSpont (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
randomizeSpontaneousCallbacks(hObject, handles.AD1_spontStimList, handles.antiDistracter1_obj)
guidata(hObject, handles);
end


% --- Executes on selection change in AD1_spontStimList.
function AD1_spontStimList_Callback(hObject, eventdata, handles)
% hObject    handle to AD1_spontStimList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns AD1_spontStimList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from AD1_spontStimList
end


% --- Executes during object creation, after setting all properties.
function AD1_spontStimList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AD1_spontStimList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function AD1_minStim_Callback(hObject, eventdata, handles)
% hObject    handle to AD1_minStim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AD1_minStim as text
%        str2double(get(hObject,'String')) returns contents of AD1_minStim as a double

handles.antiDistracter1_obj.min_stim = str2double(get(hObject,'String'));
guidata(hObject, handles);
end

% --- Executes during object creation, after setting all properties.
function AD1_minStim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AD1_minStim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function AD1_spontLow_Callback(hObject, eventdata, handles)
% hObject    handle to AD1_spontLow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AD1_spontLow as text
%        str2double(get(hObject,'String')) returns contents of AD1_spontLow as a double

handles.antiDistracter1_obj.spont_low = str2double(get(hObject,'String'));
guidata(hObject, handles);
end

% --- Executes during object creation, after setting all properties.
function AD1_spontLow_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AD1_spontLow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function AD1_spontHi_Callback(hObject, eventdata, handles)
% hObject    handle to AD1_spontHi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AD1_spontHi as text
%        str2double(get(hObject,'String')) returns contents of AD1_spontHi as a double
handles.antiDistracter1_obj.spont_hi = str2double(get(hObject,'String'));
guidata(hObject, handles);
end



% --- Executes during object creation, after setting all properties.
function AD1_spontHi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AD1_spontHi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function AD2_antiLow_Callback(hObject, eventdata, handles)
% hObject    handle to AD2_antiLow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AD2_antiLow as text
%        str2double(get(hObject,'String')) returns contents of AD2_antiLow as a double
handles.antiDistracter2_obj.anti_low = str2double(get(hObject,'String'));
guidata(hObject, handles);
end

% --- Executes during object creation, after setting all properties.
function AD2_antiLow_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AD2_antiLow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function AD2_antiHi_Callback(hObject, eventdata, handles)
% hObject    handle to AD2_antiHi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AD2_antiHi as text
%        str2double(get(hObject,'String')) returns contents of AD2_antiHi as a double
handles.antiDistracter2_obj.anti_hi = str2double(get(hObject,'String'));
guidata(hObject, handles);
end


% --- Executes during object creation, after setting all properties.
function AD2_antiHi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AD2_antiHi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function AD2_probResp_Callback(hObject, eventdata, handles)
% hObject    handle to AD2_probResp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AD2_probResp as text
%        str2double(get(hObject,'String')) returns contents of AD2_probResp as a double
handles.antiDistracter2_obj.probResponse = str2double(get(hObject,'String'));
guidata(hObject, handles);
end


% --- Executes during object creation, after setting all properties.
function AD2_probResp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AD2_probResp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function AD2_spontLow_Callback(hObject, eventdata, handles)
% hObject    handle to AD2_spontLow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AD2_spontLow as text
%        str2double(get(hObject,'String')) returns contents of AD2_spontLow as a double
handles.antiDistracter2_obj.spont_low = str2double(get(hObject,'String'));
guidata(hObject, handles);
end


% --- Executes during object creation, after setting all properties.
function AD2_spontLow_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AD2_spontLow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function AD2_spontHi_Callback(hObject, eventdata, handles)
% hObject    handle to AD2_spontHi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AD2_spontHi as text
%        str2double(get(hObject,'String')) returns contents of AD2_spontHi as a double
handles.antiDistracter2_obj.spont_hi = str2double(get(hObject,'String'));
guidata(hObject, handles);
end


% --- Executes during object creation, after setting all properties.
function AD2_spontHi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AD2_spontHi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


% --- Executes on selection change in AD2_antiStimList.
function AD2_antiStimList_Callback(hObject, eventdata, handles)
% hObject    handle to AD2_antiStimList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns AD2_antiStimList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from AD2_antiStimList
end

% --- Executes during object creation, after setting all properties.
function AD2_antiStimList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AD2_antiStimList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


% --- Executes on button press in AD2_loadAnti.
function AD2_loadAnti_Callback(hObject, eventdata, handles)
% hObject    handle to AD2_loadAnti (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
randomizeAntiphonalCallbacks(hObject, handles.AD2_antiStimList, handles.antiDistracter2_obj)
guidata(hObject, handles);
end



% --- Executes on button press in AD2_loadParams.
function AD2_loadParams_Callback(hObject, eventdata, handles)
% hObject    handle to AD2_loadParams (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0, 'antiDistracter2', handles.antiDistracter2_obj);
set(handles.AD2_paramStatus, 'String', 'LOADED');
guidata(hObject, handles);
end


% --- Executes on button press in AD2_loadSpont.
function AD2_loadSpont_Callback(hObject, eventdata, handles)
% hObject    handle to AD2_loadSpont (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

randomizeSpontaneousCallbacks(hObject, handles.AD2_spontStimList, handles.antiDistracter2_obj)
guidata(hObject, handles);
end


% --- Executes on selection change in AD2_spontStimList.
function AD2_spontStimList_Callback(hObject, eventdata, handles)
% hObject    handle to AD2_spontStimList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns AD2_spontStimList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from AD2_spontStimList
end


% --- Executes during object creation, after setting all properties.
function AD2_spontStimList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AD2_spontStimList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function AD2_minStim_Callback(hObject, eventdata, handles)
% hObject    handle to AD2_minStim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AD2_minStim as text
%        str2double(get(hObject,'String')) returns contents of AD2_minStim as a double
handles.antiDistracter2_obj.min_stim = str2double(get(hObject,'String'));
guidata(hObject, handles);
end



% --- Executes during object creation, after setting all properties.
function AD2_minStim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AD2_minStim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
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
