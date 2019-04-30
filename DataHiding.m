function varargout = DataHiding(varargin)

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DataHiding_OpeningFcn, ...
                   'gui_OutputFcn',  @DataHiding_OutputFcn, ...
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


% --- Executes just before DataHiding is made visible.
function DataHiding_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DataHiding (see VARARGIN)

% Choose default command line output for DataHiding
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
movegui(hObject, 'center');
clc
clear

% UIWAIT makes DataHiding wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DataHiding_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename,pathname] = uigetfile({'*.png;*.jpg;'}, 'memilih gambar');
% [filename,pathname]=uigetfile('*.*');
if ~isequal(filename,0)
    handles.data1 = imread(fullfile(pathname,filename));
    guidata(hObject,handles);
    axes(handles.axes1)
    cla reset
    imshow(handles.data1);
else
    return
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
target = handles.data1;
original=handles.data1;
fid = fopen('pesan.txt','r');
F = fread(fid);
s = char(F');
fclose(fid);

sz1=size(original);
size1=sz1(1)*sz1(2);
sz2=size(F);
size2=sz2(1);


if size2> size1 
    fprintf('\nUkuran file gambar  %d\n',size1);
    fprintf('Ukuran file teks  %d\n',size2);
    disp('File Teks terlalu besar');
else
    fprintf('\nUkuran file Gambar  %d\n',size1);
    fprintf('Ukuran file teks  %d\n',size2);
    disp('File teks lebih kecil');
    i=1;j=1;k=1;
        while k<=size2
        a=F(k);
        o1=original(i,j,1);
        o2=original(i,j,2);
        o3=original(i,j,3);
        
        [r1,r2,r3]=HideText(o1,o2,o3,a); 
        
        target(i,j,1)=r1;
        target(i,j,2)=r2;
        target(i,j,3)=r3;
        
            if(i<sz1(1))
                i=i+1;
            else
                i=1;
                j=j+1;
            end
            k=k+1;
        end
        width=sz1(1);
        txtsz=size2;
        n=size(original);
        target(n(1),n(2),1)=txtsz;% Text Size
        target(n(1),n(2),2)=width;% Image's Width
        
        
        %save secret image
        imwrite(target,'secret.bmp','bmp');
    end
    axes(handles.axes2)
    cla reset
    imshow(target);
    
helpdlg('Data telah sukses disimpan');

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% get key cipher
OBJ = findobj(gcf,'Tag','edit1');
k =get(OBJ,'String');
% Get the Plain Text
OBJ = findobj(gcf,'Tag','edit2');
P = get(OBJ,'String');

CaOut = Caesar(P,k)
% Output the Cipher Text
OBJ = findobj(gcf,'Tag','text6');
%P = get(OBJ,'String');
set(handles.text6,'String',CaOut)
%simpan dalam bentuk text
fid = fopen('pesan.txt','wb');
fwrite(fid,CaOut,'char');
fclose(fid);


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
OBJ = findobj(gcf,'Tag','text6');
s =get(OBJ,'String');
CaOut = ComputeEntropy(s)   
% Output the Cipher Text
OBJ = findobj(gcf,'Tag','text13');
%P = get(OBJ,'String');
set(handles.text13,'String',CaOut)
