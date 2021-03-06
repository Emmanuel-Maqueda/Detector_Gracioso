function varargout = detector_foto(varargin)
% DETECTOR_FOTO MATLAB code for detector_foto.fig
%      DETECTOR_FOTO, by itself, creates a new DETECTOR_FOTO or raises the existing
%      singleton*.
%
%      H = DETECTOR_FOTO returns the handle to a new DETECTOR_FOTO or the handle to
%      the existing singleton*.
%
%      DETECTOR_FOTO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DETECTOR_FOTO.M with the given input arguments.
%
%      DETECTOR_FOTO('Property','Value',...) creates a new DETECTOR_FOTO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before detector_foto_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to detector_foto_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help detector_foto

% Last Modified by GUIDE v2.5 18-Jan-2021 19:17:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @detector_foto_OpeningFcn, ...
                   'gui_OutputFcn',  @detector_foto_OutputFcn, ...
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


% --- Executes just before detector_foto is made visible.
function detector_foto_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to detector_foto (see VARARGIN)

% Choose default command line output for detector_foto
handles.output = hObject;



% Update handles structure
guidata(hObject, handles);

% UIWAIT makes detector_foto wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = detector_foto_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
set(handles.detectar,'enable','off');
set(handles.nariz,'enable','off');
set(handles.ojos,'enable','off');
set(handles.limpiar,'enable','off');
set(handles.mascara,'enable','off');
set(handles.agregar,'enable','off');
set(handles.guardar,'enable','off');
set(handles.fotog,'enable','on');

movegui(gcf,'center');
set(handles.axes1, 'XTick', []); set(handles.axes1, 'YTick', []);
global camara IMAGEN n_path1 flag;

name = mfilename;
path = mfilename('fullpath');
n_path1 = path(1:end-length(name)-1);

hold on
axes(handles.axes1);  
%camara = videoinput('winvideo',1,'MJPG_1280x720')
camara = webcam


flag = true;

while flag
    IMAGEN = snapshot(camara);
    
    %IMAGEN = image(IMAGEN);
    imshow(IMAGEN)
    fprintf('foto \n');
end
fprintf('acabamos');
hold off

	









% --- Executes on button press in detectar.
function detectar_Callback(hObject, eventdata, handles)
% hObject    handle to detectar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global IMAGEN;

mensaje = 'Escoja una opcion a detectar';
button = menu(mensaje, 'Cara', 'Cabeza y Tronco', 'Ojos', 'Boca', 'Nariz', 'Cancelar');

permitir = false;

switch button
    case 1, escoja='FrontalFaceCART'; permitir=true;
    case 2, escoja='UpperBody'; permitir=true;
    case 3, escoja='EyePairBig'; permitir=true;
    case 4, escoja='Mouth'; permitir=true;
    case 5, escoja='Nose'; permitir=true;
    case 6
end

if (permitir)
    %detecta la opcion que se esocoje
    BB = detecta( IMAGEN, escoja );
    
    
    axes(handles.axes1);
    imshow(IMAGEN); hold on;
    

    for i=1:size(BB,1)
        rectangle('Position',BB(i,:), 'LineWidth',5, 'LineStyle','-', 'EdgeColor','r');
    end
    hold off;
end




% --- Executes on button press in guardar.
function guardar_Callback(hObject, eventdata, handles)
% hObject    handle to guardar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global IMAGEN n_path1;

% Directorio predefinido
[filename, pathname] = uiputfile({'*.jpg';'*.tif';'*.png'},'Guardar IMAGEN',n_path1);
if isequal(filename,0)
else
    imwrite(IMAGEN,fullfile(pathname, filename));
end

 


% --- Executes on button press in limpiar.

function limpiar_Callback(hObject, eventdata, handles)
% hObject    handle to limpiar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1,'reset')
set(handles.axes1, 'XTick', []); set(handles.axes1, 'YTick', []);

set(handles.guardar,'enable','off')
set(handles.limpiar,'enable','off')
set(handles.mascara,'enable','off')
set(handles.nariz,'enable','off')
set(handles.ojos,'enable','off')
set(handles.detectar,'enable','off')
set(handles.agregar,'enable','off')
set(handles.fotog,'enable','on');



hold on
axes(handles.axes1);  
%camara = videoinput('winvideo',1,'MJPG_1280x720')
camara = webcam

global flag IMAGEN;
flag = true;

while flag
    IMAGEN = snapshot(camara);
    
    %IMAGEN = image(IMAGEN);
    imshow(IMAGEN)
    fprintf('foto \n');
end
fprintf('acabamos');
hold off














