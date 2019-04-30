function varargout = DataRetrieval(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DataRetrieval_OpeningFcn, ...
                   'gui_OutputFcn',  @DataRetrieval_OutputFcn, ...
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


% --- Executes just before DataRetrieval is made visible.
function DataRetrieval_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DataRetrieval (see VARARGIN)

% Choose default command line output for DataRetrieval
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DataRetrieval wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DataRetrieval_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% get key cipher
OBJ = findobj(gcf,'Tag','edit1');
k =get(OBJ,'String');
% Get the Plain Text
OBJ = findobj(gcf,'Tag','text2');
C = get(OBJ,'String');

PLOut = DeCaesar(C,k)
% Output the Cipher Text
OBJ = findobj(gcf,'Tag','text5');
%P = get(OBJ,'String');
set(handles.text5,'String',PLOut)
%simpan dalam bentuk text
fid = fopen('rahasia.txt','wb');
fwrite(fid,PLOut,'char');
fclose(fid);

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname] = uigetfile({'*.bmp'}, 'memilih gambar');
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

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
target = handles.data1;
  n=size(target);
  txtsz=target(n(1),n(2),1);% Text Size
  width=target(n(1),n(2),2);% Image's Width

  i=1;j=1;k=1;
        while k<=txtsz
        
        r1=target(i,j,1);
        r2=target(i,j,2);
        r3=target(i,j,3);
        
        R(k)=FindText(r1,r2,r3);
                
                if(i<width)
                    i=i+1;
                else
                    i=1;
                    j=j+1;
                end
                k=k+1;
        end
        
        fid = fopen('rahasia.txt','wb');
        fwrite(fid,char(R),'char');
        fclose(fid);
        
        fid = fopen('rahasia.txt','r');
        F = fread(fid);
        s = char(F');
        fclose(fid);
        set(handles.text2,'String',s)
        
 helpdlg('data berhasil diambil dari gambar dengan nama rahasia.txt');


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
