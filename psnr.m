function varargout = psnr(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @psnr_OpeningFcn, ...
                   'gui_OutputFcn',  @psnr_OutputFcn, ...
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

function psnr_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to psnr (see VARARGIN)

% Choose default command line output for psnr
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes psnr wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = psnr_OutputFcn(hObject, eventdata, handles) 
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
global image;
[namafile,formatfile] = uigetfile({'*.png;*.jpg'}, 'memilih gambar');
image = imread([formatfile,namafile]);
handles.image = image;
guidata(hObject,handles);
axes(handles.gambar1);
imshow(image);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image2;
[namafile,formatfile] = uigetfile({'*.bmp'}, 'memilih gambar');
image2 = imread([formatfile,namafile]);
handles.image = image2;
guidata(hObject,handles);
axes(handles.gambar2);

imshow(image2);



function mse_r_Callback(hObject, eventdata, handles)
% hObject    handle to mse_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mse_r as text
%        str2double(get(hObject,'String')) returns contents of mse_r as a double


% --- Executes during object creation, after setting all properties.
function mse_r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mse_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mse_g_Callback(hObject, eventdata, handles)
% hObject    handle to mse_g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mse_g as text
%        str2double(get(hObject,'String')) returns contents of mse_g as a double


% --- Executes during object creation, after setting all properties.
function mse_g_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mse_g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mse_b_Callback(hObject, eventdata, handles)
% hObject    handle to mse_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mse_b as text
%        str2double(get(hObject,'String')) returns contents of mse_b as a double


% --- Executes during object creation, after setting all properties.
function mse_b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mse_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mse_t_Callback(hObject, eventdata, handles)
% hObject    handle to mse_t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mse_t as text
%        str2double(get(hObject,'String')) returns contents of mse_t as a double


% --- Executes during object creation, after setting all properties.
function mse_t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mse_t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function psnr_r_Callback(hObject, eventdata, handles)
% hObject    handle to psnr_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of psnr_r as text
%        str2double(get(hObject,'String')) returns contents of psnr_r as a double


% --- Executes during object creation, after setting all properties.
function psnr_r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to psnr_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function psnr_g_Callback(hObject, eventdata, handles)
% hObject    handle to psnr_g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of psnr_g as text
%        str2double(get(hObject,'String')) returns contents of psnr_g as a double


% --- Executes during object creation, after setting all properties.
function psnr_g_CreateFcn(hObject, eventdata, handles)
% hObject    handle to psnr_g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function psnr_b_Callback(hObject, eventdata, handles)
% hObject    handle to psnr_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of psnr_b as text
%        str2double(get(hObject,'String')) returns contents of psnr_b as a double


% --- Executes during object creation, after setting all properties.
function psnr_b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to psnr_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function psnr_t_Callback(hObject, eventdata, handles)
% hObject    handle to psnr_t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of psnr_t as text
%        str2double(get(hObject,'String')) returns contents of psnr_t as a double


% --- Executes during object creation, after setting all properties.
function psnr_t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to psnr_t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global image;
global image2;


[baris,kolom,channel] = size(image);
[baris_s,kolom_s,channel_s] = size(image2);
cover_image = double(image);
stego_image = double(image2);


cover_r = cover_image(:,:,1);
cover_g = cover_image(:,:,2);
cover_b = cover_image(:,:,3);


stego_r = stego_image(:,:,1);
stego_g = stego_image(:,:,2);
stego_b = stego_image(:,:,3);


if baris ~= baris_s && kolom ~= kolom_s && channel ~= channel_s
    disp('dimensi gambar cover dan stego berbeda');

else    
    piksel_r = zeros(baris, kolom);
    piksel_g = zeros(baris, kolom);
    piksel_b = zeros(baris, kolom);


    for i=1:baris
        for j=1:kolom
            piksel_r(i,j) = (stego_r(i,j) - cover_r(i,j))^2;
            piksel_g(i,j) = (stego_g(i,j) - cover_g(i,j))^2;
            piksel_b(i,j) = (stego_b(i,j) - cover_b(i,j))^2;
        end       
    end
end


kolom_r = sum(piksel_r);
kolom_g = sum(piksel_g);
kolom_b = sum(piksel_b);

baris_r = sum(kolom_r,2);
baris_g = sum(kolom_g,2);
baris_b = sum(kolom_b,2);

MSE_r = baris_r/(baris * kolom);
MSE_g = baris_g/(baris * kolom);
MSE_b = baris_b/(baris * kolom);
MSE_total = (MSE_r + MSE_g + MSE_b) / 3;

max_stego_r = max(stego_r(:));
max_stego_g = max(stego_g(:));
max_stego_b = max(stego_b(:));

max_cover_r = max(cover_r(:));
max_cover_g = max(cover_g(:));
max_cover_b = max(cover_b(:));

max_r = max(max_stego_r, max_cover_r);
max_g = max(max_stego_g, max_cover_g);
max_b = max(max_stego_b, max_cover_b);

PSNR_r = 10*(log(max_r/MSE_r));
PSNR_g = 10*(log(max_g/MSE_g));
PSNR_b = 10*(log(max_b/MSE_b));

PSNR_total = (PSNR_r + PSNR_g + PSNR_b)/3;

% set(handles.mse_r, 'String',MSE_r);
% set(handles.mse_g, 'String',MSE_g);
% set(handles.mse_b, 'String',MSE_b);
set(handles.mse_t, 'String',MSE_total);
% 
% set(handles.psnr_r, 'String',PSNR_r);
% set(handles.psnr_g, 'String',PSNR_g);
% set(handles.psnr_b, 'String',PSNR_b);
set(handles.psnr_t, 'String',PSNR_total);




function ssim_Callback(hObject, eventdata, handles)
% hObject    handle to ssim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ssim as text
%        str2double(get(hObject,'String')) returns contents of ssim as a double


% --- Executes during object creation, after setting all properties.
function ssim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ssim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