% --- Executes on button press in mascara.
function mascara_Callback(hObject, eventdata, handles)
% hObject    handle to mascara (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global IMAGEN n_path1;

% Funcion detectar personas
BB = detecta( IMAGEN, 'FrontalFaceCART' );

% Lee el objeto a agregar desde iconos mask2
[filename, pathname] = uigetfile({'*.png'},'Cargar mascara',[n_path1, '\mascara']);
[IMpequena,~,alfa] = imread(fullfile(pathname, filename));
% Adiciona el objeto a la IMAGEN original
for i=1:1:size(BB,1)
    IMAGEN = agrega( IMAGEN, IMpequena, alfa, BB(i,1), BB(i,2), BB(i,4), BB(i,3) );
end
hold on
axes(handles.axes1);
imshow(IMAGEN);
hold off


% --- Executes on button press in nariz.
function nariz_Callback(hObject, eventdata, handles)
% hObject    handle to nariz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global IMAGEN n_path1;

BB = detecta( IMAGEN, 'Nose' );

[filename, pathname] = uigetfile({'*.png'},'Cargar nariz',[n_path1, '\nariz']);
[IMpequena,~,alfa] = imread(fullfile(pathname, filename));
for i=1:1:size(BB,1)
    IMAGEN = agrega( IMAGEN, IMpequena, alfa, BB(i,1), BB(i,2), BB(i,4), BB(i,3) );
end
hold on
axes(handles.axes1);
imshow(IMAGEN);
hold off





% --- Executes on button press in ojos.
function ojos_Callback(hObject, eventdata, handles)
% hObject    handle to ojos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global IMAGEN n_path1;

BB = detecta( IMAGEN, 'EyePairBig' );


[filename, pathname] = uigetfile({'*.png'},'Cargar ojos',[n_path1, '\ojos']);
[IMpequena,~,alfa] = imread(fullfile(pathname, filename));
for i=1:1:size(BB,1)
    IMAGEN = agrega( IMAGEN, IMpequena, alfa, BB(i,1), BB(i,2), BB(i,4), BB(i,3) );
end
hold on
axes(handles.axes1);
imshow(IMAGEN);
hold off




% --- Executes on button press in agregar.
function agregar_Callback(hObject, eventdata, handles)
% hObject    handle to agregar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global IMAGEN n_path1;
    
    button = questdlg('Cuando continúe, debe hacer clic en una zona IMAGEN y mantener presionado el clic. Mueva el mouse, seleccionando un área de la figura. Al levantar el clic, puede elegir un icono PNG a su gusto, que aparecerá en la ubicación seleccionada. ', ...
         'Insertar icono:', 'Continuar', 'Cancelar', 'Continuar');
    
    switch button
        case 'Cancelar'
        case 'Continuar'
            
            k1 = waitforbuttonpress;
            punto1 = get(handles.axes1,'CurrentPoint');                     
            k2 = rbbox;
            punto2 = get(handles.axes1,'CurrentPoint');                    
            
            punto1 = punto1(1,1:2);                                         
            punto2 = punto2(1,1:2);
            inicio = min(punto1,punto2);                                    
            dimension = abs(punto1-punto2);
            
            x1 = round(inicio(1));
            x2 = round(inicio(1)+dimension(1));
            y1 = round(inicio(2));
            y2 = round(inicio(2)+dimension(2));
            
            if (y2-y1>0) && (x2-x1>0)       
                [filename, pathname] = uigetfile({'*.png'},'Cargar PNG',[n_path1, '\items']);
                if isequal(filename,0)
                else
                    
                    [icone,~,alfa] = imread(fullfile(pathname, filename));
                    
                    IMAGEN = agrega( IMAGEN, icone, alfa, x1, y1, y2-y1, x2-x1 );
                    
                    
                    hold on
                    axes(handles.axes1);
                    imshow(IMAGEN);
                    hold off
                end
                
            else
                
                button = questdlg('Ha ocurrido un error, vuelve a intentarlo','OK','OK');
                switch button
                    case 'OK'
                end
            end
    end


% --- Executes on button press in regresar.
function regresar_Callback(hObject, eventdata, handles)
% hObject    handle to regresar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close(detector_foto);
mainl;

% --- Executes on button press in salir.
function salir_Callback(hObject, eventdata, handles)
% hObject    handle to salir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

clear all
close all


% --- Executes on button press in fotog.
function fotog_Callback(hObject, eventdata, handles)
% hObject    handle to fotog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global flag
flag = false;

set(handles.detectar,'enable','on');
set(handles.nariz,'enable','on');
set(handles.ojos,'enable','on');
set(handles.limpiar,'enable','on');
set(handles.mascara,'enable','on');
set(handles.agregar,'enable','on');
set(handles.guardar,'enable','on');
set(handles.fotog,'enable','off');
