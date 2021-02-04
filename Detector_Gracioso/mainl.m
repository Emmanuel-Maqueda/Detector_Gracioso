function varargout = mainl(varargin)
% MAINL MATLAB code for mainl.fig
%      MAINL, by itself, creates a new MAINL or raises the existing
%      singleton*.
%
%      H = MAINL returns the handle to a new MAINL or the handle to
%      the existing singleton*.
%
%      MAINL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINL.M with the given input arguments.
%
%      MAINL('Property','Value',...) creates a new MAINL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mainl_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mainl_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mainl

% Last Modified by GUIDE v2.5 15-Jan-2021 01:07:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mainl_OpeningFcn, ...
                   'gui_OutputFcn',  @mainl_OutputFcn, ...
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


% --- Executes just before mainl is made visible.
function mainl_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mainl (see VARARGIN)

% Choose default command line output for mainl
handles.output = hObject;

movegui(gcf,'center');
logo = imread('uni.jpg');
set(handles.axes1, 'XTick', []); set(handles.axes1, 'YTick', []);
axes(handles.axes1);
Y = imresize(logo,[110 100],'bilinear');
imshow(Y);

a=imread('galerialogo2.png');

set(handles.pushbutton1,'CData',a)
b=imread('fotologo2.png');
set(handles.pushbutton2,'CData',b)


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mainl wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mainl_OutputFcn(hObject, eventdata, handles) 
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
close(mainl);
detector_imagen;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(mainl);
detector_foto;
