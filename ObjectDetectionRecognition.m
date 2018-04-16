function varargout = ObjectDetectionRecognition(varargin)
% OBJECTDETECTIONRECOGNITION MATLAB code for ObjectDetectionRecognition.fig
%      OBJECTDETECTIONRECOGNITION, by itself, creates a new OBJECTDETECTIONRECOGNITION or raises the existing
%      singleton*.
%
%      H = OBJECTDETECTIONRECOGNITION returns the handle to a new OBJECTDETECTIONRECOGNITION or the handle to
%      the existing singleton*.
%
%      OBJECTDETECTIONRECOGNITION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OBJECTDETECTIONRECOGNITION.M with the given input arguments.
%
%      OBJECTDETECTIONRECOGNITION('Property','Value',...) creates a new OBJECTDETECTIONRECOGNITION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ObjectDetectionRecognition_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ObjectDetectionRecognition_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ObjectDetectionRecognition

% Last Modified by GUIDE v2.5 24-Dec-2017 01:36:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ObjectDetectionRecognition_OpeningFcn, ...
                   'gui_OutputFcn',  @ObjectDetectionRecognition_OutputFcn, ...
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


% --- Executes just before ObjectDetectionRecognition is made visible.
function ObjectDetectionRecognition_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ObjectDetectionRecognition (see VARARGIN)

% Choose default command line output for ObjectDetectionRecognition
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ObjectDetectionRecognition wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ObjectDetectionRecognition_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img 
global segimg
[FileName,PathName,FilterIndex] = uigetfile({'*.jpg'},'Image 1 Selector')
img = imread(strcat(PathName,FileName));
axes1=img;
axes(handles.axes1);
image(axes1)
segimg = split(FileName,'.jpg'); 
segimg = strcat(segimg{1},'.png');
%segimg = char(segimg);
segimg =imread(strcat(PathName,segimg));
% Display the image
imshow(img);
handles.img=img;
guidata(hObject, handles); % updates handles structure
% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when selected object is changed in uibuttongroup3.
function uibuttongroup3_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup3 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% handles.ClassificationAlgo= ClassificationAlgo;
% guidata(hObject, handles);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
switch get(get(handles.uibuttongroup1,'SelectedObject'),'Tag')
    case 'radiobutton1'
        FeaturesExtractionAlgo = 1;
    case 'radiobutton2'
        FeaturesExtractionAlgo = 2;
    case 'radiobutton3'
        FeaturesExtractionAlgo = 3;
end
switch get(get(handles.uibuttongroup3,'SelectedObject'),'Tag')
    case 'radiobutton4'
        ClassificationAlgo = 1;
    case 'radiobutton5'
        ClassificationAlgo = 2;
    case 'radiobutton6'
        ClassificationAlgo = 3;
end

%%
global segimg;
global img;
orignialImage = img;
segImage = segimg;
h = waitbar(0,'Please wait...');
output = ObjectDetectioAndRecognition(orignialImage,segImage,FeaturesExtractionAlgo,ClassificationAlgo,h);
%waitbar(1,h,'finished');
delete(h);
imshow(output);
%%


% --- Executes when uibuttongroup3 is resized.
function uibuttongroup3_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
