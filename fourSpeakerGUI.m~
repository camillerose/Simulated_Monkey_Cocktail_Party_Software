function varargout = fourSpeakerGUI(varargin)
% FOURSPEAKERGUI M-file for fourSpeakerGUI.fig
%      FOURSPEAKERGUI, by itself, creates a new FOURSPEAKERGUI or raises the existing
%      singleton*.
%
%      H = FOURSPEAKERGUI returns the handle to a new FOURSPEAKERGUI or the handle to
%      the existing singleton*.
%
%      FOURSPEAKERGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FOURSPEAKERGUI.M with the given input arguments.
%
%      FOURSPEAKERGUI('Property','Value',...) creates a new FOURSPEAKERGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fourSpeakerGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fourSpeakerGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fourSpeakerGUI

% Last Modified by GUIDE v2.5 21-Sep-2012 15:27:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fourSpeakerGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @fourSpeakerGUI_OutputFcn, ...
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

% --- Executes just before fourSpeakerGUI is made visible.
function fourSpeakerGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fourSpeakerGUI (see VARARGIN)

% Choose default command line output for fourSpeakerGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes fourSpeakerGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end


% --- Outputs from this function are returned to the command line.
function varargout = fourSpeakerGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end


% --- Executes on selection change in condition_menu.
function condition_menu_Callback(hObject, eventdata, handles)
% hObject    handle to condition_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns condition_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from condition_menu


% one condition for now

contents = cellstr(get(hObject, 'String'));
condition = contents{get(hObject, 'Value')};
   
    if strcmp(condition, 'Testing')
        setappdata(0, 'condition', 'Testing');
    else
        disp('Invalid option selected')
    end

end

% --- Executes during object creation, after setting all properties.
function condition_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to condition_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
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


spont_dis = SpontaneousDistracter();
anti_dis_1 = AntiDistracter1();
anti_dis_2 = AntiDistracter2();
primary_obj = PrimaryResponder();

condition_selection = getappdata(0, 'condition');

if strcmp(condition_selection, 'Testing')
    apply_parameters(handles, primary_obj, spont_dis, anti_dis_1, anti_dis_2);
else
    disp('No option has been selected')
end
 
Processing(handles, primary_obj, spont_dis, anti_dis_1, anti_dis_2);

disp('Experiment is over, make sure file has saved before closing GUI')

end


function experimenter_Callback(hObject, eventdata, handles)
% hObject    handle to experimenter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of experimenter as text
%        str2double(get(hObject,'String')) returns contents of experimenter as a double

handles.experimenter = get(hObject,'String');

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


function subject_Callback(hObject, eventdata, handles)
% hObject    handle to subject (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of subject as text
%        str2double(get(hObject,'String')) returns contents of subject as a double

end

% --- Executes during object creation, after setting all properties.
function subject_CreateFcn(hObject, eventdata, handles)
% hObject    handle to subject (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end

function max_length_Callback(hObject, eventdata, handles)
% hObject    handle to max_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max_length as text
%        str2double(get(hObject,'String')) returns contents of max_length as a double
end

% --- Executes during object creation, after setting all properties.
function max_length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
