function varargout = WorkoutTracker(varargin)
% WORKOUTTRACKER MATLAB code for WorkoutTracker.fig
%      WORKOUTTRACKER, by itself, creates a new WORKOUTTRACKER or raises the existing
%      singleton*.
%
%      H = WORKOUTTRACKER returns the handle to a new WORKOUTTRACKER or the handle to
%      the existing singleton*.
%
%      WORKOUTTRACKER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WORKOUTTRACKER.M with the given input arguments.
%
%      WORKOUTTRACKER('Property','Value',...) creates a new WORKOUTTRACKER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before WorkoutTracker_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to WorkoutTracker_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help WorkoutTracker

% Last Modified by GUIDE v2.5 01-May-2019 05:47:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @WorkoutTracker_OpeningFcn, ...
                   'gui_OutputFcn',  @WorkoutTracker_OutputFcn, ...
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


% --- Executes just before WorkoutTracker is made visible.
function WorkoutTracker_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to WorkoutTracker (see VARARGIN)

% Choose default command line output for WorkoutTracker
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes WorkoutTracker wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = WorkoutTracker_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function heightSlider_Callback(hObject, eventdata, handles)
% hObject    handle to heightSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
heightSliderVal = get(hObject,'Value');
set(handles.heightSlideVal,'String',num2str(heightSliderVal));
setappdata(0,'height',heightSliderVal);


% --- Executes during object creation, after setting all properties.
function heightSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to heightSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function weightSlider_Callback(hObject, eventdata, handles)
% hObject    handle to weightSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
weightSliderVal = get(hObject,'Value');
set(handles.weightSlideVal,'String',num2str(weightSliderVal));
setappdata(0,'weight',weightSliderVal);

% --- Executes during object creation, after setting all properties.
function weightSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to weightSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in startButton.
function startButton_Callback(hObject, eventdata, handles)
% hObject    handle to startButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h=getappdata(0,'height');
%converting height from feet to meters
h=h/3.2808;
w=getappdata(0,'weight');
CalCalc(h,w)

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles) %STOP button
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
exit
