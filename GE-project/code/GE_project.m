function varargout = GE_project(varargin)
% GE_PROJECT M-file for GE_project.fig
%      GE_PROJECT, by itself, creates a new GE_PROJECT or raises the existing
%      singleton*.
%
%      H = GE_PROJECT returns the handle to a new GE_PROJECT or the handle to
%      the existing singleton*.
%
%      GE_PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GE_PROJECT.M with the given input arguments.
%
%      GE_PROJECT('Property','Value',...) creates a new GE_PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GE_project_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GE_project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GE_project

% Last Modified by GUIDE v2.5 01-Oct-2011 14:31:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @GE_project_OpeningFcn, ...
    'gui_OutputFcn',  @GE_project_OutputFcn, ...
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


% --- Executes just before GE_project is made visible.
function GE_project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GE_project (see VARARGIN)

% Choose default command line output for GE_project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GE_project wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% set(gcf,'ToolBar','figure');    % 设置工具栏
s = pwd;
logfile = dir(s);
[logRows, logCols] = size(logfile);
TF = 0;
for i = 1:logRows
    
    TF = strcmp('log.mat',logfile(i).name);
    if TF == 1
        break;
    end
end
if TF
    load('log.mat');
    setappdata(gcf,'directory_name',directory_name);
else
    warndlg('You may be lost the log.mat file! add this file to the same folder of the exe program');
end


axes(handles.axes1);           % 初始化四个坐标系
axis('off');
h1 = gca;
setappdata(gcf,'h1',h1);
% set(h1,'DataAspectRatioMode','auto');

axes(handles.axes2);           % 初始化四个坐标系
axis('off');
h2 = gca;
setappdata(gcf,'h2',h2);
% set(h2,'DataAspectRatioMode','auto');

axes(handles.axes3);           % 初始化四个坐标系
axis('off');
h3 = gca;
setappdata(gcf,'h3',h3);
% set(h3,'DataAspectRatioMode','auto');

axes(handles.axes4);           % 初始化四个坐标系
axis('off');
h4 = gca;
setappdata(gcf,'h4',h4);


abstract = 1;
setappdata(gcf,'abstract',abstract);

% This cof is a parameter related to DataaspectRation;
setappdata(gcf,'cof',2.5);

set(findobj('tag','t_nod'),'string','');

set(findobj('tag','t_x_l'),'string','');
set(findobj('tag','t_x_h'),'string','');

set(findobj('tag','t_y_l'),'string','');
set(findobj('tag','t_y_h'),'string','');

set(findobj('tag','t_z_l'),'string','');
set(findobj('tag','t_z_h'),'string','');

set(findobj('tag','t_xy'),'string','');
set(findobj('tag','t_zy'),'string','');
set(findobj('tag','t_xz'),'string','');

setappdata(gcf,'meshx',1000000);
setappdata(gcf,'meshy',1000000);
setappdata(gcf,'meshz',1000000);

Debug = 0;
setappdata(gcf,'Debug',Debug);

if Debug == 1
    set(findobj('tag','panel_defectsDetection'),'Visible','on');
else
    set(findobj('tag','panel_defectsDetection'),'Visible','off');
end

% DataInformation.Lx = 0;
% DataInformation.Ly = 0;
% DataInformation.Lz = 0;
% DataInformation.frows = 0;
% DataInformation.directory_name = 'no';
% DataInformation.list_text = 'no';
% DataInformation.calibration = zeros(1, 1);
% DataInformation.calibrationFlag = 0;
% DataInformation.meshx = 0;
% DataInformation.meshy = 0;
% DataInformation.meshz = 0;
% DataInformation.DICOM = 'ok';
% DataInformation.dicomPath = 'no';
% DataInformation.dicomPathCal = 'no';
% DataInformation.CscanPanel = 0;
% DataInformation.BscanPanel = 0;
% DataInformation.SscanPanel = 0;

set(gcf,'WindowButtonDownFcn',@clickButtonDown_Callback);

List.uipanel_cscan = -1;
List.uipanel_bscan = -1;
List.uipanel_sscan = -1;
List.uipanel_ascan = -1;
List.C_SDM = -1;
List.panel_defectsDetection = -1;
List.P_SelectLayers = -1;
List.uipanel13 = -1;
List.text44 = -1;
List.text45 = -1;
List.text46 = -1;
List.uipanel18 = -1;
List.checkbox_cal = -1;
Priv_DisableEnable(List);


% --- Outputs from this function are returned to the command line.
function varargout = GE_project_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function layerlist_xy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to layerlist_xy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





% --- Executes during object creation, after setting all properties.
function layerlist_zy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to layerlist_zy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes during object creation, after setting all properties.
function layerlist_xz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to layerlist_xz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in C_SDM.
function C_SDM_Callback(hObject, eventdata, handles)
% hObject    handle to C_SDM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of C_SDM

check = get(hObject,'Value');
directory_name = getappdata(gcf,'directory_name');
if isempty(directory_name)
    if check
        set(findobj('tag','C_SDM'),'Value', 0);
    else
        set(findobj('tag','C_SDM'),'Value', 1);
    end
    
else
    DataInformationFileName = [directory_name,'\','DataInformation.mat'];
    load(DataInformationFileName);
    if check
        DataInformation.Relative = 0;
        
    else
        DataInformation.Relative = 1;
    end
    
    dicomFlag = Priv_CheckDicomFiles(DataInformation);
    if dicomFlag == 1 || dicomFlag == 4 ||dicomFlag == 5 || dicomFlag == 7
        CBS = 1;
        Ind_X = DataInformation.Current_Disp_Layer_Cscan;
        Ind_Y = -1;
        [CscanPanel,scanPanel2] = Priv_Current_Layer_dcm(CBS, Ind_X, Ind_Y, DataInformation);
        
        h = 1;
        display_signal = CscanPanel;
        layer = Ind_X;
        Priv_display_dicom(h, display_signal, layer);
        
        DataInformation.CscanPanel = CscanPanel;
    end
    
    if dicomFlag == 2 || dicomFlag == 4 ||dicomFlag == 6 || dicomFlag == 7
        CBS = 2;
        Ind_X = DataInformation.Current_Disp_Layer_Bscan;
        Ind_Y = -1;
        [BscanPanel,scanPanel2] = Priv_Current_Layer_dcm(CBS, Ind_X, Ind_Y, DataInformation);
        
        h = 2;
        display_signal = BscanPanel;
        layer = Ind_X;
        Priv_display_dicom(h, display_signal, layer);
        
        DataInformation.BscanPanel = BscanPanel;
    end
    
    if dicomFlag == 3 || dicomFlag == 5 ||dicomFlag == 6 || dicomFlag == 7
        CBS = 3;
        Ind_X = DataInformation.Current_Disp_Layer_Sscan;
        Ind_Y = -1;
        [SscanPanel,scanPanel2] = Priv_Current_Layer_dcm(CBS, Ind_X, Ind_Y, DataInformation);
        
        h = 3;
        display_signal = SscanPanel;
        layer = Ind_X;
        Priv_display_dicom(h, display_signal, layer);
        
        DataInformation.SscanPanel = SscanPanel;
    end
    
    save(DataInformationFileName,'DataInformation');
    
end




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












%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function NoD = Priv_Num_of_Defect(XY, ZY, XZ)
[Lx, Ly, Lz] = size(XY);
jueduizhi = abs(XY);
he1 = sum(jueduizhi(:,:,1:30),3);
he2 = sum(jueduizhi(:,:,31:100),3);
he3 = sum(jueduizhi(:,:,100:135),3);

he1 = flipud(he1);
he1 = he1./max(he1(:));
he2 = flipud(he2);
he2 = he2./max(he2(:));
he3 = flipud(he3);
he3 = he3./max(he3(:));

t1 = 0.8;
t2 = 0.5;
t3 = 0.5;

he1Out = zeros(size(he1));
he2Out = zeros(size(he2));
he3Out = zeros(size(he3));

for i = 1:Lx
    for j = 1:Ly
        if he1(i,j)> t1
            he1Out(i,j) = 1;
        end
        if he2(i,j)> t2
            he2Out(i,j) = 1;
        end
        if he3(i,j)> t3
            he3Out(i,j) = 1;
        end
    end
end

zhe = he1Out + he2Out + he3Out;

[L NoD] = bwlabel(zhe,8);

objt = zeros(size(zhe));
for i = 1:NoD
    [row,col] = find(L == i);
    %     kkk = length(mydefect);
    zb_row(1,1,i) = max(row);
    zb_row(1,2,i) = min(row);
    zb_col(1,1,i) = max(col);
    zb_col(1,2,i) = min(col);
    len = length(row);
    for j = 1:len
        objt(row(j),col(j)) = 1;
    end
    obj(:,:,i) = objt;
    objt = zeros(size(zhe));
end

for i = 1:NoD
    myarea(i) = length(find(obj(:,:,i)) == 1);
end

zb_z(1,1,1) = 30;
zb_z(1,2,1) = 9;
zb_z(1,1,2) = 30;
zb_z(1,2,2) = 9;
zb_z(1,1,3) = 90;
zb_z(1,2,3) = 66;
zb_z(1,1,4) = 90;
zb_z(1,2,4) = 66;
zb_z(1,1,5) = 135;
zb_z(1,2,5) = 116;
zb_z(1,1,6) = 135;
zb_z(1,2,6) = 116;


set(findobj('tag','t_nod'),'string',num2str(NoD));

set(findobj('tag','t_x_l'),'string',num2str(zb_row(1,2,1)));
set(findobj('tag','t_x_h'),'string',num2str(zb_row(1,1,1)));

set(findobj('tag','t_y_l'),'string',num2str(zb_col(1,2,1)));
set(findobj('tag','t_y_h'),'string',num2str(zb_col(1,1,1)));

set(findobj('tag','t_z_l'),'string',num2str(zb_z(1,1,1)));
set(findobj('tag','t_z_h'),'string',num2str(zb_z(1,2,1)));

set(findobj('tag','t_xy'),'string',num2str(myarea(1)));
% set(findobj('tag','t_nod'),'string',num2str(NoD));
% set(findobj('tag','t_nod'),'string',num2str(NoD));

setappdata(gcf,'zb_row',zb_row);
setappdata(gcf,'zb_col',zb_col);
setappdata(gcf,'zb_z',zb_z);
setappdata(gcf,'NoD',NoD);
setappdata(gcf,'myarea',myarea);
setappdata(gcf,'obj',obj);


list_layer1 = '';
for i = 1:NoD
    list_temp1 = num2str(i);
    list_layer1 = strvcat(list_layer1,list_temp1);
end
set(findobj('tag','listbox_d'),'string',list_layer1);


cof = getappdata(gcf,'cof');
h1 = getappdata(gcf,'h1');
axes(h1);            % show the original image on the left panel
imshow(mat2gray(zhe));
colormap(jet);
position = get(gca,'position');
PlotRatio = position(3)/position(4);
PlotRatio = PlotRatio/cof;
[xyRows, xyCols] = size(zhe);
DataRatio = xyRows*PlotRatio/xyCols;
set(gca,'DataAspectRatio',[1 DataRatio 1])

NoD = 1;
kkk = 1;


function e_gate_s_Callback(hObject, eventdata, handles)
% hObject    handle to e_gate_s (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e_gate_s as text
%        str2double(get(hObject,'String')) returns contents of e_gate_s as a double
directory_name = getappdata(gcf,'directory_name');
DataInformationFileName = [directory_name,'\DataInformation.mat'];
load(DataInformationFileName);

gate_sta = floor(str2double(get(hObject,'String')));
if gate_sta < 1 || gate_sta > DataInformation.Lz
    warndlg('Invalid parameter');
    return;
else
    DataInformation.gate_sta = gate_sta;
    %     setappdata(gcf,'gate_sta',gate_sta);
    save(DataInformationFileName,'DataInformation');
end

% --- Executes during object creation, after setting all properties.
function e_gate_s_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e_gate_s (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function e_gate_e_Callback(hObject, eventdata, handles)
% hObject    handle to e_gate_e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e_gate_e as text
%        str2double(get(hObject,'String')) returns contents of e_gate_e as a double
directory_name = getappdata(gcf,'directory_name');
DataInformationFileName = [directory_name,'\DataInformation.mat'];
load(DataInformationFileName);

gate_end = floor(str2double(get(hObject,'String')));
if gate_end < 1 || gate_end > DataInformation.Lz
    warndlg('Invalid parameter');
    return;
else
    DataInformation.gate_end = gate_end;
    %     setappdata(gcf,'gate_sta',gate_sta);
    save(DataInformationFileName,'DataInformation');
end




% --- Executes during object creation, after setting all properties.
function e_gate_e_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e_gate_e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in C_Gate.
function C_Gate_Callback(hObject, eventdata, handles)
% hObject    handle to C_Gate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of C_Gate




% --- Executes on button press in c_gate.
function c_gate_Callback(hObject, eventdata, handles)
% hObject    handle to c_gate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of c_gate
temp = get(hObject,'Value');
DataInformation = getappdata(gcf,'DataInformation');
if temp
    set(findobj('tag','c_gate'),'value',1.0);
    DataInformation.c_gate = 1;
else
    set(findobj('tag','c_gate'),'value',0.0);
    DataInformation.c_gate = 0;
end

setappdata(gcf,'DataInformation',DataInformation);



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





% --- Executes during object creation, after setting all properties.
function listbox_d_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox_d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --------------------------------------------------------------------
function M_F_Callback(hObject, eventdata, handles)
% hObject    handle to M_F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --------------------------------------------------------------------
function M_E_Callback(hObject, eventdata, handles)
% hObject    handle to M_E (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function M_E_R1_Callback(hObject, eventdata, handles)
% hObject    handle to M_E_R1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function M_V_SRS_Callback(hObject, eventdata, handles)
% hObject    handle to M_V_SRS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% This function is used to show the isolated Scans
load('log.mat');
DataInformationFileName = [directory_name,'\DataInformation.mat'];
load(DataInformationFileName);

meshx = DataInformation.meshx;
meshy = DataInformation.meshy;
meshz = DataInformation.meshz;

%     CBS = 1;
%     Ind_X = DataInformation.Current_Disp_Layer_Cscan;
%     Ind_Y = -1;
%     [CscanPanel,scanPanel2] = Priv_Current_Layer_dcm(CBS, Ind_X, Ind_Y, DataInformation);
%
%     CBS = 2;
%     Ind_X = DataInformation.Current_Disp_Layer_Bscan;
%     Ind_Y = -1;
%     [BscanPanel,scanPanel2] = Priv_Current_Layer_dcm(CBS, Ind_X, Ind_Y, DataInformation);
%
%     CBS = 3;
%     Ind_X = DataInformation.Current_Disp_Layer_Sscan;
%     Ind_Y = -1;
%     [SscanPanel,scanPanel2] = Priv_Current_Layer_dcm(CBS, Ind_X, Ind_Y, DataInformation);

CscanPanel = DataInformation.CscanPanel;
BscanPanel = DataInformation.BscanPanel;
SscanPanel = DataInformation.SscanPanel;

[imx, imy] = size(CscanPanel);
[imz, imy] = size(BscanPanel);
Rx = imx * meshx / 1000000;
Ry = imy * meshy / 1000000;
Rz = imz * meshz / 1000000;

CscanPanelR = imresize(CscanPanel,[Rx Ry],'bilinear');
BscanPanelR = imresize(BscanPanel,[Rz Ry],'bilinear');
SscanPanelR = imresize(SscanPanel,[Rx Rz],'bilinear');


figure(1), imshow(mat2gray(CscanPanelR));
colormap(jet);

figure(2), imshow(mat2gray(BscanPanelR));
colormap(jet);

figure(3), imshow(mat2gray(SscanPanelR));
colormap(jet);

% --------------------------------------------------------------------
function M_F_C_Callback(hObject, eventdata, handles)
% hObject    handle to M_F_C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('log.mat');
directory_name = uigetdir(directory_name);
save('log.mat','directory_name');
setappdata(gcf,'directory_name',directory_name);
set(findobj('tag','figure1'),'name',directory_name);



% --------------------------------------------------------------------
function M_V_Callback(hObject, eventdata, handles)
% hObject    handle to M_V (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function M_H_Callback(hObject, eventdata, handles)
% hObject    handle to M_H (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --------------------------------------------------------------------
function M_V_MLF_Callback(hObject, eventdata, handles)
% hObject    handle to M_V_MLF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directory_name = getappdata(gcf,'directory_name');
if directory_name
    XY = getappdata(gcf,'XY');
    if ~isempty(XY)
        XYZ = XY;
        filename = [directory_name,'\Cscan.mat'];
        save(filename,'XYZ');
    end
end

kkk = 1;






% resize the image
function xy = Priv_imresize(xy)
[x,y] = size(xy);
xytemp = zeros(x,2*y);
for i = 1:y
    xytemp(:,((i-1)*2)+1) = xy(:,i);
    xytemp(:,((i-1)*2)+2) = xy(:,i);
end
xy = xytemp;
kkk = 1;


% --------------------------------------------------------------------
function M_F_OVF_Callback(hObject, eventdata, handles)
% hObject    handle to M_F_OVF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%%%%% Open a directory with a default folder name
load('log.mat');
if isa(directory_name,'char')
    directory_name = uigetdir(directory_name);
else
    directory_name = '';
    directory_name = uigetdir(directory_name);
end
save('log.mat','directory_name');
setappdata(gcf,'directory_name',directory_name);

if directory_name
    
    % set the window title
    set(findobj('tag','figure1'),'name',directory_name);
    
    % list the contents of a folder
    AllFolder = dir([directory_name]);
    [A, B] = size(AllFolder);
    is_directory = zeros(A,1);
    
    list_text = '';     % it is used to store the Y-folders
    
    %%%%% this loop extract the folder information and mesh information if any
    for i = 1:A
        if AllFolder(i).isdir
            folderName = AllFolder(i).name;
            if folderName(1) == 'Y'
                is_directory(i,1) = 1;
                list_temp = AllFolder(i).name;
                list_text = strvcat(list_text,list_temp);
            end
            PrmTemp = findstr(folderName,'Prm');
            if  ~isempty(PrmTemp)
                MeansName = [directory_name,'\',folderName,'\meas.prm'];
                tfid = fopen(MeansName);
                if tfid  == -1
                    % warndlg('There are no means.prm file');
                    setappdata(gcf,'meshx',-1);
                    setappdata(gcf,'meshy',-1);
                    setappdata(gcf,'meshz',-1);
                else
                    while ~feof(tfid)           % is it the end of a file?
                        tline=fgetl(tfid);      % read lines from prm file
                        [trows,tcols] = size(tline);
                        if tcols > 12
                            if tline(7:10) == 'mesh'
                                if tline(12) == 'x'
                                    meshx = str2num(tline(18:end));
                                    setappdata(gcf,'meshx',meshx);
                                end
                                if tline(12) == 'y'
                                    meshy = str2num(tline(18:end));
                                    setappdata(gcf,'meshy',meshy);
                                end
                                if tline(12) == 'z'
                                    meshz = str2num(tline(18:end));
                                    setappdata(gcf,'meshz',meshz);
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    
    % so far, we have extracted two information:
    %     1) mesh information
    %     2) the folder list of Y
    %======================================================================
    
    [frows, fcols] = size(list_text);   % compute the number of Y-folders
    XFilesMatrix = zeros(frows,1);      % it is used to store how many X-folders stored in each Y-folder
    sizeXa = 0;      % the number of X-folders
    sizeXb = 0;      % not used
    if frows == 0
        warndlg('This folder does not contain Y folders!');
        return;
    else
        % open each Y-folder, and find out how many X files in each folder
        for xindex = 1:frows
            XFolderTemp = [directory_name,'\',list_text(xindex,:)];
            XFolderTempFile = dir(XFolderTemp);
            [sizeXaTemp, sizeXbTemp] = size(XFolderTempFile);
            for Xind = 1:sizeXaTemp
                if strfind(XFolderTempFile(Xind).name,'X000');
                    sizeXa = sizeXa + 1;
                end
            end
            XFilesMatrix(xindex,1) = sizeXa;
            sizeXa = 0;
        end
    end
    
    if (frows * XFilesMatrix(1,1)) ~= sum(XFilesMatrix(:))
        warndlg('There are unbalanced Voxel files (X-folder) for each Y-folder');
        return;
    end
    
    % so far, we have computed how many X-folders are there, and validated
    % whether there are balance X-folders in each Y-folder
    % if the program goes to here, that means the data are ok!!!
    %======================================================================
    
    
    MaxData = 0;    % define the global extrema of the specimen
    MinData = 0;
    
    h = waitbar(0,'Please wait for processing Voxel files');
    for i = 1:frows
        % Xlen, Ylen, Zlen are the size of each slots
        [MaxDatatemp, MinDatatemp, Xlen, Ylen, Zlen] = Priv_make_matFiles(i, frows, sizeXa, directory_name, list_text(i,:));
        if MaxDatatemp > MaxData
            MaxData = MaxDatatemp;
        end
        if MinDatatemp < MinData
            MinData = MinDatatemp;
        end
    end
    
    close(h);
    
    
    %======================================================================
    % save the DataInformation file
    Lx = (Xlen - 16) * frows;   % for the 64 width data, we only count the middle-48 data
    Ly = Ylen * (sum(XFilesMatrix(:))/frows);
    Lz = Zlen;
    
    % save data
    DataInformation.Lx = Lx;                                % the size of data
    DataInformation.Ly = Ly;
    DataInformation.Lz = Lz;
    DataInformation.frows = frows;                          % the number of Y-folders
    DataInformation.slots = sum(XFilesMatrix(:))/frows;     % the number of slots in each Y-folder
    
    DataInformation.directory_name = directory_name;
    DataInformation.dicomPath = [DataInformation.directory_name, '\', 'DICOM'];
    DataInformation.dicomPathCal = [DataInformation.directory_name, '\', 'DICOM_Cal'];
    
    DataInformation.list_text = list_text;                  % the list of Y-folder
    DataInformation.calibration = zeros(DataInformation.Lx, DataInformation.Ly);
    DataInformation.calibrationFlag = get(findobj('tag','checkbox_cal'),'Value');
    DataInformation.Relative = 1 - get(findobj('tag','C_SDM'),'Value');                 % if this is 1, show the relative image, otherwise, show abstract image
    DataInformation.meshx = meshx;
    DataInformation.meshy = meshy;
    DataInformation.meshz = meshz;
    
    DataInformation.DICOM = 'ok';
    DataInformation.DICOMC = 'no';
    DataInformation.DICOMB = 'no';
    DataInformation.DICOMS = 'no';
    
    DataInformation.Constant = 32768;   % mean shift
    DataInformation.Coe = 4;    % dicom divide by this coe
    
    DataInformation.MaxData = MaxData;
    DataInformation.MinData = MinData;
    
    DataInformation.Current_Disp_Layer_Cscan = 0;
    DataInformation.Current_Disp_Layer_Bscan = 0;
    DataInformation.Current_Disp_Layer_Sscan = 0;
    
    DataInformationFileName = [directory_name,'\','DataInformation.mat'];
    save(DataInformationFileName,'DataInformation');
    setappdata(gcf,'directory_name',directory_name);
    
    % display the inital information to the program panel
    % Priv_setInitInformation(directory_name);
    
    
    %======================================================================
    % save the DataInformation file
    
    Priv_clear_axes();
    
    % disable all objects;
    List.uipanel_cscan = -1;
    List.uipanel_bscan = -1;
    List.uipanel_sscan = -1;
    List.uipanel_ascan = -1;
    List.C_SDM = -1;
    List.panel_defectsDetection = -1;
    List.P_SelectLayers = -1;
    List.uipanel13 = -1;
    List.text44 = -1;
    List.text45 = -1;
    List.text46 = -1;
    List.uipanel18 = -1;
    List.checkbox_cal = -1;
    Priv_DisableEnable(List);
    
end

% 这个函数与上面的“Open Voxel Files”具有同一个功能，这个函数被“Convert Old Format to New
% Format”调用
function Priv_Raw2Voxel(directory_name)
if directory_name
    
    % set the window title
    set(findobj('tag','figure1'),'name',directory_name);
    
    % list the contents of a folder
    AllFolder = dir([directory_name]);
    [A, B] = size(AllFolder);
    is_directory = zeros(A,1);
    
    list_text = '';     % it is used to store the Y-folders
    
    %%%%% this loop extract the folder information and mesh information if any
    for i = 1:A
        if AllFolder(i).isdir
            folderName = AllFolder(i).name;
            if folderName(1) == 'Y'
                is_directory(i,1) = 1;
                list_temp = AllFolder(i).name;
                list_text = strvcat(list_text,list_temp);
            end
            PrmTemp = findstr(folderName,'Prm');
            if  ~isempty(PrmTemp)
                MeansName = [directory_name,'\',folderName,'\meas.prm'];
                tfid = fopen(MeansName);
                if tfid  == -1
                    % warndlg('There are no means.prm file');
                    setappdata(gcf,'meshx',-1);
                    setappdata(gcf,'meshy',-1);
                    setappdata(gcf,'meshz',-1);
                else
                    while ~feof(tfid)           % is it the end of a file?
                        tline=fgetl(tfid);      % read lines from prm file
                        [trows,tcols] = size(tline);
                        if tcols > 12
                            if tline(7:10) == 'mesh'
                                if tline(12) == 'x'
                                    meshx = str2num(tline(18:end));
                                    setappdata(gcf,'meshx',meshx);
                                end
                                if tline(12) == 'y'
                                    meshy = str2num(tline(18:end));
                                    setappdata(gcf,'meshy',meshy);
                                end
                                if tline(12) == 'z'
                                    meshz = str2num(tline(18:end));
                                    setappdata(gcf,'meshz',meshz);
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    
    % so far, we have extracted two information:
    %     1) mesh information
    %     2) the folder list of Y
    %======================================================================
    
    [frows, fcols] = size(list_text);   % compute the number of Y-folders
    XFilesMatrix = zeros(frows,1);      % it is used to store how many X-folders stored in each Y-folder
    sizeXa = 0;      % the number of X-folders
    sizeXb = 0;      % not used
    if frows == 0
        warndlg('This folder does not contain Y folders!');
        return;
    else
        % open each Y-folder, and find out how many X files in each folder
        for xindex = 1:frows
            XFolderTemp = [directory_name,'\',list_text(xindex,:)];
            XFolderTempFile = dir(XFolderTemp);
            [sizeXaTemp, sizeXbTemp] = size(XFolderTempFile);
            for Xind = 1:sizeXaTemp
                if strfind(XFolderTempFile(Xind).name,'X000');
                    sizeXa = sizeXa + 1;
                end
            end
            XFilesMatrix(xindex,1) = sizeXa;
            sizeXa = 0;
        end
    end
    
    if (frows * XFilesMatrix(1,1)) ~= sum(XFilesMatrix(:))
        warndlg('There are unbalanced Voxel files (X-folder) for each Y-folder');
        return;
    end
    
    % so far, we have computed how many X-folders are there, and validated
    % whether there are balance X-folders in each Y-folder
    % if the program goes to here, that means the data are ok!!!
    %======================================================================
    
    
    MaxData = 0;    % define the global extrema of the specimen
    MinData = 0;
    
    h = waitbar(0,'Please wait for processing Voxel files');
    for i = 1:frows
        % Xlen, Ylen, Zlen are the size of each slots
        [MaxDatatemp, MinDatatemp, Xlen, Ylen, Zlen] = Priv_make_matFiles(i, frows, sizeXa, directory_name, list_text(i,:));
        if MaxDatatemp > MaxData
            MaxData = MaxDatatemp;
        end
        if MinDatatemp < MinData
            MinData = MinDatatemp;
        end
    end
    
    close(h);
    
    
    %======================================================================
    % save the DataInformation file
    Lx = (Xlen - 16) * frows;   % for the 64 width data, we only count the middle-48 data
    Ly = Ylen * (sum(XFilesMatrix(:))/frows);
    Lz = Zlen;
    
    % save data
    DataInformation.Lx = Lx;                                % the size of data
    DataInformation.Ly = Ly;
    DataInformation.Lz = Lz;
    DataInformation.frows = frows;                          % the number of Y-folders
    DataInformation.slots = sum(XFilesMatrix(:))/frows;     % the number of slots in each Y-folder
    
    DataInformation.directory_name = directory_name;
    DataInformation.dicomPath = [DataInformation.directory_name, '\', 'DICOM'];
    DataInformation.dicomPathCal = [DataInformation.directory_name, '\', 'DICOM_Cal'];
    
    DataInformation.list_text = list_text;                  % the list of Y-folder
    DataInformation.calibration = zeros(DataInformation.Lx, DataInformation.Ly);
    DataInformation.calibrationFlag = get(findobj('tag','checkbox_cal'),'Value');
    DataInformation.Relative = 1 - get(findobj('tag','C_SDM'),'Value');                 % if this is 1, show the relative image, otherwise, show abstract image
    DataInformation.meshx = meshx;
    DataInformation.meshy = meshy;
    DataInformation.meshz = meshz;
    
    DataInformation.DICOM = 'ok';
    DataInformation.DICOMC = 'no';
    DataInformation.DICOMB = 'no';
    DataInformation.DICOMS = 'no';
    
    DataInformation.Constant = 32768;   % mean shift
    DataInformation.Coe = 4;    % dicom divide by this coe
    
    DataInformation.MaxData = MaxData;
    DataInformation.MinData = MinData;
    
    DataInformation.Current_Disp_Layer_Cscan = 0;
    DataInformation.Current_Disp_Layer_Bscan = 0;
    DataInformation.Current_Disp_Layer_Sscan = 0;
    
    DataInformationFileName = [directory_name,'\','DataInformation.mat'];
    save(DataInformationFileName,'DataInformation');
    setappdata(gcf,'directory_name',directory_name);
    
    % display the inital information to the program panel
    % Priv_setInitInformation(directory_name);
    
    
    %======================================================================
    % save the DataInformation file
    
    Priv_clear_axes();
    
    % disable all objects;
    List.uipanel_cscan = -1;
    List.uipanel_bscan = -1;
    List.uipanel_sscan = -1;
    List.uipanel_ascan = -1;
    List.C_SDM = -1;
    List.panel_defectsDetection = -1;
    List.P_SelectLayers = -1;
    List.uipanel13 = -1;
    List.text44 = -1;
    List.text45 = -1;
    List.text46 = -1;
    List.uipanel18 = -1;
    List.checkbox_cal = -1;
    Priv_DisableEnable(List);
    
end

function [MaxDatatemp, MinDatatemp, Xlen, Ylen, Zlen] = Priv_make_matFiles(currentIndex, frows, sizeXa, directory_name, XFolderTemp)

MaxData = 0;
MinData = 0;

%%%%% this function will return a three data of the corresponding
%%%%% index voxel data

[MaxDatatemp, MinDatatemp, Xlen, Ylen, Zlen] = GE_readVoxel(currentIndex, frows, sizeXa, directory_name, XFolderTemp);

if MaxDatatemp > MaxData
    MaxData = MaxDatatemp;
end
if MinDatatemp < MinData
    MinData = MinDatatemp;
end






flag = 1;


function flag = Priv_remake_matFiles(frows, directory_name, list_text, meshx, meshy, meshz)

MaxData = 0;
MinData = 0;

h = waitbar(0,'Please wait for processing Voxel files');
for i = 1:frows
    %%%%% this function will return a three data of the corresponding
    %%%%% index voxel data
    Data3D = Priv_folder_read(directory_name, list_text(i,:));
    
    MaxDatatemp = max(Data3D(:));
    MinDatatemp = min(Data3D(:));
    if MaxDatatemp > MaxData
        MaxData = MaxDatatemp;
    end
    if MinDatatemp < MinData
        MinData = MinDatatemp;
    end
    
    dataName = [directory_name, '\', list_text(i,:), '.mat'];
    save(dataName,'Data3D');        %%%%% save the un-calibrated data
    [sLx, sLy, sLz] = size(Data3D);
    
    cal_data = Priv_calibration(1, Data3D);
    dataName_cal = [directory_name, '\', 'cal_', list_text(i,:), '.mat'];
    save(dataName_cal,'cal_data');        %%%%% save the calibrated data
    clear cal_data;
    clear Data3D;
    waitbar(i/frows);
end
close(h);

Lx = sLx * frows;
Ly = sLy;
Lz = sLz;

% save data
DataInformation.Lx = Lx;
DataInformation.Ly = Ly;
DataInformation.Lz = Lz;
DataInformation.frows = frows;
DataInformation.directory_name = directory_name;
DataInformation.list_text = list_text;
DataInformation.calibration = zeros(DataInformation.Lx, DataInformation.Ly);
DataInformation.calibrationFlag = get(findobj('tag','checkbox_cal'),'Value');
DataInformation.Relative = 1 - get(findobj('tag','C_SDM'),'Value');                 % if this is 1, show the relative image, otherwise, show abstract image
DataInformation.meshx = meshx;
DataInformation.meshy = meshy;
DataInformation.meshz = meshz;
DataInformation.DICOM = 'ok';
DataInformation.Constant = 32768;   % mean shift
DataInformation.Coe = 4;    % dicom divide by this coe

DataInformation.MaxData = MaxData;
DataInformation.MinData = MinData;

DataInformation.dicomPath = [DataInformation.directory_name, '\', 'DICOM'];
DataInformation.dicomPathCal = [DataInformation.directory_name, '\', 'DICOM_Cal'];

DataInformation.Current_Disp_Layer_Cscan = 0;
DataInformation.Current_Disp_Layer_Bscan = 0;
DataInformation.Current_Disp_Layer_Sscan = 0;

DataInformationFileName = [directory_name,'\','DataInformation.mat'];
save(DataInformationFileName,'DataInformation');
setappdata(gcf,'directory_name',directory_name);

% display the inital information to the program panel
% Priv_setInitInformation(directory_name);

flag = 1;



function Priv_setInitInformation(directory_name)
DataInformationFileName = [directory_name,'\','DataInformation'];
load(DataInformationFileName);

list_layer1 = '';
list_layer2 = '';
list_layer3 = '';

set(findobj('tag','text_X1'),'string',DataInformation.Lx);              %=====================================================
set(findobj('tag','text_Y1'),'string',DataInformation.Ly);
set(findobj('tag','text_Z1'),'string',DataInformation.Lz);
set(findobj('tag','text_specimen'),'string',DataInformation.frows);

if DataInformation.meshx ~= -1
    set(findobj('tag','text_X2'),'string',DataInformation.Lx*DataInformation.meshx/1000000);          %==================
    set(findobj('tag','text_Y2'),'string',DataInformation.Ly*DataInformation.meshy/1000000);
    set(findobj('tag','text_Z2'),'string',DataInformation.Lz*DataInformation.meshz/1000000);
end

set(findobj('tag','text_C_x'),'string',DataInformation.Lx);
set(findobj('tag','text_C_y'),'string',DataInformation.Ly);
set(findobj('tag','text_B_z'),'string',DataInformation.Lz);
set(findobj('tag','text_B_y'),'string',DataInformation.Ly);
set(findobj('tag','text_S_x'),'string',DataInformation.Lx);
set(findobj('tag','text_S_z'),'string',DataInformation.Lz);
set(findobj('tag','text_A_z'),'string',DataInformation.Lz);

set(findobj('tag','checkbox_cal'),'value',0);

setappdata(gcf,'DataInformation',DataInformation);

% got the list name
for i = 1:DataInformation.Lz
    list_temp1 = num2str(i);
    list_layer1 = strvcat(list_layer1,list_temp1);
end
set(findobj('tag','layerlist_xy'),'string',list_layer1);

for i = 1:DataInformation.Lx
    list_temp2 = num2str(i);
    list_layer2 = strvcat(list_layer2,list_temp2);
end
set(findobj('tag','layerlist_zy'),'string',list_layer2);

for i = 1:DataInformation.Ly
    list_temp3 = num2str(i);
    list_layer3 = strvcat(list_layer3,list_temp3);
end
set(findobj('tag','layerlist_xz'),'string',list_layer3);

DataInformation.list_layer1 = list_layer1;
DataInformation.list_layer2 = list_layer2;
DataInformation.list_layer3 = list_layer3;

save(DataInformationFileName,'DataInformation');

clear list_text list_layer1 list_layer2 list_layer3;

% transfer to display
%     xy = flipud(xy);    % Flip matrices up-down

abstract = getappdata(gcf,'abstract');


% set the first dimension to display
setappdata(gcf,'dimension',1);

% display the first layers    Priv_display();
cof = getappdata(gcf,'cof');





% --------------------------------------------------------------------
function M_F_OMF_Callback(hObject, eventdata, handles)
% hObject    handle to M_F_OMF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

directory_name = uigetdir('E:\MATLAB71\work\My_Projects\GE_project_2009\files');
if directory_name
    AllFolder = dir([directory_name]);
    [A, B] = size(AllFolder);
    is_directory = zeros(A,1);
    
    list_text = '';
    list_layer1 = '';
    list_layer2 = '';
    list_layer3 = '';
    for i = 1:A
        if AllFolder(i).isdir
            folderName = AllFolder(i).name;
            if folderName(1) == 'Y'
                is_directory(i,1) = 1;
                list_temp = AllFolder(i).name;
                list_text = strvcat(list_text,list_temp);
            end
            if folderName(1) == 'P'
                MeansName = [directory_name,'\',folderName,'\meas.prm'];
                tfid = fopen(MeansName);
                if tfid  == -1
                    % warndlg('There are no means.prm file');
                    setappdata(gcf,'meshx',-1);
                    setappdata(gcf,'meshy',-1);
                    setappdata(gcf,'meshz',-1);
                else
                    while ~feof(tfid)                                      % 判断是否为文件末尾
                        tline=fgetl(tfid);                                 % 从文件读行
                        [trows,tcols] = size(tline);
                        if tcols > 12
                            if tline(7:10) == 'mesh'
                                if tline(12) == 'x'
                                    meshx = str2num(tline(18:end));
                                    setappdata(gcf,'meshx',meshx);
                                end
                                if tline(12) == 'y'
                                    meshy = str2num(tline(18:end));
                                    setappdata(gcf,'meshy',meshy);
                                end
                                if tline(12) == 'z'
                                    meshz = str2num(tline(18:end));
                                    setappdata(gcf,'meshz',meshz);
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    [frows, fcols] = size(list_text);
    if frows == 0
        warndlg('This folder does not contain Voxel file - the folder named by Y!');
        return;
    end
    setappdata(gcf,'list_text',list_text);
    setappdata(gcf,'directory_name',directory_name);
    
    Data3DAll = [];
    Data3D = [];
    Lx = 64;
    
    % this data are used to display in the initial time;
    CscanPanel = [];
    BscanPanel = [];
    SscanPanel = [];
    
    setappdata(gcf,'blksze',-1);
    
    for i = 1:frows
        xyzLen = 0;
        %         Data3D(:,(i-1)*(Lx-2*8)+1:(i-1)*(Lx-2*8)+(Lx-2*8),:) = Priv_folder_read(directory_name, list_text(i,:));
        %         Data3D = Priv_folder_read(directory_name, list_text(i,:));
        dataName = [directory_name, '\', list_text(i,:), '.mat'];
        %         save(dataName,'Data3D');
        load(dataName);
        
        %===========================
        MaxData = getappdata(gcf,'MaxData');
        MinData = getappdata(gcf,'MinData');
        if isempty(MaxData) == 1
            MaxData = max(Data3D(:));
            MinData = min(Data3D(:));
            setappdata(gcf,'MaxData',MaxData);
            setappdata(gcf,'MinData',MinData);
        else
            MaxDataT = max(Data3D(:));
            MinDataT = min(Data3D(:));
            if MaxDataT > MaxData
                MaxData = MaxDataT;
                setappdata(gcf,'MaxData',MaxData);
            end
            if MinDataT < MinData
                MinData = MinDataT;
                setappdata(gcf,'MinData',MinData);
            end
        end
        
        
        %===========================
        
        [sLx, sLy, sLz] = size(Data3D);
        
        CscanPanel((i-1)*48+1:(i-1)*48+48,:) = Data3D(:,:,1);
        
        Data3Dtemp = shiftdim(Data3D,2);
        SscanPanel((i-1)*48+1:(i-1)*48+48,:) = Data3Dtemp(:,:,1)';
        
        if i == 1
            Data3Dtemp = shiftdim(Data3D,1);
            BscanPanel = Data3Dtemp(:,:,1)';
        end
        
        % decide whether the data size are same!
        if i == 1
            sLx_old = sLx;
            sLy_old = sLy;
            sLz_old = sLz;
        else
            if sLx_old == sLx
                xyzLen = 1;
            end
            if sLy_old == sLy
                xyzLen = 2;
            end
            if sLz_old == sLz
                xyzLen = 3;
            end
            if xyzLen ~= 3
                warndlg('The data size are different!');
            else
                xyzLen = 0;
            end
        end
    end
    
    %=================================
    % save the layers as later use
    setappdata(gcf,'CscanPanel',CscanPanel);
    setappdata(gcf,'BscanPanel',BscanPanel);
    setappdata(gcf,'SscanPanel',SscanPanel);
    
    Lx = sLx * frows;
    Ly = sLy;
    Lz = sLz;
    
    % save data
    DataInformation.Lx = Lx;
    DataInformation.Ly = Ly;
    DataInformation.Lz = Lz;
    DataInformation.frows = frows;
    DataInformation.directory_name = directory_name;
    DataInformation.list_text = list_text;
    DataInformation.calibration = zeros(DataInformation.Lx, DataInformation.Ly);
    DataInformation.calibrationFlag = 0;
    DataInformation.meshx = meshx;
    DataInformation.meshy = meshy;
    DataInformation.meshz = meshz;
    
    set(findobj('tag','text_X1'),'string',Lx);          %==================
    set(findobj('tag','text_Y1'),'string',Ly);
    set(findobj('tag','text_Z1'),'string',Lz);
    set(findobj('tag','text_specimen'),'string',frows);
    
    if meshx ~= -1
        set(findobj('tag','text_X2'),'string',Lx*meshx/1000000);          %==================
        set(findobj('tag','text_Y2'),'string',Ly*meshy/1000000);
        set(findobj('tag','text_Z2'),'string',Lz*meshz/1000000);
    end
    
    set(findobj('tag','text_C_x'),'string',Lx);
    set(findobj('tag','text_C_y'),'string',Ly);
    set(findobj('tag','text_B_z'),'string',Lz);
    set(findobj('tag','text_B_y'),'string',Ly);
    set(findobj('tag','text_S_x'),'string',Lx);
    set(findobj('tag','text_S_z'),'string',Lz);
    set(findobj('tag','text_A_z'),'string',Lz);
    
    set(findobj('tag','checkbox_cal'),'value',0);
    
    setappdata(gcf,'DataInformation',DataInformation);
    
    % got the list name
    for i = 1:Lx
        list_temp2 = num2str(i);
        list_layer2 = strvcat(list_layer2,list_temp2);
    end
    set(findobj('tag','layerlist_zy'),'string',list_layer2);
    
    for i = 1:Ly
        list_temp3 = num2str(i);
        list_layer3 = strvcat(list_layer3,list_temp3);
    end
    set(findobj('tag','layerlist_xz'),'string',list_layer3);
    
    for i = 1:Lz
        list_temp1 = num2str(i);
        list_layer1 = strvcat(list_layer1,list_temp1);
    end
    set(findobj('tag','layerlist_xy'),'string',list_layer1);
    
    clear list_text list_layer1 list_layer2 list_layer3;
    
    % transfer to display
    %     xy = flipud(xy);    % Flip matrices up-down
    
    abstract = getappdata(gcf,'abstract');
    if abstract
        MaxData = getappdata(gcf,'MaxData');
        MinData = getappdata(gcf,'MinData');
        
        CscanPanel(1,1) = MaxData; CscanPanel(1,2) = MinData;
        BscanPanel(1,1) = MaxData; BscanPanel(1,2) = MinData;
        SscanPanel(1,1) = MaxData; SscanPanel(1,2) = MinData;
    end
    
    % set the first dimension to display
    setappdata(gcf,'dimension',1);
    
    % display the first layers    Priv_display();
    cof = getappdata(gcf,'cof');
    
    h1 = getappdata(gcf,'h1');
    axes(h1);            % show the original image on the left panel
    imshow(mat2gray(CscanPanel));
    colormap(jet);
    position = get(gca,'position');
    PlotRatio = position(3)/position(4);
    PlotRatio = PlotRatio/cof;
    [xyRows, xyCols] = size(CscanPanel);
    DataRatio = xyRows*PlotRatio/xyCols;
    set(gca,'DataAspectRatio',[1 DataRatio 1])
    
    
    h2 = getappdata(gcf,'h2');
    axes(h2);            % show the original image on the left panel
    imshow(mat2gray(BscanPanel));
    colormap(jet);
    position = get(gca,'position');
    PlotRatio = position(3)/position(4);
    PlotRatio = PlotRatio/cof;
    [zyRows, zyCols] = size(BscanPanel);
    DataRatio = zyRows*PlotRatio/zyCols;
    set(gca,'DataAspectRatio',[1 DataRatio 1])
    
    % set(gca,'DataAspectRatio',[0.3 1 1],'PlotBoxAspectRatio',[0.3 1 1])
    
    h3 = getappdata(gcf,'h3');
    axes(h3);            % show the original image on the left panel
    imshow(mat2gray(SscanPanel));
    colormap(jet);
    
    position = get(gca,'position');
    PlotRatio = position(3)/position(4);
    PlotRatio = PlotRatio/cof;
    [xzRows, xzCols] = size(SscanPanel);
    DataRatio = xzRows*PlotRatio/xzCols;
    set(gca,'DataAspectRatio',[1 DataRatio 1])
    
    % set(gca,'DataAspectRatio',[1 0.2 1],'PlotBoxAspectRatio',[1 0.2 1])
    
    % show current layer
    set(findobj('tag','t_xy'),'string',1);
    set(findobj('tag','t_zy'),'string',1);
    set(findobj('tag','t_xz'),'string',1);
    kkk = 1;
    
end





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function
% read raw data from files
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Data3D] = Priv_folder_read(directory_name, list_text)
blksze = getappdata(gcf,'blksze');

Data3D = GE_readVoxel(directory_name, list_text, blksze);

%==========================================================================
% this function is moved to isolated file.
% function Data3D = GE_readVoxel(directory_name, list_text, blksze)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function
% clickButtonDown
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function clickButtonDown_Callback(hObject, eventdata, handles)

[xi,yi]=ginput(1);

h1 = getappdata(gcf,'h1');
h2 = getappdata(gcf,'h2');
h3 = getappdata(gcf,'h3');

directory_name = getappdata(gcf,'directory_name');
DataInformationFileName = [directory_name,'\','DataInformation.mat'];
load(DataInformationFileName);
TF = strcmp(DataInformation.DICOM,'ok');
if TF
    
    currentAxis = gca;
    
    % xy plane
    if currentAxis == h1;
        
        % get current coordinates
        X = floor(yi);
        Y = floor(xi);
        if X <= 0 || X > DataInformation.Lx
            return;
        end
        meshy = getappdata(gcf,'meshy');
        if meshy == 2000000
            if Y <= 0 || Y > DataInformation.Ly*2
                return;
            end
        else
            if Y <= 0 || Y > DataInformation.Ly
                return;
            end
        end
        
        % =============================== Bscan
        
        
        
        dicomFlag = Priv_CheckDicomFiles(DataInformation);
        
        switch dicomFlag
            case 1      % only C-scan files, when click in this area, we can not display the Bscan and the Sscan since there are no data
                warndlg('We can not display the B-scan and the S-scan when you click the C-scan window since there are no data, please make the data first!');
                return;
            case 2      % only B-scan files
                % can not return this case
            case 3      % only S-scan files
                % can not return this case
            case 4      % only C-scan and B-scan files
                CBS = 2;    % only display Bscan;
                Ind_X = X;
                Ind_Y = Y;
                
                [BscanPanel,XscanPanel] = Priv_Current_Layer_dcm(CBS, Ind_X, Ind_Y, DataInformation);
                DataInformation.BscanPanel = BscanPanel;
                
                h = 2;
                display_signal = DataInformation.BscanPanel;
                layer = Ind_X;
                Priv_display_dicom(h, display_signal, layer);
                
                %         DataInformation.Current_Disp_Layer_Cscan = 1;
                DataInformation.Current_Disp_Layer_Bscan = Ind_X;
                DataInformation.Current_Disp_Layer_Sscan = -1;
                
                DataInformationFileName = [DataInformation.directory_name,'\DataInformation.mat'];
                save(DataInformationFileName,'DataInformation');
                
                % the coordinates are correct! and plot A scan
                % get the corresponding index data;
                
                setappdata(gcf,'Ind_X',Ind_X);
                setappdata(gcf,'Ind_Y',Ind_Y);
                
                CBS = 33;    % display AscanPanel;
                Ind_X = X;
                Ind_Y = Y;
                
                [Adata,scanPanel1] = Priv_Current_Layer_dcm(CBS, Ind_X, Ind_Y, DataInformation);
                setappdata(gcf,'Adata',Adata);
                
                h = 4;
                %         flag = get(findobj('tag','checkbox_FFT'),'value');
                %         if flag
                %             display_signal = (log(abs(fftshift(fft(Adata)))+eps))*500;
                %             layer = 512;
                %             Priv_display_dicom(h, display_signal, layer);
                %         else
                display_signal = Adata - DataInformation.Constant;
                layer = 512;
                Priv_display_dicom(h, display_signal, layer);
                %         end
            case 5      % only C-scan and S-scan files
                CBS = 3;    % display Bscan and Sscan;
                
                Ind_X = Y;
                Ind_Y = X;
                
                
                [SscanPanel, XscanPanel,] = Priv_Current_Layer_dcm(CBS, Ind_X, Ind_Y, DataInformation);
                DataInformation.SscanPanel = SscanPanel;
                
                % ========================================= Sscan
                h = 3;
                display_signal = DataInformation.SscanPanel;
                layer = Ind_Y;
                Priv_display_dicom(h, display_signal, layer);
                
                %         DataInformation.Current_Disp_Layer_Cscan = 1;
                DataInformation.Current_Disp_Layer_Bscan = -1;
                DataInformation.Current_Disp_Layer_Sscan = Ind_Y;
                
                DataInformationFileName = [DataInformation.directory_name,'\DataInformation.mat'];
                save(DataInformationFileName,'DataInformation');
                
                % the coordinates are correct! and plot A scan
                % get the corresponding index data;
                
            case 6      % only B-scan and S-scan files
                % can not return this case
            case 7      % all scan files
                CBS = 23;    % display Bscan and Sscan;
                Ind_X = X;
                Ind_Y = Y;
                
                [BscanPanel,SscanPanel] = Priv_Current_Layer_dcm(CBS, Ind_X, Ind_Y, DataInformation);
                DataInformation.BscanPanel = BscanPanel;
                DataInformation.SscanPanel = SscanPanel;
                
                %         Priv_display_dicom(h, display_signal, layer)
                h = 2;
                display_signal = DataInformation.BscanPanel;
                layer = Ind_X;
                Priv_display_dicom(h, display_signal, layer);
                
                % ========================================= Sscan
                h = 3;
                display_signal = DataInformation.SscanPanel;
                layer = Ind_Y;
                Priv_display_dicom(h, display_signal, layer);
                
                %         DataInformation.Current_Disp_Layer_Cscan = 1;
                DataInformation.Current_Disp_Layer_Bscan = Ind_X;
                DataInformation.Current_Disp_Layer_Sscan = Ind_Y;
                
                DataInformationFileName = [DataInformation.directory_name,'\DataInformation.mat'];
                save(DataInformationFileName,'DataInformation');
                
                % the coordinates are correct! and plot A scan
                % get the corresponding index data;
                
                CBS = 33;    % display CscanPanel;
                Ind_X = X;
                Ind_Y = Y;
                
                setappdata(gcf,'Ind_X',Ind_X);
                setappdata(gcf,'Ind_Y',Ind_Y);
                
                [Adata,scanPanel1] = Priv_Current_Layer_dcm(CBS, Ind_X, Ind_Y, DataInformation);
                setappdata(gcf,'Adata',Adata);
                
                h = 4;
                %         flag = get(findobj('tag','checkbox_FFT'),'value');
                %         if flag
                %             display_signal = (log(abs(fftshift(fft(Adata)))+eps))*500;
                %             layer = 512;
                %             Priv_display_dicom(h, display_signal, layer);
                %         else
                display_signal = Adata - DataInformation.Constant;
                layer = 512;
                Priv_display_dicom(h, display_signal, layer);
                %         end
                
        end         % the end of switch
        
    end
    
    % zy plane
    if currentAxis == h2;
        X = floor(xi);
        Y = floor(yi);
        if Y <= 0 || Y > DataInformation.Lz
            return;
        end
        if X <= 0 || X > DataInformation.Ly
            return;
        end
        
        
        
        dicomFlag = Priv_CheckDicomFiles(DataInformation);
        
        switch dicomFlag
            case 1      % only C-scan files, when click in this area, we can not display the Bscan and the Sscan since there are no data
                % can not return this case
            case 2      % only B-scan files
                warndlg('We can not display the C-scan and the S-scan when you click the C-scan window since there are no data, please make the data first!');
                return;
            case 3      % only S-scan files
                % can not return this case
            case 4      % only C-scan and B-scan files
                CBS = 1;    % only display Cscan;
                Ind_Z = Y;
                Ind_Y = X;
                
                [CscanPanel,XscanPanel] = Priv_Current_Layer_dcm(CBS, Ind_Z, Ind_Y, DataInformation);
                DataInformation.CscanPanel = CscanPanel;
                
                h = 1;
                display_signal = DataInformation.CscanPanel;
                layer = Ind_Z;
                Priv_display_dicom(h, display_signal, layer);
                
                %         DataInformation.Current_Disp_Layer_Bscan = 1;
                DataInformation.Current_Disp_Layer_Cscan = Ind_Z;
                DataInformation.Current_Disp_Layer_Sscan = -1;
                
                DataInformationFileName = [DataInformation.directory_name,'\DataInformation.mat'];
                save(DataInformationFileName,'DataInformation');
                
                
            case 5      % only C-scan and S-scan files
                % can not return this case
            case 6      % only B-scan and S-scan files
                CBS = 3;    % display Bscan and Sscan;
                Ind_Z = Y;
                Ind_Y = X;
                
                [SscanPanel, XscanPanel] = Priv_Current_Layer_dcm(CBS, Ind_Y, Ind_Z, DataInformation);
                DataInformation.SscanPanel = SscanPanel;
                
                % ========================================= Sscan
                h = 3;
                display_signal = DataInformation.SscanPanel;
                layer = Ind_Y;
                Priv_display_dicom(h, display_signal, layer);
                
                %         DataInformation.Current_Disp_Layer_Bscan = 1;
                DataInformation.Current_Disp_Layer_Cscan = -1;
                DataInformation.Current_Disp_Layer_Sscan = Ind_Y;
                
                DataInformationFileName = [DataInformation.directory_name,'\DataInformation.mat'];
                save(DataInformationFileName,'DataInformation');
                
            case 7      % all scan files
                CBS = 13;    % display Bscan and Sscan;
                Ind_Z = Y;
                Ind_Y = X;
                
                [CscanPanel,SscanPanel] = Priv_Current_Layer_dcm(CBS, Ind_Z, Ind_Y, DataInformation);
                DataInformation.CscanPanel = CscanPanel;
                DataInformation.SscanPanel = SscanPanel;
                
                %         Priv_display_dicom(h, display_signal, layer)
                h = 1;
                display_signal = DataInformation.CscanPanel;
                layer = Ind_Z;
                Priv_display_dicom(h, display_signal, layer);
                
                % ========================================= Sscan
                h = 3;
                display_signal = DataInformation.SscanPanel;
                layer = Ind_Y;
                Priv_display_dicom(h, display_signal, layer);
                
                %         DataInformation.Current_Disp_Layer_Cscan = 1;
                DataInformation.Current_Disp_Layer_Cscan = Ind_Z;
                DataInformation.Current_Disp_Layer_Sscan = Ind_Y;
                
                DataInformationFileName = [DataInformation.directory_name,'\DataInformation.mat'];
                save(DataInformationFileName,'DataInformation');
                
        end         % the end of switch
    end
    
    % xz plane
    if currentAxis == h3;
        Z = floor(xi);
        X = floor(yi);
        if Z <= 0 || Z > DataInformation.Lz
            return;
        end
        if X <= 0 || X > DataInformation.Lx
            return;
        end
        
        
        
        dicomFlag = Priv_CheckDicomFiles(DataInformation);
        
        switch dicomFlag
            case 1      % only C-scan files, when click in this area, we can not display the Bscan and the Sscan since there are no data
                % can not return this case
            case 2      % only B-scan files
                % can not return this case
            case 3      % only S-scan files
                warndlg('We can not display the C-scan and the B-scan when you click the C-scan window since there are no data, please make the data first!');
                return;
            case 4      % only C-scan and B-scan files
                % can not return this case
                
                
            case 5      % only C-scan and S-scan files
                CBS = 1;    % only display Cscan;
                Ind_Z = Z;
                Ind_X = X;
                
                
                [CscanPanel,XscanPanel] = Priv_Current_Layer_dcm(CBS, Ind_Z, Ind_X, DataInformation);
                DataInformation.CscanPanel = CscanPanel;
                
                h = 1;
                display_signal = DataInformation.CscanPanel;
                layer = Ind_Z;
                Priv_display_dicom(h, display_signal, layer);
                
                %         DataInformation.Current_Disp_Layer_Bscan = 1;
                DataInformation.Current_Disp_Layer_Cscan = Ind_Z;
                DataInformation.Current_Disp_Layer_Sscan = -1;
                
                DataInformationFileName = [DataInformation.directory_name,'\DataInformation.mat'];
                save(DataInformationFileName,'DataInformation');
                
            case 6      % only B-scan and S-scan files
                
                CBS = 2;    % display Bscan and Sscan;
                Ind_Z = Z;
                Ind_X = X;
                
                
                [BscanPanel,SscanPanel] = Priv_Current_Layer_dcm(CBS, Ind_X, Ind_Z, DataInformation);
                DataInformation.BscanPanel = BscanPanel;
                DataInformation.SscanPanel = SscanPanel;
                
                %         Priv_display_dicom(h, display_signal, layer)
                h = 2;
                display_signal = DataInformation.BscanPanel;
                layer = Ind_X;
                Priv_display_dicom(h, display_signal, layer);
                
                DataInformation.Current_Disp_Layer_Bscan = Ind_X;
                DataInformation.Current_Disp_Layer_Cscan = -1;
                %                 DataInformation.Current_Disp_Layer_Sscan = -1;
                
                DataInformationFileName = [DataInformation.directory_name,'\DataInformation.mat'];
                save(DataInformationFileName,'DataInformation');
                
            case 7      % all scan files
                CBS = 12;    % display Cscan and Bscan;
                Ind_Z = Z;
                Ind_X = X;
                
                [CscanPanel,BscanPanel] = Priv_Current_Layer_dcm(CBS, Ind_Z, Ind_X,DataInformation);
                DataInformation.CscanPanel = CscanPanel;
                DataInformation.BscanPanel = BscanPanel;
                
                %         Priv_display_dicom(h, display_signal, layer)
                h = 1;
                display_signal = DataInformation.CscanPanel;
                layer = Ind_Z;
                Priv_display_dicom(h, display_signal, layer);
                
                % ========================================= Sscan
                h = 2;
                display_signal = DataInformation.BscanPanel;
                layer = Ind_X;
                Priv_display_dicom(h, display_signal, layer);
                
                %         DataInformation.Current_Disp_Layer_Cscan = 1;
                DataInformation.Current_Disp_Layer_Cscan = Ind_Z;
                DataInformation.Current_Disp_Layer_Bscan = Ind_X;
                
                DataInformationFileName = [DataInformation.directory_name,'\DataInformation.mat'];
                save(DataInformationFileName,'DataInformation');
                
                
                
        end         % the end of switch
        
        
        
        
        
        
        
        
        
        
        
        %         [CscanPanel,BscanPanel] = Priv_Current_Layer_dcm(CBS, Ind_X, Ind_Y, DataInformation);
        %         DataInformation.CscanPanel = CscanPanel;
        %         DataInformation.BscanPanel = BscanPanel;
        %
        % %         Priv_display_dicom(h, display_signal, layer)
        %         h = 1;
        %         display_signal = DataInformation.CscanPanel;
        %         layer = Ind_X;
        %         Priv_display_dicom(h, display_signal, layer);
        %
        %         % ========================================= Sscan
        %         h = 2;
        %         display_signal = DataInformation.BscanPanel;
        %         layer = Ind_Y;
        %         Priv_display_dicom(h, display_signal, layer);
        %
        %         DataInformation.Current_Disp_Layer_Cscan = Ind_X;
        %         DataInformation.Current_Disp_Layer_Bscan = Ind_Y;
        % %         DataInformation.Current_Disp_Layer_Sscan = Ind_Y;
        %
        %         DataInformationFileName = [DataInformation.directory_name,'\DataInformation.mat'];
        %         save(DataInformationFileName,'DataInformation');
    end
    
    % - DICOM -
    
    kkk = 1;
else
    currentAxis = gca;
    % xy plane
    if currentAxis == h1;
        % get current coordinates
        X = floor(yi);
        Y = floor(xi);
        if X <= 0 || X > DataInformation.Lx
            return;
        end
        meshy = getappdata(gcf,'meshy');
        if meshy == 2000000
            if Y <= 0 || Y > DataInformation.Ly*2
                return;
            end
        else
            if Y <= 0 || Y > DataInformation.Ly
                return;
            end
        end
        
        if DataInformation.calibrationFlag == 1
            str = num2str(X);
            if (X<10)
                str = ['00',str]; %#ok<*AGROW>
            elseif(X>9 && X<100)
                str = ['0',str];
            else
                str =str; %#ok<ASGSL>
            end
            
            FileName = [DataInformation.dicomPathCal,'\','Bscan_Cal_',str,'.dcm'];
            BscanPanel = double(dicomread(FileName)) - DataInformation.Constant;
            
            if DataInformation.Relative == 1
                BscanPanel(1,1) = DataInformation.MaxData/2;
                BscanPanel(1,2) = DataInformation.MinData/2;
            end
            
            str = num2str(Y);
            if (Y<10)
                str = ['00',str]; %#ok<*AGROW>
            elseif(Y>9 && Y<100)
                str = ['0',str];
            else
                str =str; %#ok<ASGSL>
            end
            FileName = [DataInformation.dicomPathCal,'\','Sscan_Cal_',str,'.dcm'];
            SscanPanel = double(dicomread(FileName)) - DataInformation.Constant;
            
            if DataInformation.Relative == 1
                SscanPanel(1,1) = DataInformation.MaxData/2;
                SscanPanel(1,2) = DataInformation.MinData/2;
            end
            
        else
            str = num2str(X);
            if (X<10)
                str = ['00',str]; %#ok<*AGROW>
            elseif(X>9 && X<100)
                str = ['0',str];
            else
                str =str; %#ok<ASGSL>
            end
            
            FileName = [DataInformation.dicomPath,'\','Bscan_',str,'.dcm'];
            BscanPanel = double(dicomread(FileName)) - DataInformation.Constant;
            
            str = num2str(Y);
            if (Y<10)
                str = ['00',str]; %#ok<*AGROW>
            elseif(Y>9 && Y<100)
                str = ['0',str];
            else
                str =str; %#ok<ASGSL>
            end
            FileName = [DataInformation.dicomPath,'\','Sscan_',str,'.dcm'];
            SscanPanel = double(dicomread(FileName)) - DataInformation.Constant;
        end
        Adata = BscanPanel(:,Y);
        
        % display the data to the corresponding window
        % Priv_display(window, signal, layerTag);
        Priv_display_dicom(2, BscanPanel, X);
        Priv_display_dicom(3, SscanPanel, Y);
        Priv_display_dicom(4, Adata, DataInformation.Lz);
    end
    
    if currentAxis == h2;
        % get current coordinates
        Y = floor(xi);
        Z = floor(yi);
        if Z <= 0 || Z > DataInformation.Lz
            return;
        end
        
        meshy = getappdata(gcf,'meshy');
        if meshy == 2000000
            if Y <= 0 || Y > DataInformation.Ly*2
                return;
            end
        else
            if Y <= 0 || Y > DataInformation.Ly
                return;
            end
        end
        
        if DataInformation.calibrationFlag == 1
            str = num2str(Z);
            if (Z<10)
                str = ['00',str]; %#ok<*AGROW>
            elseif(Z>9 && Z<100)
                str = ['0',str];
            else
                str =str; %#ok<ASGSL>
            end
            
            FileName = [DataInformation.dicomPathCal,'\','Cscan_Cal_',str,'.dcm'];
            CscanPanel = double(dicomread(FileName)) - DataInformation.Constant;
            
            if DataInformation.Relative == 1
                CscanPanel(1,1) = DataInformation.MaxData/2;
                CscanPanel(1,2) = DataInformation.MinData/2;
            end
            
            str = num2str(Y);
            if (Y<10)
                str = ['00',str]; %#ok<*AGROW>
            elseif(Y>9 && Y<100)
                str = ['0',str];
            else
                str =str; %#ok<ASGSL>
            end
            FileName = [DataInformation.dicomPathCal,'\','Sscan_Cal_',str,'.dcm'];
            SscanPanel = double(dicomread(FileName)) - DataInformation.Constant;
            
            if DataInformation.Relative == 1
                SscanPanel(1,1) = DataInformation.MaxData/2;
                SscanPanel(1,2) = DataInformation.MinData/2;
            end
            
        else
            str = num2str(X);
            if (Z<10)
                str = ['00',str]; %#ok<*AGROW>
            elseif(Z>9 && Z<100)
                str = ['0',str];
            else
                str =str; %#ok<ASGSL>
            end
            
            FileName = [DataInformation.dicomPath,'\','Cscan_',str,'.dcm'];
            CscanPanel = double(dicomread(FileName)) - DataInformation.Constant;
            if DataInformation.Relative == 1
                CscanPanel(1,1) = DataInformation.MaxData/2;
                CscanPanel(1,2) = DataInformation.MinData/2;
            end
            
            str = num2str(Y);
            if (Y<10)
                str = ['00',str]; %#ok<*AGROW>
            elseif(Y>9 && Y<100)
                str = ['0',str];
            else
                str =str; %#ok<ASGSL>
            end
            FileName = [DataInformation.dicomPath,'\','Sscan_',str,'.dcm'];
            SscanPanel = double(dicomread(FileName)) - DataInformation.Constant;
            if DataInformation.Relative == 1
                SscanPanel(1,1) = DataInformation.MaxData/2;
                SscanPanel(1,2) = DataInformation.MinData/2;
            end
        end
        Priv_display_dicom(1, CscanPanel, Z);
        Priv_display_dicom(3, SscanPanel, Y);
        %=================================
    end
    
    if currentAxis == h3;
        Z = floor(xi);
        X = floor(yi);
        if Z <= 0 || Z > DataInformation.Lz
            return;
        end
        if X <= 0 || X > DataInformation.Lx
            return;
        end
        
        if DataInformation.calibrationFlag == 1
            str = num2str(Z);
            if (Z<10)
                str = ['00',str]; %#ok<*AGROW>
            elseif(Z>9 && Z<100)
                str = ['0',str];
            else
                str =str; %#ok<ASGSL>
            end
            
            FileName = [DataInformation.dicomPathCal,'\','Cscan_Cal_',str,'.dcm'];
            CscanPanel = double(dicomread(FileName)) - DataInformation.Constant;
            if DataInformation.Relative == 1
                CscanPanel(1,1) = DataInformation.MaxData/2;
                CscanPanel(1,2) = DataInformation.MinData/2;
            end
            
            str = num2str(X);
            if (X<10)
                str = ['00',str]; %#ok<*AGROW>
            elseif(X>9 && X<100)
                str = ['0',str];
            else
                str =str; %#ok<ASGSL>
            end
            FileName = [DataInformation.dicomPathCal,'\','Bscan_Cal_',str,'.dcm'];
            BscanPanel = double(dicomread(FileName)) - DataInformation.Constant;
            if DataInformation.Relative == 1
                BscanPanel(1,1) = DataInformation.MaxData/2;
                BscanPanel(1,2) = DataInformation.MinData/2;
            end
        else
            str = num2str(Z);
            if (Z<10)
                str = ['00',str]; %#ok<*AGROW>
            elseif(Z>9 && Z<100)
                str = ['0',str];
            else
                str =str; %#ok<ASGSL>
            end
            
            FileName = [DataInformation.dicomPathCal,'\','Cscan_',str,'.dcm'];
            CscanPanel = double(dicomread(FileName)) - DataInformation.Constant;
            if DataInformation.Relative == 1
                CscanPanel(1,1) = DataInformation.MaxData/2;
                CscanPanel(1,2) = DataInformation.MinData/2;
            end
            
            str = num2str(X);
            if (X<10)
                str = ['00',str]; %#ok<*AGROW>
            elseif(X>9 && X<100)
                str = ['0',str];
            else
                str =str; %#ok<ASGSL>
            end
            FileName = [DataInformation.dicomPathCal,'\','Bscan_',str,'.dcm'];
            BscanPanel = double(dicomread(FileName)) - DataInformation.Constant;
            if DataInformation.Relative == 1
                BscanPanel(1,1) = DataInformation.MaxData/2;
                BscanPanel(1,2) = DataInformation.MinData/2;
            end
        end
        Priv_display_dicom(1, CscanPanel, Z);
        Priv_display_dicom(2, BscanPanel, X);
        %=================================
        
    end
    
    kkk = 1;
end


% --- Executes on selection change in layerlist_xy.
function layerlist_xy_Callback(hObject, eventdata, handles)
% hObject    handle to layerlist_xy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns layerlist_xy contents as cell array
%        contents{get(hObject,'Value')} returns selected item from layerlist_xy

Select = get(gcbo, 'Value');

if Select ~= 0
    directory_name = getappdata(gcf,'directory_name');
    DataInformationFileName = [directory_name,'\','DataInformation.mat'];
    load(DataInformationFileName);
    
    % check the dicom file
    dicomFlag = Priv_CheckDicomFiles(DataInformation);
    
    if dicomFlag == 1 || dicomFlag == 4 || dicomFlag == 5 || dicomFlag == 7
        CBS = 1;    % display CscanPanel;
        Ind_X = Select;
        Ind_Y = -1;
        
        [scanPanel1,scanPanel2] = Priv_Current_Layer_dcm(CBS, Ind_X, Ind_Y, DataInformation);
        
        %
        CscanPanel = scanPanel1;
        DataInformation.CscanPanel = CscanPanel;
        h = 1;
        display_signal = CscanPanel;
        layer = Ind_X;
        Priv_display_dicom(h, display_signal, layer);
        
        directory_name = getappdata(gcf,'directory_name');
        DataInformationFileName = [directory_name,'\DataInformation.mat'];
        load(DataInformationFileName);
        DataInformation.Current_Disp_Layer_Cscan = Ind_X;
        save(DataInformationFileName,'DataInformation');
    else
        warndlg('There are no C-scan files');
        return;
    end
    
end

% --- Executes on selection change in layerlist_zy.
function layerlist_zy_Callback(hObject, eventdata, handles)
% hObject    handle to layerlist_zy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns layerlist_zy contents as cell array
%        contents{get(hObject,'Value')} returns selected item from layerlist_zy
Select = get(gcbo, 'Value');

if Select ~= 0
    directory_name = getappdata(gcf,'directory_name');
    DataInformationFileName = [directory_name,'\','DataInformation.mat'];
    load(DataInformationFileName);
    
    % check the dicom file
    dicomFlag = Priv_CheckDicomFiles(DataInformation);
    
    if dicomFlag == 2 || dicomFlag == 4 || dicomFlag == 6 || dicomFlag == 7
        CBS = 2;    % display CscanPanel;
        Ind_X = Select;
        Ind_Y = -1;
        
        [scanPanel1,scanPanel2] = Priv_Current_Layer_dcm(CBS, Ind_X, Ind_Y, DataInformation);
        
        %
        BscanPanel = scanPanel1;
        DataInformation.BscanPanel = BscanPanel;
        
        h = 2;
        display_signal = BscanPanel;
        layer = Ind_X;
        Priv_display_dicom(h, display_signal, layer);
        
        directory_name = getappdata(gcf,'directory_name');
        DataInformationFileName = [directory_name,'\DataInformation.mat'];
        load(DataInformationFileName);
        DataInformation.Current_Disp_Layer_Bscan = Ind_X;
        save(DataInformationFileName,'DataInformation');
    else
        warndlg('There are no B-scan files');
        return;
    end
    
end

% --- Executes on selection change in layerlist_xz.
function layerlist_xz_Callback(hObject, eventdata, handles)
% hObject    handle to layerlist_xz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns layerlist_xz contents as cell array
%        contents{get(hObject,'Value')} returns selected item from layerlist_xz
Select = get(gcbo, 'Value');

if Select ~= 0
    directory_name = getappdata(gcf,'directory_name');
    DataInformationFileName = [directory_name,'\','DataInformation.mat'];
    load(DataInformationFileName);
    
    % check the dicom file
    dicomFlag = Priv_CheckDicomFiles(DataInformation);
    
    if dicomFlag == 3 || dicomFlag == 5 || dicomFlag == 6 || dicomFlag == 7
        CBS = 3;    % display CscanPanel;
        Ind_X = Select;
        Ind_Y = -1;
        
        [scanPanel1,scanPanel2] = Priv_Current_Layer_dcm(CBS, Ind_X, Ind_Y, DataInformation);
        
        %
        SscanPanel = scanPanel1;
        DataInformation.SscanPanel = SscanPanel;
        
        h = 3;
        display_signal = SscanPanel;
        layer = Ind_X;
        Priv_display_dicom(h, display_signal, layer);
        
        directory_name = getappdata(gcf,'directory_name');
        DataInformationFileName = [directory_name,'\DataInformation.mat'];
        load(DataInformationFileName);
        DataInformation.Current_Disp_Layer_Sscan = Ind_X;
        save(DataInformationFileName,'DataInformation');
    else
        warndlg('There are no S-scan files');
        return;
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Private sub-function: compute the current layer from the mat file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [scanPanel1,scanPanel2] = Priv_Current_Layer_dcm(CBS, Ind_X, Ind_Y, DataInformation)
scanPanel1 = [];
scanPanel2 = [];
% CBS = 1: CscanPanel; CBS = 2: BscanPanel; CBS = 3: SscanPanel
% CBS = 12: CscanPanel and BscanPanel;
% CBS = 13: CscanPanel and SscanPanel;
% CBS = 23: BscanPanel and SscanPanel;
% CBS = 33: AscanPanel;

%==========Transfer the layer index (Ind_X and/or Ind_Y) to file name;
if Ind_X > 0
    strInd_X = num2str(Ind_X);
    if (Ind_X<10)
        strInd_X = ['000',strInd_X]; %#ok<*AGROW>
    elseif(Ind_X < 100)
        strInd_X = ['00',strInd_X];
    elseif(Ind_X < 1000)
        strInd_X = ['0',strInd_X];
    else
        strInd_X =strInd_X; %#ok<ASGSL>
    end
else
    strInd_X = [];
end

if Ind_Y > 0
    strInd_Y = num2str(Ind_Y);
    if (Ind_Y<10)
        strInd_Y = ['000',strInd_Y]; %#ok<*AGROW>
    elseif(Ind_Y < 100)
        strInd_Y = ['00',strInd_Y];
    elseif(Ind_Y < 1000)
        strInd_Y = ['0',strInd_Y];
    else
        strInd_Y = strInd_Y; %#ok<ASGSL>
    end
else
    strInd_Y = [];
end

if DataInformation.calibrationFlag == 0
    dcmFilePath = DataInformation.dicomPath;
else
    dcmFilePath = DataInformation.dicomPathCal;
end
%==========Transfer the layer index (Ind_X and/or Ind_Y) to file name;



switch CBS
    case 1
        Panel_X = 'Cscan_';
        Panel_Y = [];
        [FileNameX, FileNameY] = Priv_Transfer_Index_2_DcmFileName(DataInformation, dcmFilePath, Panel_X, Panel_Y, strInd_X, strInd_Y);
        
        CscanPanel = double(dicomread(FileNameX));
        
        if DataInformation.Relative
            CscanPanel(1,1) = DataInformation.MaxData/DataInformation.Coe + DataInformation.Constant;
            CscanPanel(1,2) = DataInformation.MinData/DataInformation.Coe + DataInformation.Constant;
        end
        
        scanPanel1 = CscanPanel;
        scanPanel2 = -1;
        
    case 2
        Panel_X = 'Bscan_';
        Panel_Y = [];
        [FileNameX, FileNameY] = Priv_Transfer_Index_2_DcmFileName(DataInformation, dcmFilePath, Panel_X, Panel_Y, strInd_X, strInd_Y);
        
        BscanPanel = double(dicomread(FileNameX));
        
        if DataInformation.Relative
            BscanPanel(1,1) = DataInformation.MaxData/DataInformation.Coe + DataInformation.Constant;
            BscanPanel(1,2) = DataInformation.MinData/DataInformation.Coe + DataInformation.Constant;
        end
        
        scanPanel1 = BscanPanel;
        scanPanel2 = -1;
        
    case 3
        Panel_X = 'Sscan_';
        Panel_Y = [];
        [FileNameX, FileNameY] = Priv_Transfer_Index_2_DcmFileName(DataInformation, dcmFilePath, Panel_X, Panel_Y, strInd_X, strInd_Y);
        
        SscanPanel = double(dicomread(FileNameX));
        
        if DataInformation.Relative
            SscanPanel(1,1) = DataInformation.MaxData/DataInformation.Coe + DataInformation.Constant;
            SscanPanel(1,2) = DataInformation.MinData/DataInformation.Coe + DataInformation.Constant;
        end
        
        scanPanel1 = SscanPanel;
        scanPanel2 = -1;
        
    case 12
        Panel_X = 'Cscan_';
        Panel_Y = 'Bscan_';
        [FileNameX, FileNameY] = Priv_Transfer_Index_2_DcmFileName(DataInformation, dcmFilePath, Panel_X, Panel_Y, strInd_X, strInd_Y);
        
        CscanPanel = double(dicomread(FileNameX));
        BscanPanel = double(dicomread(FileNameY));
        
        if DataInformation.Relative
            CscanPanel(1,1) = DataInformation.MaxData/DataInformation.Coe + DataInformation.Constant;
            CscanPanel(1,2) = DataInformation.MinData/DataInformation.Coe + DataInformation.Constant;
            
            BscanPanel(1,1) = DataInformation.MaxData/DataInformation.Coe + DataInformation.Constant;
            BscanPanel(1,2) = DataInformation.MinData/DataInformation.Coe + DataInformation.Constant;
        end
        
        scanPanel1 = CscanPanel;
        scanPanel2 = BscanPanel;
        
    case 13     %Ind_X = Y;, Ind_Y = Z;
        Panel_X = 'Cscan_';
        Panel_Y = 'Sscan_';
        [FileNameX, FileNameY] = Priv_Transfer_Index_2_DcmFileName(DataInformation, dcmFilePath, Panel_X, Panel_Y, strInd_X, strInd_Y);
        
        CscanPanel = double(dicomread(FileNameX));
        SscanPanel = double(dicomread(FileNameY));
        
        if DataInformation.Relative
            CscanPanel(1,1) = DataInformation.MaxData/DataInformation.Coe + DataInformation.Constant;
            CscanPanel(1,2) = DataInformation.MinData/DataInformation.Coe + DataInformation.Constant;
            
            SscanPanel(1,1) = DataInformation.MaxData/DataInformation.Coe + DataInformation.Constant;
            SscanPanel(1,2) = DataInformation.MinData/DataInformation.Coe + DataInformation.Constant;
        end
        
        scanPanel1 = CscanPanel;
        scanPanel2 = SscanPanel;
        
    case 23
        Panel_X = 'Bscan_';
        Panel_Y = 'Sscan_';
        [FileNameX, FileNameY] = Priv_Transfer_Index_2_DcmFileName(DataInformation, dcmFilePath, Panel_X, Panel_Y, strInd_X, strInd_Y);
        
        BscanPanel = double(dicomread(FileNameX));
        SscanPanel = double(dicomread(FileNameY));
        
        if DataInformation.Relative
            BscanPanel(1,1) = DataInformation.MaxData/DataInformation.Coe + DataInformation.Constant;
            BscanPanel(1,2) = DataInformation.MinData/DataInformation.Coe + DataInformation.Constant;
            
            SscanPanel(1,1) = DataInformation.MaxData/DataInformation.Coe + DataInformation.Constant;
            SscanPanel(1,2) = DataInformation.MinData/DataInformation.Coe + DataInformation.Constant;
        end
        
        scanPanel1 = BscanPanel;
        scanPanel2 = SscanPanel;
        
    case 33
        Panel_X = 'Bscan_';
        Panel_Y = 'Sscan_';
        [FileNameX, FileNameY] = Priv_Transfer_Index_2_DcmFileName(DataInformation, dcmFilePath, Panel_X, Panel_Y, strInd_X, strInd_Y);
        
        BscanPanel = double(dicomread(FileNameX));
        %         SscanPanel = double(dicomread(FileNameY));
        
        if DataInformation.Relative
            BscanPanel(1,1) = DataInformation.MaxData/DataInformation.Coe + DataInformation.Constant;
            BscanPanel(1,2) = DataInformation.MinData/DataInformation.Coe + DataInformation.Constant;
            
            %             SscanPanel(1,1) = DataInformation.MaxData/DataInformation.Coe + DataInformation.Constant;
            %             SscanPanel(1,2) = DataInformation.MinData/DataInformation.Coe + DataInformation.Constant;
        end
        
        scanPanel1 = BscanPanel(:,Ind_Y);       %(Adata)
        scanPanel2 = -1;
        
end


function [FileNameX, FileNameY] = Priv_Transfer_Index_2_DcmFileName(DataInformation, dcmFilePath, Panel_X, Panel_Y, strInd_X, strInd_Y)
if ~isempty(strInd_X)
    if DataInformation.calibrationFlag == 0
        FileNameX = [dcmFilePath,'\',Panel_X,strInd_X,'.dcm'];
    else
        FileNameX = [dcmFilePath,'\',Panel_X,'Cal_',strInd_X,'.dcm'];
    end
else
    FileNameX = [];
end

if ~isempty(strInd_Y);
    if DataInformation.calibrationFlag == 0
        FileNameY = [dcmFilePath,'\',Panel_Y,strInd_Y,'.dcm'];
    else
        FileNameY = [dcmFilePath,'\',Panel_Y,'Cal_',strInd_Y,'.dcm'];
    end
else
    FileNameY = [];
end









function [scanPanel1,scanPanel2] = Priv_Current_Layer_mat(CBS, Ind_X, Ind_Y)
scanPanel1 = [];
scanPanel2 = [];
% CBS = 1: CscanPanel; CBS = 2: BscanPanel; CBS = 3: SscanPanel
% CBS = 12: CscanPanel and BscanPanel;
% CBS = 13: CscanPanel and SscanPanel;
% CBS = 23: BscanPanel and SscanPanel;
% CBS = 33: AscanPanel;
directory_name = getappdata(gcf,'directory_name');
DataInformationFileName = [directory_name,'\DataInformation.mat'];
load(DataInformationFileName);
MaxData = DataInformation.MaxData;
MinData = DataInformation.MinData;
abstract = DataInformation.Relative;

switch CBS
    case 1
        CscanPanel = [];
        for i = 1: DataInformation.frows
            ADataName = [DataInformation.directory_name, '\', DataInformation.list_text(i,:)];
            load(ADataName);
            
            if DataInformation.calibrationFlag == 1
                CBS_cal = 1;    % calibrate the CscanPanel;
                CscanPaneltemp3D = Priv_calibration(CBS_cal, Data3D);
                CscanPanel((i-1)*48+1:(i-1)*48+48,:) = CscanPaneltemp3D(:,:,Ind_X);
            else
                CscanPanel((i-1)*48+1:(i-1)*48+48,:) = Data3D(:,:,Ind_X);
            end
        end
        
        if abstract
            CscanPanel(1,1) = MaxData; CscanPanel(1,2) = MinData;
        end
        
        scanPanel1 = CscanPanel;
        scanPanel2 = -1;
        
    case 2
        BscanPanel = [];
        X_ind = floor((Ind_X-1)/48);
        ADataName = [DataInformation.directory_name, '\', DataInformation.list_text((X_ind+1),:)];
        load(ADataName);
        layerZY_X = mod(Ind_X-1,48)+1;
        Data3D = shiftdim(Data3D,1);
        
        BscanPaneltemp = Data3D(:,:,layerZY_X)';
        
        if DataInformation.calibrationFlag == 1
            CBS_cal = 2;    % calibrate the CscanPanel;
            BscanPanel = Priv_calibration(CBS_cal, BscanPaneltemp);
        else
            BscanPanel = BscanPaneltemp;
        end
        
        if abstract
            BscanPanel(1,1) = MaxData; BscanPanel(1,2) = MinData;
        end
        
        scanPanel1 = BscanPanel;
        scanPanel2 = -1;
    case 3
        SscanPanel = [];
        for i = 1: DataInformation.frows
            ADataName = [DataInformation.directory_name, '\', DataInformation.list_text(i,:)];
            load(ADataName);
            SscanPanelTemp = shiftdim(Data3D,2);
            
            if DataInformation.calibrationFlag == 1
                CBS_cal = 3;    % calibrate the CscanPanel;
                SscanPanel((i-1)*48+1:(i-1)*48+48,:) = Priv_calibration(CBS_cal, SscanPanelTemp(:,:,Ind_X));
            else
                %==========================================================
                %==========================================================
                datatemp = SscanPanelTemp(:,:,Ind_X);
                SscanPanel((i-1)*48+1:(i-1)*48+48,:) = datatemp';
            end
        end
        
        if abstract
            SscanPanel(1,1) = MaxData; SscanPanel(1,2) = MinData;
        end
        
        scanPanel1 = SscanPanel;
        scanPanel2 = -1;
        
    case 12
        CscanPanel = [];
        BscanPanel = [];
        for i = 1: DataInformation.frows
            ADataName = [DataInformation.directory_name, '\', DataInformation.list_text(i,:)];
            load(ADataName);
            %             CscanPanel((i-1)*48+1:(i-1)*48+48,:) = Data3D(:,:,Ind_X);
            if DataInformation.calibrationFlag == 1
                CBS_cal = 1;    % calibrate the CscanPanel;
                CscanPaneltemp3D = Priv_calibration(CBS_cal, Data3D);
                CscanPanel((i-1)*48+1:(i-1)*48+48,:) = CscanPaneltemp3D(:,:,Ind_X);
            else
                CscanPanel((i-1)*48+1:(i-1)*48+48,:) = Data3D(:,:,Ind_X);
            end
        end
        
        X_ind = floor((Ind_Y-1)/48);
        ADataName = [DataInformation.directory_name, '\', DataInformation.list_text((X_ind+1),:)];
        load(ADataName);
        layerZY_X = mod(Ind_Y-1,48)+1;
        Data3D = shiftdim(Data3D,1);
        %         BscanPanel = Data3D(:,:,layerZY_X)';
        BscanPaneltemp = Data3D(:,:,layerZY_X)';
        
        if DataInformation.calibrationFlag == 1
            CBS_cal = 2;    % calibrate the CscanPanel;
            BscanPanel = Priv_calibration(CBS_cal, BscanPaneltemp);
        else
            BscanPanel = BscanPaneltemp;
        end
        
        if abstract
            CscanPanel(1,1) = MaxData; CscanPanel(1,2) = MinData;
            BscanPanel(1,1) = MaxData; BscanPanel(1,2) = MinData;
        end
        
        scanPanel1 = CscanPanel;
        scanPanel2 = BscanPanel;
        
    case 13     %Ind_X = Y;, Ind_Y = Z;
        CscanPanel = [];
        SscanPanel = [];
        for i = 1: DataInformation.frows
            ADataName = [DataInformation.directory_name, '\', DataInformation.list_text(i,:)];
            load(ADataName);
            %             CscanPanel((i-1)*48+1:(i-1)*48+48,:) = Data3D(:,:,Ind_X);
            if DataInformation.calibrationFlag == 1
                CBS_cal = 1;    % calibrate the CscanPanel;
                CscanPaneltemp3D = Priv_calibration(CBS_cal, Data3D);
                CscanPanel((i-1)*48+1:(i-1)*48+48,:) = CscanPaneltemp3D(:,:,Ind_X);
            else
                CscanPanel((i-1)*48+1:(i-1)*48+48,:) = Data3D(:,:,Ind_X);
            end
            
            SscanPanelTemp = shiftdim(Data3D,2);
            %             SscanPanel((i-1)*48+1:(i-1)*48+48,:) = SscanPanelTemp(:,:,Ind_Y)';
            if DataInformation.calibrationFlag == 1
                CBS_cal = 3;    % calibrate the CscanPanel;
                SscanPanel((i-1)*48+1:(i-1)*48+48,:) = Priv_calibration(CBS_cal, SscanPanelTemp(:,:,Ind_Y));
            else
                SscanPanel((i-1)*48+1:(i-1)*48+48,:) = SscanPanelTemp(:,:,Ind_Y)';
            end
        end
        
        if abstract
            CscanPanel(1,1) = MaxData; CscanPanel(1,2) = MinData;
            SscanPanel(1,1) = MaxData; SscanPanel(1,2) = MinData;
        end
        
        scanPanel1 = CscanPanel;
        scanPanel2 = SscanPanel;
        
    case 23
        BscanPanel = [];
        X_ind = floor((Ind_X-1)/48);
        ADataName = [DataInformation.directory_name, '\', DataInformation.list_text((X_ind+1),:)];
        load(ADataName);
        layerZY_X = mod(Ind_X-1,48)+1;
        Data3D = shiftdim(Data3D,1);
        %         BscanPanel = Data3D(:,:,layerZY_X)';
        BscanPaneltemp = Data3D(:,:,layerZY_X)';
        if DataInformation.calibrationFlag == 1
            CBS_cal = 2;    % calibrate the CscanPanel;
            BscanPanel = Priv_calibration(CBS_cal, BscanPaneltemp);
        else
            BscanPanel = BscanPaneltemp;
        end
        
        SscanPanel = [];
        for i = 1: DataInformation.frows
            ADataName = [DataInformation.directory_name, '\', DataInformation.list_text(i,:)];
            load(ADataName);
            SscanPanelTemp = shiftdim(Data3D,2);
            %             SscanPanel((i-1)*48+1:(i-1)*48+48,:) = SscanPanelTemp(:,:,Ind_Y)';
            SscanPanelTemp = shiftdim(Data3D,2);
            
            if DataInformation.calibrationFlag == 1
                CBS_cal = 3;    % calibrate the CscanPanel;
                SscanPanel((i-1)*48+1:(i-1)*48+48,:) = Priv_calibration(CBS_cal, SscanPanelTemp(:,:,Ind_Y));
            else
                SscanPanel((i-1)*48+1:(i-1)*48+48,:) = SscanPanelTemp(:,:,Ind_Y)';
            end
        end
        
        if abstract
            BscanPanel(1,1) = MaxData; BscanPanel(1,2) = MinData;
            SscanPanel(1,1) = MaxData; SscanPanel(1,2) = MinData;
        end
        
        scanPanel1 = BscanPanel;
        scanPanel2 = SscanPanel;
    case 33
        X_ind = floor(Ind_X/48);
        ADataName = [DataInformation.directory_name, '\', DataInformation.list_text((X_ind+1),:)];
        load(ADataName);
        Adata = shiftdim(Data3D(mod(Ind_X-1,48)+1,Ind_Y,:),2);
        
        if DataInformation.calibrationFlag == 1
            CBS_cal = 4;    % calibrate the CscanPanel;
            scanPanel1 = Priv_calibration(CBS_cal, Adata);
        else
            scanPanel1 = Adata';    % because the flip function is fliplr, not flipup, so it should be a row vector.
        end
        
        scanPanel2 = -1;
end















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [cal_data topsurface_new] = Priv_calibration(CBS_cal, Data3D)

warndlg('this function is renamed as GE_calibration.m, not a inside function');


% DataInformation = getappdata(gcf,'DataInformation');
% [lenX, lenY, lenZ] = size(Data3D);
%
% % CBS_cal = 10;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% topsurface = zeros(lenX,lenY);     %%%%%----this variable is used to store the calibrated distance matrix
% switch CBS_cal
%     case 1
%         cal_data = zeros(lenX, lenY, lenZ);
%
%         for i = 1:lenX
%             for j = 1:lenY
%                 top = min(Data3D(i,j,:));
%                 topind = find(Data3D(i,j,:) == top);
%                 if topind(1,1) < 256
%                     topsurface(i,j) = topind(1,1);
%                     len = 512 - topind(1,1) + 1;
%                     cal_data(i,j,1:len) = Data3D(i,j,topind:end);
%                 end
%             end
%         end
%
%         kkk = 1;
%
%     case 2
%         cal_data = zeros(lenX, lenY);
%
%         for i = 1:lenY
%             top = min(Data3D(:,i));
%             topind = find(Data3D(:,i) == top);
%             if topind(1,1) < 256
%                 len = 512 - topind(1,1) + 1;
%                 cal_data(1:len,i) = Data3D(topind:end,i);
%             end
%         end
%
%     case 3
%         cal_data = zeros(lenY, lenX);
%
%         for i = 1:lenY
%             top = min(Data3D(:,i));
%             topind = find(Data3D(:,i) == top);
%             if topind(1,1) < 256
%                 len = 512 - topind(1,1) + 1;
%                 cal_data(i,1:len) = Data3D(topind:end,i)';
%             end
%         end
%     case 4
%         cal_data = zeros(1, lenX);
%         top = min(Data3D);
%         topind = find(Data3D == top);
%         if topind(1,1) < 256
%             len = 512 - topind(1,1) + 1;
%             cal_data(1,1:len) = Data3D(topind:end,1)';
%         end
%         kkk = 1;
%     case 10
%         cal_data = zeros(lenX, lenY, lenZ);
%
%         for i = 1:lenX
%             for j = 1:lenY
%                 top = min(Data3D(i,j,:));
%                 topind = find(Data3D(i,j,:) == top);
%                 if topind(1,1) < 256
%                     topsurface(i,j) = topind(1,1);
% %                     len = 512 - topind(1,1) + 1;
% %                     cal_data(i,j,1:len) = Data3D(i,j,topind:end);
%                 end
%             end
%         end
%
%         topsurface_original = topsurface;
%
%         for i = 1:lenX
%             data = topsurface(i,:)';
%             x = (1:lenY)';
%             p = polyfit(x,data,3);
%             f = floor(polyval(p,x));
%             topsurface(i,:) = ((abs(f) + f)/2)';
%             kkk = 1;
%         end
%
%         for i = 1:lenX
%             for j = 1:lenY
%                 if topsurface(i,j) ~= 0
%                     len = 512 - topsurface(i,j) + 1;
%                     cal_data(i,j,1:len) = Data3D(i,j,topsurface(i,j):end);
%                 end
%             end
%         end
%
%
%         case 11
%         cal_data = zeros(lenX, lenY, lenZ);
%
%         for i = 1:lenX
%             for j = 1:lenY
%                 top = min(Data3D(i,j,:));
%                 topind = find(Data3D(i,j,:) == top);
%                 if topind(1,1) < 256
%                     topsurface(i,j) = topind(1,1);
% %                     len = 512 - topind(1,1) + 1;
% %                     cal_data(i,j,1:len) = Data3D(i,j,topind:end);
%                 end
%             end
%         end
%
%         topsurface_original = topsurface;
%
%         rows = lenX;
%         cols = lenY;
%
%         y = [1:rows]';
%         x = [1:cols];
%         ww = ones(size(topsurface));
%
% %         P_weighted=polyfitweighted2(x,y,topsurface,4,topsurface);
%         P_weighted=polyfitweighted2(x,y,topsurface,8,ww);
%         z = polyval2(P_weighted,x,y);
%         topsurface_new = z;
%
%         kkk = 1;
%
%
%         for i = 1:lenX
%             data = topsurface(i,:)';
%             x = (1:lenY)';
%             p = polyfit(x,data,3);
%             f = floor(polyval(p,x));
%             topsurface(i,:) = ((abs(f) + f)/2)';
%             kkk = 1;
%         end
%
%         for i = 1:lenX
%             for j = 1:lenY
%                 if topsurface(i,j) ~= 0
%                     len = 512 - topsurface(i,j) + 1;
%                     cal_data(i,j,1:len) = Data3D(i,j,topsurface(i,j):end);
%                 end
%             end
%         end
%
% end
%
% kkk = 1;











% --------------------------------------------------------------------
function M_V_DataNormalize_Callback(hObject, eventdata, handles)
% hObject    handle to M_V_DataNormalize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on button press in checkbox_cal.
function checkbox_cal_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_cal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_cal
check = get(hObject,'Value');
directory_name = getappdata(gcf,'directory_name');
if isempty(directory_name)
    if check
        set(findobj('tag','checkbox_cal'),'Value', 1);
    else
        set(findobj('tag','checkbox_cal'),'Value', 0);
    end
    
else
    DataInformationFileName = [directory_name,'\','DataInformation.mat'];
    load(DataInformationFileName);
    if check
        DataInformation.calibrationFlag = 1;
    else
        DataInformation.calibrationFlag = 0;
    end
    
    if DataInformation.Current_Disp_Layer_Cscan > 0
        CBS = 1;    % this means only display the Cscan
        Ind_X = DataInformation.Current_Disp_Layer_Cscan;
        Ind_Y = -1;
        [CscanPanel,scanPanel2] = Priv_Current_Layer_dcm(CBS, Ind_X, Ind_Y, DataInformation);
        
        h = 1;
        display_signal = CscanPanel;
        layer = Ind_X;
        Priv_display_dicom(h, display_signal, layer);
        DataInformation.CscanPanel = CscanPanel;
    end
    
    if DataInformation.Current_Disp_Layer_Bscan > 0
        CBS = 2;
        Ind_X = DataInformation.Current_Disp_Layer_Bscan;
        Ind_Y = -1;
        [BscanPanel,scanPanel2] = Priv_Current_Layer_dcm(CBS, Ind_X, Ind_Y, DataInformation);
        
        h = 2;
        display_signal = BscanPanel;
        layer = Ind_X;
        Priv_display_dicom(h, display_signal, layer);
        DataInformation.BscanPanel = BscanPanel;
    end
    
    if DataInformation.Current_Disp_Layer_Sscan > 0
        CBS = 3;
        Ind_X = DataInformation.Current_Disp_Layer_Sscan;
        Ind_Y = -1;
        [SscanPanel,scanPanel2] = Priv_Current_Layer_dcm(CBS, Ind_X, Ind_Y, DataInformation);
        
        h = 3;
        display_signal = SscanPanel;
        layer = Ind_X;
        Priv_display_dicom(h, display_signal, layer);
        DataInformation.SscanPanel = SscanPanel;
    end
    
    %=============================================
    % renew the A-scan
    Ind_X = getappdata(gcf,'Ind_X');
    Ind_Y = getappdata(gcf,'Ind_Y');
    if ~isempty(Ind_X) && ~isempty(Ind_Y)
        if Ind_X > 0 && Ind_Y > 0
            CBS = 33;    % display AscanPanel;
            
            [Adata,scanPanel1] = Priv_Current_Layer_dcm(CBS, Ind_X, Ind_Y, DataInformation);
            setappdata(gcf,'Adata',Adata);
            
            h = 4;
            %         flag = get(findobj('tag','checkbox_FFT'),'value');
            %         if flag
            %             display_signal = (log(abs(fftshift(fft(Adata)))+eps))*500;
            %             layer = 512;
            %             Priv_display_dicom(h, display_signal, layer);
            %         else
            display_signal = Adata - DataInformation.Constant;
            layer = 512;
            Priv_display_dicom(h, display_signal, layer);
            %         end
            
        end
    end
    % renew the A-scan
    %=============================================
    
    
    save(DataInformationFileName,'DataInformation');
    
end




% --- Executes on button press in btn_gate_plot.
function btn_gate_plot_Callback(hObject, eventdata, handles)
% hObject    handle to btn_gate_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directory_name = getappdata(gcf,'directory_name');
DataInformationFileName = [directory_name,'\DataInformation.mat'];
load(DataInformationFileName);

%
%
% cof = getappdata(gcf,'cof');
%
% cal_datatemp = zeros(DataInformation.Lx,DataInformation.Ly,DataInformation.Lz);

gate_sta = DataInformation.gate_sta;
gate_end = DataInformation.gate_end;

gate = zeros(DataInformation.Lx, DataInformation.Ly);
if isempty(gate_sta)
    warndlg('Input start layer first');
    return;
end
if isempty(gate_end)
    warndlg('Input start layer');
    return;
end
if gate_sta > gate_end
    warndlg('Wrong layer sequence');
    return;
else
    dicomFlag = Priv_CheckDicomFiles(DataInformation);
    if dicomFlag == 2 || dicomFlag == 4 || dicomFlag == 6 || dicomFlag == 7
        
        for i = 1:DataInformation.Lx
            CBS = 2;
            Ind_X = i;
            Ind_Y = -1;
            [BscanPanel,scanPanel2] = Priv_Current_Layer_dcm(CBS, Ind_X, Ind_Y, DataInformation);
            
            if gate_sta > 0 && gate_end > 0
                gate(i,:) = max(abs(BscanPanel(gate_sta:gate_end,:)));
            else
                return;
            end
            
            kkk = 1;
        end
        
        h = 1;
        display_signal = gate;
        layer = Ind_X;
        Priv_display_dicom(h, display_signal, layer);
        
        DataInformation.CscanPanel = gate;
        save(DataInformationFileName,'DataInformation');
        kkk = 1;
        
    else
        warndlg('Compute the B-scan first!');
    end
    
    
end
% gate = flipud(gate);
% gateN = gate./max(gate(:));
% gateOut = zeros(size(gate));
% T = 0.855;
% for i = 1:DataInformation.Lx
%     for j = 1:DataInformation.Ly
%         if gateN(i,j)> T
%             gateOut(i,j) = 1;
%         end
%     end
% end










% --------------------------------------------------------------------
function M_E_R2_Callback(hObject, eventdata, handles)
% hObject    handle to M_E_R2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





% --------------------------------------------------------------------
function M_F_E_Callback(hObject, eventdata, handles)
% hObject    handle to M_F_E (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


exit;



% --------------------------------------------------------------------
function M_V_GateSetting_Callback(hObject, eventdata, handles)
% hObject    handle to M_V_GateSetting (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function M_V_VoxelDataInformation_Callback(hObject, eventdata, handles)
% hObject    handle to M_V_VoxelDataInformation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function M_V_SelectLayer_Callback(hObject, eventdata, handles)
% hObject    handle to M_V_SelectLayer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function M_H_about_Callback(hObject, eventdata, handles)
% hObject    handle to M_H_about (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on button press in P_SelectLayers.
function P_SelectLayers_CreateFcn(hObject, eventdata, handles)
% hObject    handle to P_SelectLayers (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of P_SelectLayers







% --- Executes on button press in P_SelectLayers.
function P_SelectLayers_Callback(hObject, eventdata, handles)
% hObject    handle to P_SelectLayers (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)










% --------------------------------------------------------------------
function M_F_DICOM_Callback(hObject, eventdata, handles)
% hObject    handle to M_F_DICOM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function M_F_DICOM_MakeAll_Callback(hObject, eventdata, handles)
% hObject    handle to M_F_DICOM_MakeAll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% DicomType = 7, 1, 2, 3 refer to compute all, Cscan, Bscan, Sscan,
% repectively

Priv_clear_axes()

DicomType = 7;
Priv_Make_DICOM(DicomType);





% --------------------------------------------------------------------
function M_F_DICOM_Cscan_Callback(hObject, eventdata, handles)
% hObject    handle to M_F_DICOM_Cscan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% DicomType = 7, 1, 2, 3 refer to compute all, Cscan, Bscan, Sscan,
% repectively

Priv_clear_axes();

DicomType = 1;
Priv_Make_DICOM(DicomType);




% --------------------------------------------------------------------
function M_F_DICOM_Bscan_Callback(hObject, eventdata, handles)
% hObject    handle to M_F_DICOM_Bscan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% DicomType = 7, 1, 2, 3 refer to compute all, Cscan, Bscan, Sscan,
% repectively

% Priv_clear_axes();
%
% DicomType = 2;
% Priv_Make_DICOM(DicomType);



% --------------------------------------------------------------------
function M_F_DICOM_Sscan_Callback(hObject, eventdata, handles)
% hObject    handle to M_F_DICOM_Sscan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% DicomType = 7, 1, 2, 3 refer to compute all, Cscan, Bscan, Sscan,
% repectively

Priv_clear_axes();

DicomType = 3;
Priv_Make_DICOM(DicomType);




%==========================================================================
% it is utility function, called by M_F_DICOM_Callback(hObject, eventdata, handles)
function Priv_Make_DICOM(DicomType)
if exist('log.mat','file')
    load('log.mat');
else
    directory_name = '';
end
if isa(directory_name,'char')
    directory_name = uigetdir(directory_name);
else
    directory_name = '';
    directory_name = uigetdir(directory_name);
end
if directory_name
    save('log.mat','directory_name');
    
    DataInformationFileName = [directory_name,'\','DataInformation.mat'];
    if exist(DataInformationFileName,'file');
        load(DataInformationFileName);
    else
        warndlg('You may lost the "DataInformation.mat", redo the "Open Voxel files"');
        return;
    end
    
    % Update the check button states
    DataInformation.calibrationFlag = get(findobj('tag','checkbox_cal'),'Value');
    DataInformation.Relative = 1 - get(findobj('tag','C_SDM'),'Value');                 % if this is 1, show the relative image, otherwise, show abstract image
    DataInformation.directory_name = directory_name;
    
    save(DataInformationFileName, 'DataInformation');
    
    setappdata(gcf,'directory_name',directory_name);
    set(findobj('tag','figure1'),'name',directory_name);
    
    if directory_name   % do if folder is opened correctly
        setappdata(gcf,'directory_name',directory_name);
        
        % decide if this folder contains all the mat files needed
        %========== Check if there is DataInformation mat files
        AllFileNames = dir([directory_name '\mat\*.mat']);
        [matr,matc] = size(AllFileNames);
        
        % insure that there are correct number of mat files
        if matr ~= 0
            frows = DataInformation.frows;          % the number of Index files (Y folder)
            slots = DataInformation.slots;
            
            % this means that there exit all the Y-mat files, then check the integrality of the DICOM files
            if matr == frows*slots*2
                % if go here, that means there are no DICOM folder, so remake the DICOM files
                % make dicom file and display the first layer
                Priv_makeDicomAndDisplay(DataInformation, DicomType);
            else
                warndlg('This folder lost some mat files, re-make it!');
            end
            
        else        % matr = 0, means that there is no mat file, you should open the voxel file first (make the mat file)
            warndlg('No mat files, make the mat files first!');
        end
    end
end





function Priv_make_DICOM_files(DataInformation, DicomType)

%%%%% all the index voxel files are saved as corresponding mat files.
%%%%% from now, open the mat files and resave it as dicom files.

% make folder if there is initially not have no dicom folders;
if ~exist(DataInformation.dicomPath,'dir')
    mkdir(DataInformation.dicomPath);
end
if ~exist(DataInformation.dicomPathCal,'dir')
    mkdir(DataInformation.dicomPathCal);
end
switch DicomType
    
    case 1
        Priv_make_DICOM_files_Cscan(DataInformation);
        Priv_make_DICOM_files_Bscan(DataInformation);
        
        List.uipanel_cscan = 1;
        List.uipanel_bscan = 1;
        List.uipanel_sscan = 1;
        List.uipanel_ascan = 1;
        List.C_SDM = 1;
        List.panel_defectsDetection = 1;
        List.P_SelectLayers = 1;
        List.uipanel13 = 1;
        List.text44 = 1;
        List.text45 = 1;
        List.text46 = 1;
        List.uipanel18 = 1;
        List.checkbox_cal = 1;
        Priv_DisableEnable(List);
        
    case 2
        Priv_make_DICOM_files_Bscan(DataInformation);
        
        List.uipanel_cscan = 1;
        List.uipanel_bscan = 1;
        List.uipanel_sscan = 1;
        List.uipanel_ascan = 1;
        List.C_SDM = 1;
        List.panel_defectsDetection = 1;
        List.P_SelectLayers = 1;
        List.uipanel13 = 1;
        List.text44 = 1;
        List.text45 = 1;
        List.text46 = 1;
        List.uipanel18 = 1;
        List.checkbox_cal = 1;
        Priv_DisableEnable(List);
        
    case 3
        Priv_make_DICOM_files_Sscan(DataInformation);
        
        List.uipanel_cscan = 1;
        List.uipanel_bscan = 1;
        List.uipanel_sscan = 1;
        List.uipanel_ascan = 1;
        List.C_SDM = 1;
        List.panel_defectsDetection = 1;
        List.P_SelectLayers = 1;
        List.uipanel13 = 1;
        List.text44 = 1;
        List.text45 = 1;
        List.text46 = 1;
        List.uipanel18 = 1;
        List.checkbox_cal = 1;
        Priv_DisableEnable(List);
        
    case 7
        Priv_make_DICOM_files_Cscan(DataInformation);
        Priv_make_DICOM_files_Bscan(DataInformation);
        Priv_make_DICOM_files_Sscan(DataInformation);
        
        List.uipanel_cscan = 1;
        List.uipanel_bscan = 1;
        List.uipanel_sscan = 1;
        List.uipanel_ascan = 1;
        List.C_SDM = 1;
        List.panel_defectsDetection = 1;
        List.P_SelectLayers = 1;
        List.uipanel13 = 1;
        List.text44 = 1;
        List.text45 = 1;
        List.text46 = 1;
        List.uipanel18 = 1;
        List.checkbox_cal = 1;
        Priv_DisableEnable(List);
        
end



function Priv_make_DICOM_files_Cscan(DataInformation)

%%%%% ---Cscan file

h = waitbar(0,'Saving Cscan to DICOM');
wb_ind = 1;
for ci = 1:16
    Cscan_dicom = [];
    Cscan_dicom_cal = [];
    for di = 1:DataInformation.frows
        for ei = 1:DataInformation.slots
            if ei < 10
                dataName = [DataInformation.directory_name, '\mat\', DataInformation.list_text(di,:),'_000',num2str(ei), '.mat'];
                dataName_cal = [DataInformation.directory_name, '\mat\', 'cal_', DataInformation.list_text(di,:),'_000',num2str(ei), '.mat'];
            else
                if ei < 100
                    dataName = [DataInformation.directory_name, '\mat\', DataInformation.list_text(di,:),'_00',num2str(ei), '.mat'];
                    dataName_cal = [DataInformation.directory_name, '\mat\', 'cal_', DataInformation.list_text(di,:),'_00',num2str(ei), '.mat'];
                else
                    if ei < 1000
                        dataName = [DataInformation.directory_name, '\mat\', DataInformation.list_text(di,:),'_',num2str(ei), '.mat'];
                        dataName_cal = [DataInformation.directory_name, '\mat\', 'cal_', DataInformation.list_text(di,:),'_',num2str(ei), '.mat'];
                    else
                        dataName = [DataInformation.directory_name, '\mat\', DataInformation.list_text(di,:),'_',num2str(ei), '.mat'];
                        dataName_cal = [DataInformation.directory_name, '\mat\', 'cal_', DataInformation.list_text(di,:),'_',num2str(ei), '.mat'];
                    end
                end
            end
            
            load(dataName);
            load(dataName_cal);
            [stempa, stempb, stempc] = size(Data3D);
            
            Cscan_dicom((di-1)*48+1:(di-1)*48+48,(ei-1)*stempb+1:(ei-1)*stempb+stempb,1:32) = Data3D(:,:,(ci-1)*32+1:(ci-1)*32+32);
            Cscan_dicom_cal((di-1)*48+1:(di-1)*48+48,(ei-1)*stempb+1:(ei-1)*stempb+stempb,1:32) = cal_data(:,:,(ci-1)*32+1:(ci-1)*32+32);
            %             Cscan_dicom((di-1)*48+1:(di-1)*48+48,:,1:32) = Data3D(:,:,(ci-1)*32+1:(ci-1)*32+32);
            %             Cscan_dicom_cal((di-1)*48+1:(di-1)*48+48,:,1:32) = cal_data(:,:,(ci-1)*32+1:(ci-1)*32+32);
        end
    end
    
    % for each block, there are 32 layers
    for dicomi = 1:32
        dic_ind = dicomi+(ci-1)*32;
        str = num2str(dic_ind);
        if (dic_ind<10)
            str = ['000',str]; %#ok<*AGROW>
        elseif(dic_ind>9 && dic_ind<100)
            str = ['00',str];
        else
            str =['0',str]; %#ok<ASGSL>
        end
        FileName = [DataInformation.dicomPath,'\','Cscan_',str,'.dcm'];
        dictemp = uint16(Cscan_dicom(:,:,dicomi)/DataInformation.Coe+DataInformation.Constant);
        dicomwrite(dictemp, FileName);
        
        FileName_cal = [DataInformation.dicomPathCal,'\','Cscan_Cal_',str,'.dcm'];
        dictempcal = uint16(Cscan_dicom_cal(:,:,dicomi)/DataInformation.Coe+DataInformation.Constant);
        dicomwrite(dictempcal, FileName_cal);
        wb_ind = wb_ind + 1;
        waitbar(wb_ind/512);
    end
end
close(h);
clear ci Cscan_dicom Cscan_dicom_cal di dataName dataName_cal dicomi;
clear dic_ind str FileName dictemp FileName_cal dictempcal Data3D cal_data;


function Priv_make_DICOM_files_Bscan(DataInformation)
%%%%% ---Bscan file
h = waitbar(0,'Saving Bscan to DICOM');
wb_ind = 1;
x = 8;     %6*8=48

% loop for index
for Index = 1:DataInformation.frows
    
    % loop for layers in each index
    for xi = 1:48/x
        
        % read in the slots in each index
        for slotsI = 1:DataInformation.slots
            if slotsI < 10
                dataName = [DataInformation.directory_name, '\mat\', DataInformation.list_text(Index,:),'_000',num2str(slotsI), '.mat'];
                dataName_cal = [DataInformation.directory_name, '\mat\', 'cal_', DataInformation.list_text(Index,:),'_000',num2str(slotsI), '.mat'];
            else
                if slotsI < 100
                    dataName = [DataInformation.directory_name, '\mat\', DataInformation.list_text(Index,:),'_00',num2str(slotsI), '.mat'];
                    dataName_cal = [DataInformation.directory_name, '\mat\', 'cal_', DataInformation.list_text(Index,:),'_00',num2str(slotsI), '.mat'];
                else
                    if slotsI < 1000
                        dataName = [DataInformation.directory_name, '\mat\', DataInformation.list_text(Index,:),'_0',num2str(slotsI), '.mat'];
                        dataName_cal = [DataInformation.directory_name, '\mat\', 'cal_', DataInformation.list_text(Index,:),'_0',num2str(slotsI), '.mat'];
                    else
                        dataName = [DataInformation.directory_name, '\mat\', DataInformation.list_text(Index,:),'_',num2str(slotsI), '.mat'];
                        dataName_cal = [DataInformation.directory_name, '\mat\', 'cal_', DataInformation.list_text(Index,:),'_',num2str(slotsI), '.mat'];
                    end
                end
            end
            
            load(dataName);
            load(dataName_cal);
            [stempa, stempb, stempc] = size(Data3D);
            
            Bscan_dicom(1:x,(slotsI-1)*stempb+1:(slotsI-1)*stempb+stempb,:) = Data3D((xi-1)*x+1:(xi-1)*x+x,:,:);
            Bscan_dicom_cal(1:x,(slotsI-1)*stempb+1:(slotsI-1)*stempb+stempb,:) = cal_data((xi-1)*x+1:(xi-1)*x+x,:,:);
        end
        
        
        % save B-scan
        Data3Dtemp = shiftdim(Bscan_dicom,1);
        Data3Dcaltemp = shiftdim(Bscan_dicom_cal,1);
        for Bind = 1:x
            dic_ind = (Index - 1)*48 + (xi - 1) * x + Bind;
            str = num2str(dic_ind);
            if (dic_ind < 10)
                str = ['000',str]; %#ok<*AGROW>
            elseif (dic_ind < 100)
                str = ['00',str];
            elseif (dic_ind < 1000)
                str = ['0',str];
            else
                str =str; %#ok<ASGSL>
            end
            
            FileName = [DataInformation.dicomPath,'\','Bscan_',str,'.dcm'];
            dictemp = uint16(Data3Dtemp(:,:,Bind)/DataInformation.Coe + DataInformation.Constant);
            dicomwrite(dictemp', FileName);
            
            FileName_cal = [DataInformation.dicomPathCal,'\','Bscan_Cal_',str,'.dcm'];
            dictempcal = uint16(Data3Dcaltemp(:,:,Bind)/DataInformation.Coe + DataInformation.Constant);
            dicomwrite(dictempcal', FileName_cal);
            wb_ind = wb_ind + 1;
            waitbar(wb_ind/(DataInformation.frows*48));
        end     % loop for saving
    end         % loop for xi
end             % loop for index


close(h);



function Priv_make_DICOM_files_Sscan(DataInformation)
%%%%% ---Sscan file

h = waitbar(0,'Saving Sscan to DICOM');
wb_ind = 1;
x = 8;     %6*8=48

% loop for slots
for slotsI = 1:DataInformation.slots
    % loop for index
    for Index = 1:DataInformation.frows
        if slotsI < 10
            dataName = [DataInformation.directory_name, '\mat\', DataInformation.list_text(Index,:),'_000',num2str(slotsI), '.mat'];
            dataName_cal = [DataInformation.directory_name, '\mat\', 'cal_', DataInformation.list_text(Index,:),'_000',num2str(slotsI), '.mat'];
        else
            if slotsI < 100
                dataName = [DataInformation.directory_name, '\mat\', DataInformation.list_text(Index,:),'_00',num2str(slotsI), '.mat'];
                dataName_cal = [DataInformation.directory_name, '\mat\', 'cal_', DataInformation.list_text(Index,:),'_00',num2str(slotsI), '.mat'];
            else
                if slotsI < 1000
                    dataName = [DataInformation.directory_name, '\mat\', DataInformation.list_text(Index,:),'_0',num2str(slotsI), '.mat'];
                    dataName_cal = [DataInformation.directory_name, '\mat\', 'cal_', DataInformation.list_text(Index,:),'_0',num2str(slotsI), '.mat'];
                else
                    dataName = [DataInformation.directory_name, '\mat\', DataInformation.list_text(Index,:),'_',num2str(slotsI), '.mat'];
                    dataName_cal = [DataInformation.directory_name, '\mat\', 'cal_', DataInformation.list_text(Index,:),'_',num2str(slotsI), '.mat'];
                end
            end
        end
        
        load(dataName);
        load(dataName_cal);
        [stempa, stempb, stempc] = size(Data3D);
        
        Sscan_dicom((Index - 1)*48+1:(Index - 1)*48+48,:,:) = Data3D(:,:,:);
        Sscan_dicom_cal((Index - 1)*48+1:(Index - 1)*48+48,:,:) = cal_data(:,:,:);
    end
    
    Sscan_dicom = shiftdim(Sscan_dicom,2);
    Sscan_dicom_cal = shiftdim(Sscan_dicom_cal,2);
    
    % for each block, there are stempb layers
    for dicomi = 1:stempb
        dic_ind = (slotsI - 1)*stempb + dicomi;
        str = num2str(dic_ind);
        if (dic_ind<10)
            str = ['000',str]; %#ok<*AGROW>
        elseif(dic_ind<100)
            str = ['00',str];
        elseif(dic_ind<1000)
            str = ['0',str];
        else
            str =str; %#ok<ASGSL>
        end
        FileName = [DataInformation.dicomPath,'\','Sscan_',str,'.dcm'];
        dictemp = uint16(Sscan_dicom(:,:,dicomi)/DataInformation.Coe + DataInformation.Constant);
        dicomwrite(dictemp', FileName);
        
        FileName_cal = [DataInformation.dicomPathCal,'\','Sscan_Cal_',str,'.dcm'];
        dictempcal = uint16(Sscan_dicom_cal(:,:,dicomi)/DataInformation.Coe+DataInformation.Constant);
        dicomwrite(dictempcal', FileName_cal);
        wb_ind = wb_ind + 1;
        waitbar(wb_ind/(DataInformation.slots*stempb));
    end
    
    clear Sscan_dicom Sscan_dicom_cal;
    
end


close(h);






function Priv_display_dicom(h, display_signal, layer)

switch h
    case 1
        
        h1 = getappdata(gcf,'h1');
        axes(h1);            % show the original image on the left panel
        imshow(mat2gray(display_signal));
        colormap(jet);
        
        cof = getappdata(gcf,'cof');
        position = get(gca,'position');
        PlotRatio = position(3)/position(4);
        PlotRatio = PlotRatio/cof;
        [dataRows, dataCols] = size(display_signal);
        DataRatio = dataRows*PlotRatio/dataCols;
        set(gca,'DataAspectRatio',[1 DataRatio 1]);
        % show current layer
        if layer > 0
            set(findobj('tag','t_xy'),'string',layer);
        else
            set(findobj('tag','t_xy'),'string','Sum');
        end
        
    case 2
        h2 = getappdata(gcf,'h2');
        axes(h2);            % show the original image on the left panel
        imshow(mat2gray(display_signal));
        colormap(jet);
        
        cof = getappdata(gcf,'cof');
        position = get(gca,'position');
        PlotRatio = position(3)/position(4);
        PlotRatio = PlotRatio/cof;
        [dataRows, dataCols] = size(display_signal);
        DataRatio = dataRows*PlotRatio/dataCols;
        set(gca,'DataAspectRatio',[1 DataRatio 1])
        
        % show current layer
        set(findobj('tag','t_zy'),'string',layer);
        
    case 3
        
        h3 = getappdata(gcf,'h3');
        axes(h3);            % show the original image on the left panel
        imshow(mat2gray(display_signal));
        colormap(jet);
        
        cof = getappdata(gcf,'cof');
        position = get(gca,'position');
        PlotRatio = position(3)/position(4);
        PlotRatio = PlotRatio/cof;
        [dataRows, dataCols] = size(display_signal);
        DataRatio = dataRows*PlotRatio/dataCols;
        set(gca,'DataAspectRatio',[1 DataRatio 1])
        
        % show current layer
        set(findobj('tag','t_xz'),'string',layer);
        
    case 4
        
        h4 = getappdata(gcf,'h4');
        axes(h4);            % show the original image on the left panel
        %     Adata = Adata';
        Adata = flipud(display_signal);
        
        temp = 1:layer;
        %     plot(abs(Adata),temp,'y','linewidth',1);
        plot(Adata,temp,'y','linewidth',1);
        axis([-10000 10000 0 layer]);
        set(h4,'Color','k');
        kkk = 1;
        
        mind = min(Adata);
        512 - find(Adata == mind);
end


% --------------------------------------------------------------------
function M_F_Configration_Callback(hObject, eventdata, handles)
% hObject    handle to M_F_Configration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('log.mat')
GE_project_SysConfig();



kkk = 1;









% --------------------------------------------------------------------
function M_T_Callback(hObject, eventdata, handles)
% hObject    handle to M_T (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function M_T_Plot_Gating_Image_Callback(hObject, eventdata, handles)
% hObject    handle to M_T_Plot_Gating_Image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)











% --------------------------------------------------------------------
function M_F_VFConvertion_Callback(hObject, eventdata, handles)
% hObject    handle to M_F_VFConvertion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% for version conversion, it will start from the C root
directory_name = 'c:\';
directory_name = uigetdir(directory_name);


if directory_name
    
    newDataPath = [directory_name,'_NewData'];
    prmPath = [newDataPath,'\','Prm'];
    
    if exist(newDataPath,'dir') == 0
        mkdir(newDataPath);                 % make the root folder of new format
        
        mkdir([prmPath]);                   % make the Prm folder of new format
    end
    
    % dirname = 'd:\KAL\';
    % time=clock;
    % mkdirname = strcat(dirname,date,'(',num2str(time(4)),num2str(time(3)),')');
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % this block is used to open the prm file
    PrmTemp = dir([directory_name,'\*.Prm']);
    if  ~isempty(PrmTemp)
        [PrmRows, PrmCols] = size(PrmTemp);
        if PrmRows > 1
            warndlg('Error, there are more than one prm files.');
            return;
        end
        
        MeansName = [directory_name,'\',PrmTemp.name];
        tfid = fopen(MeansName);
        if tfid  == -1
            warndlg('There is no PRM file, plz check it first!');
            return;
            %         setappdata(gcf,'meshx',-1);
            %         setappdata(gcf,'meshy',-1);
            %         setappdata(gcf,'meshz',-1);
        else
            while ~feof(tfid)                                      % 判断是否为文件末尾
                tline=fgetl(tfid);                                 % 从文件读行
                [trows,tcols] = size(tline);
                if tcols > 12
                    if tline(7:10) == 'mesh'
                        if tline(12) == 'x'
                            meshx = str2num(tline(18:end));
                            setappdata(gcf,'meshx',meshx);
                        end
                        if tline(12) == 'y'
                            meshy = str2num(tline(18:end));
                            setappdata(gcf,'meshy',meshy);
                        end
                        if tline(12) == 'z'
                            meshz = str2num(tline(18:end));
                            setappdata(gcf,'meshz',meshz);
                        end
                    end
                end
            end
        end
    else
        warndlg('There is no PRM file, plz check it first!');
        return;
        %     setappdata(gcf,'meshx',-1);
        %     setappdata(gcf,'meshy',-1);
        %     setappdata(gcf,'meshz',-1);
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    yfolderName = 'Y00000';
    xFolderName = 'X00000';
    newDataName = 'DAT00000';
    dirinfo=dir(directory_name);
    % cnt=size(dirinfo);
    % currentpath=path;
    
    h = waitbar(0,'Converting old format to new format');
    wb_ind = 1;
    
    
    
    [sizeTempA,sizeTempB] = size(dirinfo);
    for i = 3 : sizeTempA
        if(dirinfo(i).isdir)        % if this is a folder, get the folder name and ready to convert the voxel file to new folder
            
            % check whether the dirinfo(i).name is in the correct format. e.g.
            % 0000, 0001, 0002, 0003, etc; and the length is 4;
            nameTempStr = dirinfo(i).name;
            nameTempNum = str2num(nameTempStr);
            if length(dirinfo(i).name) == 4 && ~isempty(nameTempNum)
                
                % the serial-number in a folder start from 1
                count=0;
                % make the Y folder first
                if nameTempNum < 10
                    subYFolderName = [newDataPath,'\',yfolderName,'00',num2str(nameTempNum)];
                else
                    if nameTempNum < 100
                        subYFolderName = [newDataPath,'\',yfolderName,'0',num2str(nameTempNum)];
                    else
                        subYFolderName = [newDataPath,'\',yfolderName,num2str(nameTempNum)];
                    end
                end
                mkdir(subYFolderName);
                
                % get the folder name that contains the voxel files;
                subFileName = dir([directory_name,'\',dirinfo(i).name]);
                
                % loop the current folder and put the voxel files to individual folders
                for j = 3 : size(subFileName)
                    if(subFileName(j).isdir)
                        continue;
                    else
                        filename = subFileName(j).name;
                        if (count < 10)
                            subXFolderName = [subYFolderName,'\',xFolderName,'00',num2str(count)];
                            cpfile=strcat(subXFolderName,'\',newDataName,'00',num2str(count),'.vxl');
                        else
                            if (count < 100)
                                subXFolderName = [subYFolderName,'\',xFolderName,'0',num2str(count)];
                                cpfile=strcat(subXFolderName,'\',newDataName,'0',num2str(count),'.vxl');
                            else
                                subXFolderName = [subYFolderName,'\',xFolderName,num2str(count)];
                                cpfile=strcat(subXFolderName,'\',newDataName,num2str(count),'.vxl');
                            end
                        end
                        mkdir(subXFolderName);
                        fullfilename=strcat(directory_name,'\',dirinfo(i).name,'\',filename);
                        copyfile(fullfilename,cpfile);
                        count=count+1;
                    end
                end
            else
                
            end
            
        else                        % else, just copy this file to the new folder (root)
            sourceFileName = strcat(directory_name,'\',dirinfo(i).name);
            targetFileName = [prmPath,'\',dirinfo(i).name];
            if strcmp(targetFileName(end-2:end),'prm')
                clear targetFileName;
                targetFileName = [prmPath,'\','meas.prm'];
            end
            copyfile(sourceFileName,targetFileName);
        end
        
        wb_ind = wb_ind + 1;
        waitbar(wb_ind/(sizeTempA - 2));
    end
    
    close(h);
    
    % 这个函数将转换后的版本直接提取后变成Voxel数据
    Priv_Raw2Voxel(newDataPath);
    
    kkk = 1;
end




%==========================================================================
% This function is used to make the dicomfile and display the first layer

function Priv_makeDicomAndDisplay(DataInformation, DicomType)

% remake the dicom files here
Priv_make_DICOM_files(DataInformation, DicomType);

dicomFlag = Priv_CheckDicomFiles(DataInformation);
% display the first dicom files
Priv_DisplayInitialLayer(DataInformation, dicomFlag)


%==========================================================================
% this function is used to display the initial layer
function Priv_DisplayInitialLayer(DataInformation, DicomType)
% display the any initial layer here
if DataInformation.calibrationFlag == 0
    switch DicomType
        case 1
            
            DicomFileName = [DataInformation.directory_name,'\DICOM\','Cscan_0001.dcm'];
            CscanPanel = double(dicomread(DicomFileName));
            
            BscanPanel = -1;
            
            SscanPanel = -1;
            
        case 2
            
            CscanPanel = -1;
            
            DicomFileName = [DataInformation.directory_name,'\DICOM\','Bscan_0001.dcm'];
            BscanPanel = double(dicomread(DicomFileName));
            
            SscanPanel = -1;
            
        case 3
            
            CscanPanel = -1;
            
            BscanPanel = -1;
            
            DicomFileName = [DataInformation.directory_name,'\DICOM\','Sscan_0001.dcm'];
            SscanPanel = double(dicomread(DicomFileName));
            
        case 4
            
            DicomFileName = [DataInformation.directory_name,'\DICOM\','Cscan_0001.dcm'];
            CscanPanel = double(dicomread(DicomFileName));
            
            DicomFileName = [DataInformation.directory_name,'\DICOM\','Bscan_0001.dcm'];
            BscanPanel = double(dicomread(DicomFileName));
            
            SscanPanel = -1;
            
        case 5
            
            DicomFileName = [DataInformation.directory_name,'\DICOM\','Cscan_0001.dcm'];
            CscanPanel = double(dicomread(DicomFileName));
            
            BscanPanel = -1;
            
            DicomFileName = [DataInformation.directory_name,'\DICOM\','Sscan_0001.dcm'];
            SscanPanel = double(dicomread(DicomFileName));
            
        case 6
            
            CscanPanel = -1;
            
            DicomFileName = [DataInformation.directory_name,'\DICOM\','Bscan_0001.dcm'];
            BscanPanel = double(dicomread(DicomFileName));
            
            DicomFileName = [DataInformation.directory_name,'\DICOM\','Sscan_0001.dcm'];
            SscanPanel = double(dicomread(DicomFileName));
            
        case 7
            
            DicomFileName = [DataInformation.directory_name,'\DICOM\','Bscan_0001.dcm'];
            BscanPanel = double(dicomread(DicomFileName));
            
            DicomFileName = [DataInformation.directory_name,'\DICOM\','Cscan_0001.dcm'];
            CscanPanel = double(dicomread(DicomFileName));
            
            DicomFileName = [DataInformation.directory_name,'\DICOM\','Sscan_0001.dcm'];
            SscanPanel = double(dicomread(DicomFileName));
    end
    
else
    switch DicomType
        case 1
            
            DicomFileName = [DataInformation.directory_name,'\DICOM_Cal\','Cscan_Cal_0001.dcm'];
            CscanPanel = double(dicomread(DicomFileName));
            
            BscanPanel = -1;
            
            SscanPanel = -1;
            
        case 2
            
            CscanPanel = -1;
            
            DicomFileName = [DataInformation.directory_name,'\DICOM_Cal\','Bscan_Cal_0001.dcm'];
            BscanPanel = double(dicomread(DicomFileName));
            
            SscanPanel = -1;
            
        case 3
            
            CscanPanel = -1;
            
            BscanPanel = -1;
            
            DicomFileName = [DataInformation.directory_name,'\DICOM_Cal\','Sscan_Cal_0001.dcm'];
            SscanPanel = double(dicomread(DicomFileName));
            
        case 4
            
            DicomFileName = [DataInformation.directory_name,'\DICOM_Cal\','Cscan_Cal_0001.dcm'];
            CscanPanel = double(dicomread(DicomFileName));
            
            DicomFileName = [DataInformation.directory_name,'\DICOM_Cal\','Bscan_Cal_0001.dcm'];
            BscanPanel = double(dicomread(DicomFileName));
            
            SscanPanel = -1;
            
        case 5
            
            DicomFileName = [DataInformation.directory_name,'\DICOM_Cal\','Cscan_Cal_0001.dcm'];
            CscanPanel = double(dicomread(DicomFileName));
            
            BscanPanel = -1;
            
            DicomFileName = [DataInformation.directory_name,'\DICOM_Cal\','Sscan_Cal_0001.dcm'];
            SscanPanel = double(dicomread(DicomFileName));
            
        case 6
            
            CscanPanel = -1;
            
            DicomFileName = [DataInformation.directory_name,'\DICOM_Cal\','Bscan_Cal_0001.dcm'];
            BscanPanel = double(dicomread(DicomFileName));
            
            DicomFileName = [DataInformation.directory_name,'\DICOM_Cal\','Sscan_Cal_0001.dcm'];
            SscanPanel = double(dicomread(DicomFileName));
            
        case 7
            DicomFileName = [DataInformation.directory_name,'\DICOM_Cal\','Cscan_Cal_0001.dcm'];
            CscanPanel = double(dicomread(DicomFileName));
            
            DicomFileName = [DataInformation.directory_name,'\DICOM_Cal\','Bscan_Cal_0001.dcm'];
            BscanPanel = double(dicomread(DicomFileName));
            
            DicomFileName = [DataInformation.directory_name,'\DICOM_Cal\','Sscan_Cal_0001.dcm'];
            SscanPanel = double(dicomread(DicomFileName));
    end
end

switch DicomType
    case 1
        if DataInformation.Relative == 1
            CscanPanel(1,1) = DataInformation.MaxData / DataInformation.Coe + DataInformation.Constant;
            CscanPanel(1,2) = DataInformation.MinData / DataInformation.Coe + DataInformation.Constant;
        end
        
        % Priv_display_dicom(h, display_signal, layer)
        Priv_display_dicom(1, CscanPanel, 1);
        
        DataInformation.Current_Disp_Layer_Cscan = 1;
        DataInformation.Current_Disp_Layer_Bscan = -1;
        DataInformation.Current_Disp_Layer_Sscan = -1;
        
        DataInformation.gate_sta = 0;
        DataInformation.gate_end = 0;
        
        Priv_setInitInformation(DataInformation.directory_name);
        
        DataInformationFileName = [DataInformation.directory_name,'\DataInformation.mat'];
        save(DataInformationFileName,'DataInformation');
    case 2
        if DataInformation.Relative == 1
            BscanPanel(1,1) = DataInformation.MaxData / DataInformation.Coe + DataInformation.Constant;
            BscanPanel(1,2) = DataInformation.MinData / DataInformation.Coe + DataInformation.Constant;
        end
        
        % Priv_display_dicom(h, display_signal, layer)
        Priv_display_dicom(2, BscanPanel, 1);
        
        DataInformation.Current_Disp_Layer_Cscan = -1;
        DataInformation.Current_Disp_Layer_Bscan = 1;
        DataInformation.Current_Disp_Layer_Sscan = -1;
        
        DataInformation.gate_sta = 0;
        DataInformation.gate_end = 0;
        
        Priv_setInitInformation(DataInformation.directory_name);
        
        DataInformationFileName = [DataInformation.directory_name,'\DataInformation.mat'];
        save(DataInformationFileName,'DataInformation');
    case 3
        if DataInformation.Relative == 1
            SscanPanel(1,1) = DataInformation.MaxData / DataInformation.Coe + DataInformation.Constant;
            SscanPanel(1,2) = DataInformation.MinData / DataInformation.Coe + DataInformation.Constant;
        end
        
        % Priv_display_dicom(h, display_signal, layer)
        Priv_display_dicom(3, SscanPanel, 1);
        
        DataInformation.Current_Disp_Layer_Cscan = -1;
        DataInformation.Current_Disp_Layer_Bscan = -1;
        DataInformation.Current_Disp_Layer_Sscan = 1;
        
        DataInformation.gate_sta = 0;
        DataInformation.gate_end = 0;
        
        Priv_setInitInformation(DataInformation.directory_name);
        
        DataInformationFileName = [DataInformation.directory_name,'\DataInformation.mat'];
        save(DataInformationFileName,'DataInformation');
    case 4      % C-scan and B-scan
        if DataInformation.Relative == 1
            BscanPanel(1,1) = DataInformation.MaxData / DataInformation.Coe + DataInformation.Constant;
            BscanPanel(1,2) = DataInformation.MinData / DataInformation.Coe + DataInformation.Constant;
            CscanPanel(1,1) = DataInformation.MaxData / DataInformation.Coe + DataInformation.Constant;
            CscanPanel(1,2) = DataInformation.MinData / DataInformation.Coe + DataInformation.Constant;
        end
        
        Priv_display_dicom(1, CscanPanel, 1);
        Priv_display_dicom(2, BscanPanel, 1);
        
        DataInformation.Current_Disp_Layer_Cscan = 1;
        DataInformation.Current_Disp_Layer_Bscan = 1;
        DataInformation.Current_Disp_Layer_Sscan = -1;
        
        DataInformation.gate_sta = 0;
        DataInformation.gate_end = 0;
        
        Priv_setInitInformation(DataInformation.directory_name);
        
        DataInformationFileName = [DataInformation.directory_name,'\DataInformation.mat'];
        save(DataInformationFileName,'DataInformation');
        
    case 5
        if DataInformation.Relative == 1
            CscanPanel(1,1) = DataInformation.MaxData / DataInformation.Coe + DataInformation.Constant;
            CscanPanel(1,2) = DataInformation.MinData / DataInformation.Coe + DataInformation.Constant;
            SscanPanel(1,1) = DataInformation.MaxData / DataInformation.Coe + DataInformation.Constant;
            SscanPanel(1,2) = DataInformation.MinData / DataInformation.Coe + DataInformation.Constant;
        end
        
        Priv_display_dicom(1, CscanPanel, 1);
        Priv_display_dicom(3, SscanPanel, 1);
        
        DataInformation.Current_Disp_Layer_Cscan = 1;
        DataInformation.Current_Disp_Layer_Bscan = -1;
        DataInformation.Current_Disp_Layer_Sscan = 1;
        
        DataInformation.gate_sta = 0;
        DataInformation.gate_end = 0;
        
        Priv_setInitInformation(DataInformation.directory_name);
        
        DataInformationFileName = [DataInformation.directory_name,'\DataInformation.mat'];
        save(DataInformationFileName,'DataInformation');
        
    case 6
        if DataInformation.Relative == 1
            BscanPanel(1,1) = DataInformation.MaxData / DataInformation.Coe + DataInformation.Constant;
            BscanPanel(1,2) = DataInformation.MinData / DataInformation.Coe + DataInformation.Constant;
            SscanPanel(1,1) = DataInformation.MaxData / DataInformation.Coe + DataInformation.Constant;
            SscanPanel(1,2) = DataInformation.MinData / DataInformation.Coe + DataInformation.Constant;
        end
        
        Priv_display_dicom(2, BscanPanel, 1);
        Priv_display_dicom(3, SscanPanel, 1);
        
        DataInformation.Current_Disp_Layer_Cscan = -1;
        DataInformation.Current_Disp_Layer_Bscan = 1;
        DataInformation.Current_Disp_Layer_Sscan = 1;
        
        DataInformation.gate_sta = 0;
        DataInformation.gate_end = 0;
        
        Priv_setInitInformation(DataInformation.directory_name);
        
        DataInformationFileName = [DataInformation.directory_name,'\DataInformation.mat'];
        save(DataInformationFileName,'DataInformation');
        
    case 7
        if DataInformation.Relative == 1
            BscanPanel(1,1) = DataInformation.MaxData / DataInformation.Coe + DataInformation.Constant;
            BscanPanel(1,2) = DataInformation.MinData / DataInformation.Coe + DataInformation.Constant;
            CscanPanel(1,1) = DataInformation.MaxData / DataInformation.Coe + DataInformation.Constant;
            CscanPanel(1,2) = DataInformation.MinData / DataInformation.Coe + DataInformation.Constant;
            SscanPanel(1,1) = DataInformation.MaxData / DataInformation.Coe + DataInformation.Constant;
            SscanPanel(1,2) = DataInformation.MinData / DataInformation.Coe + DataInformation.Constant;
        end
        
        Priv_display_dicom(1, CscanPanel, 1);
        Priv_display_dicom(2, BscanPanel, 1);
        Priv_display_dicom(3, SscanPanel, 1);
        
        DataInformation.Current_Disp_Layer_Cscan = 1;
        DataInformation.Current_Disp_Layer_Bscan = 1;
        DataInformation.Current_Disp_Layer_Sscan = 1;
        
        DataInformation.gate_sta = 0;
        DataInformation.gate_end = 0;
        
        Priv_setInitInformation(DataInformation.directory_name);
        
        DataInformationFileName = [DataInformation.directory_name,'\DataInformation.mat'];
        save(DataInformationFileName,'DataInformation');
end







% --------------------------------------------------------------------
function M_V_ShowCurrentLayer_Callback(hObject, eventdata, handles)
% hObject    handle to M_V_ShowCurrentLayer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function M_V_ShowCurrentLayer_C_Callback(hObject, eventdata, handles)
% hObject    handle to M_V_ShowCurrentLayer_C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function M_V_ShowCurrentLayer_B_Callback(hObject, eventdata, handles)
% hObject    handle to M_V_ShowCurrentLayer_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function M_V_ShowCurrentLayer_S_Callback(hObject, eventdata, handles)
% hObject    handle to M_V_ShowCurrentLayer_S (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)









% --------------------------------------------------------------------
function M_V_ShowDICOM_Callback(hObject, eventdata, handles)
% hObject    handle to M_V_ShowDICOM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Priv_clear_axes();

load('log.mat');
if isa(directory_name,'char')
    directory_name = uigetdir(directory_name);
else
    directory_name = '';
    directory_name = uigetdir(directory_name);
end
if directory_name           % do if folder is opened correctly
    save('log.mat','directory_name');
    
    DataInformationFileName = [directory_name,'\','DataInformation.mat'];
    if exist(DataInformationFileName,'file');
        load(DataInformationFileName);
    else
        warndlg('You may lost the "DataInformation.mat", re-click the "Open Voxel Files" in File-menu');
        return;
    end
    
    % Update the check button states
    DataInformation.calibrationFlag = get(findobj('tag','checkbox_cal'),'Value');
    DataInformation.Relative = 1 - get(findobj('tag','C_SDM'),'Value');                 % if this is 1, show the relative image, otherwise, show abstract image
    DataInformation.directory_name = directory_name;
    
    save(DataInformationFileName, 'DataInformation');
    
    setappdata(gcf,'directory_name',directory_name);
    set(findobj('tag','figure1'),'name',directory_name);
    
    
    
    % decide if this folder contains all the DICOM files needed
    % for normal DICOM and calibrated DICOM files
    % if there are all type DICOM files, then display C B Sscans,
    % otherwise, if there are only Cscans then display them.
    
    %==========================
    % dicomFlag = 1      % only C-scan files
    % dicomFlag = 2      % only B-scan files
    % dicomFlag = 3      % only S-scan files
    % dicomFlag = 4      % only C-scan and B-scan files
    % dicomFlag = 5      % only C-scan and S-scan files
    % dicomFlag = 6      % only B-scan and S-scan files
    % dicomFlag = 7      % all scan files
    %==========================
    DicomType = Priv_CheckDicomFiles(DataInformation);
    
    % must renew the Current_Disp_Layer_Xscan in "Priv_DisplayInitialLayer"
    
    % Display the initial layer =============== C scan, B scan, and S scan
    % DicomType = 1 --> all scans
    % DicomType = 2 --> Cscans
    % DicomType = 3 --> Bscans
    % DicomType = 4 --> Sscans,
    % DicomType = 5 --> Cscans, Bscans
    % DicomType = 6 --> Cscans, Sscans,
    % DicomType = 7 --> Bscans, Sscans,
    Priv_DisplayInitialLayer(DataInformation, DicomType);
    
    % if all the dicom files exist, then display the
    % initial layer, display warning message, then
    % quit, otherwise, remake the dicom files
    
    Ind_X = -1;
    Ind_Y = -1;
    setappdata(gcf,'Ind_X',Ind_X);
    setappdata(gcf,'Ind_Y',Ind_Y);
    
    List.uipanel_cscan = 1;
    List.uipanel_bscan = 1;
    List.uipanel_sscan = 1;
    List.uipanel_ascan = 1;
    List.C_SDM = 1;
    List.panel_defectsDetection = 1;
    List.P_SelectLayers = 1;
    List.uipanel13 = 1;
    List.text44 = 1;
    List.text45 = 1;
    List.text46 = 1;
    List.uipanel18 = 1;
    List.checkbox_cal = 1;
    List.panel_defectsDetection = 1;
    Priv_DisableEnable(List);
    
end









%--------------------------------------------------------------------------
% this function is used to enable or disable all the controllers on the
% main panel, input is the list of displaying controller, no output
function Priv_DisableEnable(List)

if List.uipanel_cscan == -1
    set(findobj('tag','uipanel_cscan'),'visible','off');
else
    set(findobj('tag','uipanel_cscan'),'visible','on');
end

if List.uipanel_bscan == -1
    set(findobj('tag','uipanel_bscan'),'visible','off');
else
    set(findobj('tag','uipanel_bscan'),'visible','on');
end

if List.uipanel_sscan == -1
    set(findobj('tag','uipanel_sscan'),'visible','off');
else
    set(findobj('tag','uipanel_sscan'),'visible','on');
end

if List.uipanel_ascan == -1
    set(findobj('tag','uipanel_ascan'),'visible','off');
else
    set(findobj('tag','uipanel_ascan'),'visible','on');
end

if List.C_SDM == -1
    set(findobj('tag','C_SDM'),'visible','off');
else
    set(findobj('tag','C_SDM'),'visible','on');
end

if List.panel_defectsDetection == -1
    set(findobj('tag','panel_defectsDetection'),'visible','off');
else
    set(findobj('tag','panel_defectsDetection'),'visible','on');
end
if List.P_SelectLayers == -1
    set(findobj('tag','P_SelectLayers'),'visible','off');
else
    set(findobj('tag','P_SelectLayers'),'visible','on');
end
if List.uipanel13 == -1
    set(findobj('tag','uipanel13'),'visible','off');
else
    set(findobj('tag','uipanel13'),'visible','on');
end
if List.text44 == -1
    set(findobj('tag','text44'),'visible','off');
else
    set(findobj('tag','text44'),'visible','on');
end
if List.text45 == -1
    set(findobj('tag','text45'),'visible','off');
else
    set(findobj('tag','text45'),'visible','on');
end
if List.text46 == -1
    set(findobj('tag','text46'),'visible','off');
else
    set(findobj('tag','text46'),'visible','on');
end
if List.uipanel18 == -1
    set(findobj('tag','uipanel18'),'visible','off');
else
    set(findobj('tag','uipanel18'),'visible','on');
end
if List.checkbox_cal == -1
    set(findobj('tag','checkbox_cal'),'visible','off');
else
    set(findobj('tag','checkbox_cal'),'visible','on');
end


%--------------------------------------------------------------------------
% this function is used to clear all the windows before perform other
% actions, there are no input and output arguments
function Priv_clear_axes()

h1 = getappdata(gcf,'h1');
axes(h1);            % show the original image on the left panel
cla;

h2 = getappdata(gcf,'h2');
axes(h2);            % show the original image on the left panel
cla;

h3 = getappdata(gcf,'h3');
axes(h3);            % show the original image on the left panel
cla;

h4 = getappdata(gcf,'h4');
axes(h4);            % show the original image on the left panel
cla;

kkk = get(findobj('tag','e_gate_s'),'value');

set(findobj('tag','text_X1'),'string','');
set(findobj('tag','text_X2'),'string','');
set(findobj('tag','text_Y1'),'string','');
set(findobj('tag','text_Y2'),'string','');
set(findobj('tag','text_Z1'),'string','');
set(findobj('tag','text_Z2'),'string','');

set(findobj('tag','e_gate_s'),'string','');
set(findobj('tag','e_gate_e'),'string','');

set(findobj('tag','layerlist_xy'),'string','');
set(findobj('tag','layerlist_zy'),'string','');
set(findobj('tag','layerlist_xz'),'string','');

set(findobj('tag','t_xy'),'string','');
set(findobj('tag','t_zy'),'string','');
set(findobj('tag','t_xz'),'string','');

set(findobj('tag','text_specimen'),'string','');




kkk = 1;


%--------------------------------------------------------------------------
% this function is used to verify the dicom files
% input is the DataInformation,
% output is the file code, that indicate which dicom files exist there
% dicomFlag = 1      % only C-scan files
% dicomFlag = 2      % only B-scan files
% dicomFlag = 3      % only S-scan files
% dicomFlag = 4      % only C-scan and B-scan files
% dicomFlag = 5      % only C-scan and S-scan files
% dicomFlag = 6      % only B-scan and S-scan files
% dicomFlag = 7      % all scan files
function dicomFlag = Priv_CheckDicomFiles(DataInformation)
dicomFlag = -1;

dicomPath = DataInformation.dicomPath;
dicomPathCal = DataInformation.dicomPathCal;

dicomFiles = dir(dicomPath);
dicomFilesCal = dir(dicomPathCal);

if length(dicomFiles) <= 20 || length(dicomFilesCal) == 20
    warndlg('There are no DICOM files in ..\DICOM or ..\DICOM_Cal, make DICOM file first');
    return;
end

Cscan = 'Cscan';
Bscan = 'Bscan';
Sscan = 'Sscan';

Cind = 0;
Bind = 0;
Sind = 0;

Cind_Cal = 0;
Bind_Cal = 0;
Sind_Cal = 0;

for i = 1:length(dicomFiles)
    if strfind(dicomFiles(i).name, Cscan)
        Cind = Cind + 1;
    end
    if strfind(dicomFiles(i).name, Bscan)
        Bind = Bind + 1;
    end
    if strfind(dicomFiles(i).name, Sscan)
        Sind = Sind + 1;
    end
end

for i = 1:length(dicomFilesCal)
    if strfind(dicomFilesCal(i).name, Cscan)
        Cind_Cal = Cind_Cal + 1;
    end
    if strfind(dicomFilesCal(i).name, Bscan)
        Bind_Cal = Bind_Cal + 1;
    end
    if strfind(dicomFilesCal(i).name, Sscan)
        Sind_Cal = Sind_Cal + 1;
    end
end

if Cind ~= Cind_Cal || Bind ~= Bind_Cal || Sind ~= Sind_Cal
    warndlg('You lost some DICOM files in ..\DICOM or ..\DICOM_Cal');
    return;
end

if Cind  == Cind_Cal && Bind == Bind_Cal && Sind == Sind_Cal && Cind == DataInformation.Lz && Bind == 0 && Sind == 0
    dicomFlag = 1;
end

if Cind  == Cind_Cal && Bind == Bind_Cal && Sind == Sind_Cal && Cind == 0 && Bind == DataInformation.Lx && Sind == 0
    dicomFlag = 2;
end

if Cind  == Cind_Cal && Bind == Bind_Cal && Sind == Sind_Cal && Cind == 0 && Bind == 0 && Sind == DataInformation.Ly
    dicomFlag = 3;
end

if Cind  == Cind_Cal && Bind == Bind_Cal && Sind == Sind_Cal && Cind == DataInformation.Lz && Bind == DataInformation.Lx && Sind == 0
    dicomFlag = 4;
end

if Cind  == Cind_Cal && Bind == Bind_Cal && Sind == Sind_Cal && Cind == DataInformation.Lz && Bind == 0 && Sind == DataInformation.Ly
    dicomFlag = 5;
end

if Cind  == Cind_Cal && Bind == Bind_Cal && Sind == Sind_Cal && Cind == 0 && Bind == DataInformation.Lx && Sind == DataInformation.Ly
    dicomFlag = 6;
end

if Cind  == Cind_Cal && Bind == Bind_Cal && Sind == Sind_Cal && Cind == DataInformation.Lz && Bind == DataInformation.Lx && Sind == DataInformation.Ly
    dicomFlag = 7;
end

kkk = 1;









% --- Executes during object creation, after setting all properties.
function text_X1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_X1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called







%==========================================================================
% detection of defects

% --- Executes on button press in btn_detectDefects.
function btn_detectDefects_Callback(hObject, eventdata, handles)
% hObject    handle to btn_detectDefects (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Priv_clear_axes();

% get data
% debug = getappdata(gcf,'DisplayDefect');

debug = 0;      % if set debug == 1, then you need set breakpoint in the corresponding line


% retrieve data
zonghe = getappdata(gcf,'zonghe');
bottom = getappdata(gcf,'bottom');
clicks = getappdata(gcf,'clicks');

if isempty(zonghe) || isempty(bottom) || isempty(clicks)
    warndlg('Train or load data first');
    return;
end

zonghe = zonghe/clicks;

kkk = 1;

directory_name = getappdata(gcf,'directory_name');

if isempty(directory_name)
    warndlg('You work improperly now, please open any working directory first!');
    return;
end

DataInformationFileName = [directory_name,'\','DataInformation.mat'];
if exist(DataInformationFileName,'file');
    load(DataInformationFileName);
else
    warndlg('You may lost the "DataInformation.mat", re-click the "Open Voxel Files" in File-menu');
    return;
end

% Update the check button states
DataInformation.calibrationFlag = get(findobj('tag','checkbox_cal'),'Value');
DataInformation.Relative = 1 - get(findobj('tag','C_SDM'),'Value');                 % if this is 1, show the relative image, otherwise, show abstract image
DataInformation.directory_name = directory_name;

%==========================================================================
ThresholdName = [directory_name,'\Threshold.mat'];
if exist(ThresholdName,'file')
    load(ThresholdName);
else
    threshold = 300;
end
temp = bottom*DataInformation.Ly;
%==========================================================================


save(DataInformationFileName, 'DataInformation');

setappdata(gcf,'directory_name',directory_name);
set(findobj('tag','figure1'),'name',directory_name);

if directory_name           % do if folder is opened correctly
    
    % decide if this folder contains all the DICOM files needed
    % for normal DICOM and calibrated DICOM files
    % if there are all type DICOM files, then display C B Sscans,
    % otherwise, if there are only Cscans then display them.
    
    %==========================
    % dicomFlag = 1      % only C-scan files
    % dicomFlag = 2      % only B-scan files
    % dicomFlag = 3      % only S-scan files
    % dicomFlag = 4      % only C-scan and B-scan files
    % dicomFlag = 5      % only C-scan and S-scan files
    % dicomFlag = 6      % only B-scan and S-scan files
    % dicomFlag = 7      % all scan files
    %==========================
    DicomType = Priv_CheckDicomFiles(DataInformation);
    
    % if DicomType is 7 so you can do the defects detection
    
    if DicomType ~= 7
        warndlg('To do the defect detection, please create the C- and B-scan DICOM files first');
        return;
    end
    
    zonghe = zonghe - DataInformation.Constant;
    if isempty(zonghe)
        warndlg('Select the trainning data or load the trainning data first');
        return;
    end
    if sum(isnan(zonghe))
        warndlg('Load the trainning data first!');
        return;
    end
    
    % compute the model only based on two points
    y1 = abs(min(zonghe));
    y2 = max(zonghe);
    if y2 <= 0
        warndlg('Error in modeling, check the input signal');
        return;
    end
    
    x1 = 1;
    x2t = find(zonghe == y2);    % should check the y2
    x2 = x2t(1,1);
    
    if y2/y1 < 0.6
        y2 = min(zonghe(x2:end));
        x2t = find(zonghe == y2);
        x2 = x2t(1,1);
        y2 = abs(y2);
    end
    tao = (x2 - x1)/reallog(y1/y2);
    k = y1/exp(-1/tao);
    funL = -k * exp(-[1:bottom]'/tao) - threshold;
    funU = -funL + threshold;
    
    if debug == 1
        figure,plot(zonghe);hold on;
        plot(funL,'k');
        plot(funU,'m');
        hold off;
    end
    
    vectorT = [1:bottom]';
    yU = [funU(:,ones(1,DataInformation.Ly))];
    yL = [funL(:,ones(1,DataInformation.Ly))];
    
    kkk = 1;
    
    % from here, we start do the defect detection.
    dicomPathCal = DataInformation.dicomPathCal;
    Lx = DataInformation.Lx;
    
    h = waitbar(0,'Detecting defects and saving results to DICOM');
    wb_ind = 1;
    
    %@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    %     % make the low-pass filter. 用来生成高斯滤波器
    %     gradientsigma = 1;
    %     sze = fix(6*gradientsigma);   if ~mod(sze,2); sze = sze+1; end
    %     f = fspecial('gaussian', sze, gradientsigma); % Generate Gaussian filter.
    %@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    
    Cscan = zeros(DataInformation.Lx,DataInformation.Ly);
    topInd = zeros(DataInformation.Lx,DataInformation.Ly);
    
    for Ind_X = 1:Lx;     %==============================================
        strInd_X = num2str(Ind_X);
        if (Ind_X<10)
            strInd_X = ['000',strInd_X]; %#ok<*AGROW>
        elseif(Ind_X < 100)
            strInd_X = ['00',strInd_X];
        elseif(Ind_X < 1000)
            strInd_X = ['0',strInd_X];
        else
            strInd_X =strInd_X; %#ok<ASGSL>
        end
        
        % load the B-scan DICOM files and subtract the model
        Panel_X = 'Bscan_';
        FileNameX = [dicomPathCal,'\',Panel_X,'Cal_',strInd_X,'.dcm'];
        BscanPanel = double(dicomread(FileNameX));
        BscanPanel = BscanPanel - DataInformation.Constant;
        
        % create a new blank image;
        BscanPanelNew = zeros(size(yU));
        
        debugc = 1;
        
        % test code for correlation of Ascans;
        [cr,cc] = size(BscanPanel(1:bottom,:));
        if debugc == 0
            for ii = 1:cc-1
                for jj = ii+1:cc
                    xianggt = corrcoef(BscanPanel(1:bottom,ii),BscanPanel(1:bottom,jj));
                    xiangg(ii,jj) = abs(xianggt(1,2));
                    kkk = 1;
                end
            end
        end
        
        BscanTemp = abs(BscanPanel(1:bottom,:));
        indTemp = find(BscanTemp > yU);
        BscanPanelNew(indTemp) = BscanTemp(indTemp);
        
        BscanPanelNew_bin = zeros(size(BscanPanelNew));
        BscanPanelNew_bin(find(BscanPanelNew>10)) = 5000;
        BscanPanelNew = BscanPanelNew_bin;
        for col_t = 1:DataInformation.Ly
            itemp = find(BscanPanelNew(:,col_t)>0);
            if ~isempty(itemp)
                BscanPanelNew(itemp(1,1)+1:end,col_t) = 0;
                topInd(Ind_X,col_t) = itemp(1,1);
            end
        end
        
        Cscan(Ind_X,:) = sum(BscanPanelNew);
        
        clear BscanPanelNew_bin;
        
        % BscanPanelNew = filter2(f, BscanPanelNew); % Gradient of the image in x
        
        if Ind_X == 30
            kkk = 1;
        end
        
        %=====================================
        %         BscanPanelNewReshape = Priv_reshape(DataInformation,BscanPanelNew);
        %         BscanPanelNew = BscanPanelNewReshape;
        %=====================================
        
        if debug == 1
            figure,surf((BscanPanelNew)),shading interp
        end
        
        DisplayPath = [directory_name,'\Display3D\'];
        setappdata(gcf,'DisplayPath',DisplayPath);
        
        if exist(DisplayPath,'dir') ~= 7
            mkdir(DisplayPath)
        end
        defectDicomName = [DisplayPath,Panel_X,'Cal_',strInd_X,'.dcm'];
        
        studyid='102';
        seriesnum=265;
        info.StudyID=studyid;
        info.SeriesNumber=seriesnum;
        
        dictempcal = uint16(BscanPanelNew+DataInformation.Constant);
        %         dicomwrite(dictempcal', defectDicomName);
        dicomwrite(dictempcal', defectDicomName,info);
        
        wb_ind = Ind_X;
        waitbar(wb_ind/(Lx));
        
        kkk = 1;
    end
    
    
    close(h);
    
    [Cscan_L, num] = bwlabel(Cscan);
    if num > 0
        for L_r_ind = 1:num
            label_tempInd = find(Cscan_L == L_r_ind);
            topInd(label_tempInd) = floor(mean(topInd(label_tempInd)));
        end
    end
    
    %% reset the dicom files so to display in another software
    ori_files = dir(fullfile(DisplayPath,'\*.dcm'));
    info=dicominfo([DisplayPath '\' ori_files(1).name]);
    
    studyuid=info.StudyInstanceUID;
    seriesuid=info.SeriesInstanceUID;
    
    studyid='525';
    seriesnum=525;
    
    for i=1:size(ori_files(:),1)
        if ori_files(i).isdir == 0
            img=dicomread([DisplayPath,'\',ori_files(i).name]);
            img_k = zeros(size(img));
            
            info=dicominfo([DisplayPath,'\',ori_files(i).name]);
            info.Filename=[DisplayPath,'\',ori_files(i).name];
            info.StudyInstanceUID=studyuid;
            info.SeriesInstanceUID=seriesuid;
            info.InstanceNumber=i;
            info.SliceLocation=double(i);
            info.ImagePositionPatient=[0 0 i];
            info.StudyID=studyid;
            info.SeriesNumber=seriesnum;
            info.SliceThickness=1;
            info.PixelSpacing=[1 1];
            info.SpacingBetweenSlices=1;
            
            topvalue = find(topInd(i,:) > 0);
            if ~isempty(topvalue)
                for ind_temp = 1:length(topvalue)
                    img_k(topvalue(ind_temp), topInd(i,topvalue(ind_temp))) = ...
                        DataInformation.MaxData;
                    %DataInformation.Constant + DataInformation.Constant;
                end
                
                kkk = 1;
            end
            img = img_k;
            
            %===========================
            % fill the boundary
            img = img';
            if i == 1
                img(10,:) = DataInformation.MaxData;
                img(bottom,:) = DataInformation.MaxData;
                img(:,10) = DataInformation.MaxData;
                img(:,DataInformation.Ly) = DataInformation.MaxData;
            end
            
            if i == 1 || i == Lx
                img(1,:) = DataInformation.MaxData;
                img(bottom,:) = DataInformation.MaxData;
                img(:,1) = DataInformation.MaxData;
                img(:,DataInformation.Ly) = DataInformation.MaxData;
            else
                img(1,1) = DataInformation.MaxData;
                img(1,DataInformation.Ly) = DataInformation.MaxData;
                img(bottom,1) = DataInformation.MaxData;
                img(bottom,DataInformation.Ly) = DataInformation.MaxData;
            end
            img = img';
            %===========================
            
            dicomwrite(img,[DisplayPath,'\',ori_files(i).name],info,'CreateMode','copy');
            % vol(:,:,i)=img;
        end
    end
    
    clc    dos('C:\Program Files\CVLab\SetupMipDemo\MipDemo.exe');
end


function BscanPanelNewReshape = Priv_reshape(DataInformation,BscanPanelNew)
% meshx = DataInformation.meshx;
meshy = DataInformation.meshy;
meshz = DataInformation.meshz;

% imx = DataInformation.Lx;
imy = DataInformation.Ly;
imz = DataInformation.Lz;

% Rx = imx * meshx / 1000000;
Ry = imy * meshy / 1000000;
Rz = imz * meshz / 1000000;

BscanPanelNewReshape = imresize(BscanPanelNew,[Rz Ry],'bilinear');








% %==========================================================================
% % detection of defects
%
% % --- Executes on button press in btn_detectDefects.
% function btn_detectDefects_Callback(hObject, eventdata, handles)
% % hObject    handle to btn_detectDefects (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
%
% % Priv_clear_axes();
%
% % get data
% % debug = getappdata(gcf,'DisplayDefect');
%
% debug = 0;      % if set debug == 1, then you need set breakpoint in the corresponding line
%
%
% % retrieve data
% zonghe = getappdata(gcf,'zonghe');
% bottom = getappdata(gcf,'bottom');
% clicks = getappdata(gcf,'clicks');
%
% zonghe = zonghe/clicks;
%
% kkk = 1;
%
% directory_name = getappdata(gcf,'directory_name');
%
% if isempty(directory_name)
%     warndlg('You work improperly now, please open any working directory first!');
%     return;
% end
%
% DataInformationFileName = [directory_name,'\','DataInformation.mat'];
% if exist(DataInformationFileName,'file');
%     load(DataInformationFileName);
% else
%     warndlg('You may lost the "DataInformation.mat", re-click the "Open Voxel Files" in File-menu');
%     return;
% end
%
% % Update the check button states
% DataInformation.calibrationFlag = get(findobj('tag','checkbox_cal'),'Value');
% DataInformation.Relative = 1 - get(findobj('tag','C_SDM'),'Value');                 % if this is 1, show the relative image, otherwise, show abstract image
% DataInformation.directory_name = directory_name;
%
% %==========================================================================
% ThresholdName = [directory_name,'\Threshold.mat'];
% if exist(ThresholdName,'file')
%     load(ThresholdName);
% else
%     threshold = 1000;
% end
% temp = bottom*DataInformation.Ly;
% %==========================================================================
%
%
%
% save(DataInformationFileName, 'DataInformation');
%
% setappdata(gcf,'directory_name',directory_name);
% set(findobj('tag','figure1'),'name',directory_name);
%
% if directory_name           % do if folder is opened correctly
%
%     % decide if this folder contains all the DICOM files needed
%     % for normal DICOM and calibrated DICOM files
%     % if there are all type DICOM files, then display C B Sscans,
%     % otherwise, if there are only Cscans then display them.
%
%     %==========================
%     % dicomFlag = 1      % only C-scan files
%     % dicomFlag = 2      % only B-scan files
%     % dicomFlag = 3      % only S-scan files
%     % dicomFlag = 4      % only C-scan and B-scan files
%     % dicomFlag = 5      % only C-scan and S-scan files
%     % dicomFlag = 6      % only B-scan and S-scan files
%     % dicomFlag = 7      % all scan files
%     %==========================
%     DicomType = Priv_CheckDicomFiles(DataInformation);
%
%     % if DicomType is 7 so you can do the defects detection
%
%     if DicomType ~= 7
%         warndlg('To do the defect detection, please create the C- and B-scan DICOM files first');
%         return;
%     end
%
%     zonghe = zonghe - DataInformation.Constant;
%     if isempty(zonghe)
%         warndlg('Select the trainning data or load the trainning data first');
%         return;
%     end
%     if sum(isnan(zonghe))
%         warndlg('Load the trainning data first!');
%         return;
%     end
%     [upperenv lowerenv] = envelope(zonghe);
%
%     cfunL = fit([1:bottom]',lowerenv','exp1');
%     funL = cfunL.a * exp([1:bottom]'*cfunL.b);
%     funU = -cfunL.a * exp([1:bottom]'*cfunL.b);
%
%     MinDatah = DataInformation.MinData / DataInformation.Coe;
%     const = abs(MinDatah - cfunL(1))+threshold;
%
%     if debug == 1
%         figure,plot(zonghe);hold on;
%         plot(funL);
%
%     %     funU = -cfunL.a * exp(x*cfunL.b);
%         plot(funU);
%     end
%
% %     % compute the noise of modelling data
% %     for nind = 1:bottom
% %         if zonghe(nind) > funU(nind)
% %             utemp(nind) = zonghe(nind) - funU(nind);
% %         elseif zonghe(nind) < funL(nind)
% %             utemp(nind) = funL(nind) - zonghe(nind);
% %         else
% %             utemp(nind) = 0;
% %         end
% %     end
% %
% %     const = max(abs(utemp));
%
%     funL = funL - const;
%     funU = funU + const;
%
%     if debug == 1
%         plot(funL,'k');
%         plot(funU,'m');
%     end
%
%     funL2D = zeros(bottom,DataInformation.Ly);
%     funU2D = zeros(bottom,DataInformation.Ly);
%     for i = 1:DataInformation.Ly
%         funL2D(:,i) = funL;
%         funU2D(:,i) = funU;
%     end
%
%     funL2D1D = reshape(funL2D,bottom*DataInformation.Ly,1);
%     funU2D1D = reshape(funU2D,bottom*DataInformation.Ly,1);
%
%     kkk = 1;
%
%     % from here, we start do the defect detection.
%     dicomPathCal = DataInformation.dicomPathCal;
%     Lx = DataInformation.Lx;
%
%     h = waitbar(0,'Making DICOM');
%     wb_ind = 1;
%
%     for Ind_X = 1:Lx;     %==============================================
%         strInd_X = num2str(Ind_X);
%         if (Ind_X<10)
%             strInd_X = ['000',strInd_X]; %#ok<*AGROW>
%         elseif(Ind_X < 100)
%             strInd_X = ['00',strInd_X];
%         elseif(Ind_X < 1000)
%             strInd_X = ['0',strInd_X];
%         else
%             strInd_X =strInd_X; %#ok<ASGSL>
%         end
%
%         % load the B-scan DICOM files and subtract the model
%         Panel_X = 'Bscan_';
%         FileNameX = [dicomPathCal,'\',Panel_X,'Cal_',strInd_X,'.dcm'];
%         BscanPanel = double(dicomread(FileNameX));
%         BscanPanel = BscanPanel - DataInformation.Constant;
%
%         Bscan1D = reshape(BscanPanel(1:bottom,:),bottom*DataInformation.Ly,1);
%
% %         if debug == 1
% %             h = waitbar(0,'Converting old format to new format');
% %             wb_ind = 1;
% %         end
%
%
%         for nind = 1:temp
%             if Bscan1D(nind) > funU2D1D(nind)
%                 utemp(nind) = Bscan1D(nind) - funU2D1D(nind);
%             elseif Bscan1D(nind) < funL2D1D(nind)
%                 utemp(nind) = funL2D1D(nind) - Bscan1D(nind);
%             else
%                 utemp(nind) = 0;
%             end
% %             if debug == 1
% %                 wb_ind = wb_ind + 1;
% %                 waitbar(wb_ind/temp);
% %             end
%         end
%
% %         if debug == 1
% %             close(h);
% %         end
%
%         BscanPanelNew = reshape(utemp,bottom,DataInformation.Ly);
%
%         if debug == 1
%             figure,surf((BscanPanelNew)),shading interp
%         end
%
%         DisplayPath = [directory_name,'\Display3D\'];
%         setappdata(gcf,'DisplayPath',DisplayPath);
%
%         if exist(DisplayPath,'dir') ~= 7
%             mkdir(DisplayPath)
%         end
%         defectDicomName = [DisplayPath,Panel_X,'Cal_',strInd_X,'.dcm'];
%
%         studyid='102';
%         seriesnum=265;
%         info.StudyID=studyid;
%         info.SeriesNumber=seriesnum;
%
%         dictempcal = uint16(BscanPanelNew+DataInformation.Constant);
% %         dicomwrite(dictempcal', defectDicomName);
%         dicomwrite(dictempcal', defectDicomName,info);
%
%         wb_ind = Ind_X;
%         waitbar(wb_ind/(Lx));
%
%         kkk = 1;
%     end
%
%
%     close(h);
%
%
%     %% reset the dicom files so to display in another software
%     ori_files = dir(fullfile(DisplayPath,'\*.dcm'));
%     info=dicominfo([DisplayPath '\' ori_files(1).name]);
%
%     studyuid=info.StudyInstanceUID;
%     seriesuid=info.SeriesInstanceUID;
%
%     studyid='525';
%     seriesnum=525;
%
%     for i=1:size(ori_files(:),1)
%         if ori_files(i).isdir == 0
%           img=dicomread([DisplayPath,'\',ori_files(i).name]);
%            info=dicominfo([DisplayPath,'\',ori_files(i).name]);
%
%           info.Filename=[DisplayPath,'\',ori_files(i).name];
%           info.StudyInstanceUID=studyuid;
%           info.SeriesInstanceUID=seriesuid;
%           info.InstanceNumber=i;
%           info.SliceLocation=double(i);
%           info.ImagePositionPatient=[0 0 i];
%           info.StudyID=studyid;
%           info.SeriesNumber=seriesnum;
%           info.SliceThickness=1;
%           info.PixelSpacing=[1 1];
%           info.SpacingBetweenSlices=1;
%           dicomwrite(img,[DisplayPath,'\',ori_files(i).name],info,'CreateMode','copy');
%           vol(:,:,i)=img;
%         end
%     end
%
% end



% Find upper and lower envelopes of a given signal
% The idea is from Envelope1.1 by Lei Wang, but here it works well when the signal contains
% successive equal samples and also includes first and last samples of the signal in the envelopes.
% inputs:
%   sig: vector of input signal
%   method: method of interpolation (defined as in interp1)
% outputs:
%   upperenv: upper envelope of the input signal
%   lowerenv: lower envelope of the input signal
function [upperenv lowerenv] = envelope(sig, method)
if nargin == 1
    method = 'linear';
end
upperind = find(diff(sign(diff(sig))) < 0) + 1;
lowerind = find(diff(sign(diff(sig))) > 0) + 1;
f = 1;
l = length(sig);
try
    upperind = [f upperind l];
    lowerind = [f lowerind l];
catch
    upperind = [f; upperind; l];
    lowerind = [f; lowerind; l];
end
xi = f : l;
upperenv = interp1(upperind, sig(upperind), xi, method, 'extrap');
lowerenv = interp1(lowerind, sig(lowerind), xi, method, 'extrap');














function e_setBottom_Callback(hObject, eventdata, handles)
% hObject    handle to e_setBottom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e_setBottom as text
%        str2double(get(hObject,'String')) returns contents of e_setBottom as a double

directory_name = getappdata(gcf,'directory_name');
DataInformationFileName = [directory_name,'\DataInformation.mat'];
load(DataInformationFileName);

bottom = floor(str2double(get(hObject,'String')));
if bottom < 1 || bottom > DataInformation.Lz
    warndlg('Invalid parameter');
    return;
else
    
    clicks = 0;     % inilize the number of clicks
    zonghe = zeros(bottom,1);
    setappdata(gcf,'bottom',bottom);
    setappdata(gcf,'zonghe',zonghe);
    setappdata(gcf,'clicks',clicks);
    
    %     DataInformation.bottom = bottom;
    %     setappdata(gcf,'gate_sta',gate_sta);
    %     save(DataInformationFileName,'DataInformation');
end


% --- Executes during object creation, after setting all properties.
function e_setBottom_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e_setBottom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_add2trainningset.
function btn_add2trainningset_Callback(hObject, eventdata, handles)
% hObject    handle to btn_add2trainningset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Adata = getappdata(gcf,'Adata');
if isempty(Adata)
    warndlg('Can not obtain the A-scan signal!, ensure that there are B-scan DICOM files.');
    return;
end
% Adata = flipud(Adata);

zonghe = getappdata(gcf,'zonghe');
bottom = getappdata(gcf,'bottom');
clicks = getappdata(gcf,'clicks');
if isempty(zonghe) || isempty(bottom) || isempty(clicks)
    warndlg('Set the signal bottom first!');
    return;
end

zonghe = zonghe + Adata(1:bottom,1);
clicks = clicks + 1;

setappdata(gcf,'zonghe',zonghe);
setappdata(gcf,'clicks',clicks);


kkk = 1;

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directory_name = getappdata(gcf,'directory_name');
TrainningDataName = [directory_name,'\TrainningData.mat'];
bottom = getappdata(gcf,'bottom');
zonghe = getappdata(gcf,'zonghe');
clicks = getappdata(gcf,'clicks');
if isempty(bottom) || isempty(zonghe) || isempty(clicks)
    warndlg('Please select the training point first!');
    return;
else
    save(TrainningDataName, 'bottom', 'zonghe', 'clicks');
end


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

directory_name = getappdata(gcf,'directory_name');
TrainningDataName = [directory_name,'\TrainningData.mat'];
load(TrainningDataName);
if exist('bottom','var')&&exist('zonghe','var')&&exist('clicks','var')
    setappdata(gcf, 'bottom', bottom);
    setappdata(gcf, 'zonghe', zonghe);
    setappdata(gcf, 'clicks', clicks);
else
    warndlg('Can not load the training set!');
end


% --- Executes during object creation, after setting all properties.
function panel_defectsDetection_CreateFcn(hObject, eventdata, handles)
% hObject    handle to panel_defectsDetection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called





function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double
directory_name = getappdata(gcf,'directory_name');
ThresholdName = [directory_name,'\Threshold.mat'];

threshold = floor(str2double(get(hObject,'String')));

if threshold > 5000
    warndlg('Maybe the threshold is too large, the default threshold is 2000');
end

save(ThresholdName, 'threshold');





% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% % --- Executes on button press in c_display.
% function c_display_Callback(hObject, eventdata, handles)
% % hObject    handle to c_display (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
%
% % Hint: get(hObject,'Value') returns toggle state of c_display
% temp = get(hObject,'Value');
%
% if temp
%     set(findobj('tag','c_gate'),'value',1.0);
%     setappdata(gcf,'DisplayDefect',1);
% else
%     set(findobj('tag','c_gate'),'value',0.0);
%     setappdata(gcf,'DisplayDefect',0);
% end




% --- Executes on button press in btn_DisplayDefects.
function btn_DisplayDefects_Callback(hObject, eventdata, handles)
% hObject    handle to btn_DisplayDefects (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

DisplayPath = getappdata(gcf,'DisplayPath');



kkk = 1;



% --- Executes during object creation, after setting all properties.
function btn_detectDefects_CreateFcn(hObject, eventdata, handles)
% hObject    handle to btn_detectDefects (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function pushbutton14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called




% --------------------------------------------------------------------
function M_V_ShowCorrelationOfBScan_Callback(hObject, eventdata, handles)
% hObject    handle to M_V_ShowCorrelationOfBScan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

directory_name = getappdata(gcf,'directory_name');
DataInformationFileName = [directory_name,'\','DataInformation.mat'];
load(DataInformationFileName);

len = inputdlg('input the length of signals:');
if ~isempty(len)
    BScan = DataInformation.BscanPanel;
    
    figure,imshow(mat2gray(BScan(1:str2num(len{1}),:)))
    ccc = corr(BScan);
    figure,surf(ccc);shading flat;
end
kkk = 1;




function e_zSize_Callback(hObject, eventdata, handles)
% hObject    handle to e_zSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e_zSize as text
%        str2double(get(hObject,'String')) returns contents of e_zSize as a double

directory_name = getappdata(gcf,'directory_name');
DataInformationFileName = [directory_name,'\','DataInformation.mat'];
load(DataInformationFileName);

layer = str2double(get(hObject,'String'));
Adata = getappdata(gcf,'Adata');
h = 4;
display_signal = Adata - DataInformation.Constant;

h4 = getappdata(gcf,'h4');
axes(h4);            % show the original image on the left panel
%     Adata = Adata';
Adata = flipud(display_signal(1:layer));
mind = abs(min(Adata));
temp = 1:layer;
%     plot(abs(Adata),temp,'y','linewidth',1);
plot(Adata,temp,'y','linewidth',1);
axis([-mind mind 0 layer]);
set(h4,'Color','k');
kkk = 1;







% --- Executes during object creation, after setting all properties.
function e_zSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e_zSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
% display 3d defect
function M_T_DofCscan_Callback(hObject, eventdata, handles)
% hObject    handle to M_T_DofCscan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

directory_name = getappdata(gcf,'directory_name');
DataInformationFileName = [directory_name,'\','DataInformation.mat'];
load(DataInformationFileName);
DataInformation.calibrationFlag = 1;

% check the dicom file
dicomFlag = Priv_CheckDicomFiles(DataInformation);

%% ROI = Priv_computeROI();

c1 = 11;
c2 = 172;
r1 = 6;
r2 = 131;
v = 135;

%% setup parameters
% E:\NewDataBase\GE_DataBase\28\28
if strcmp(directory_name, 'E:\NewDataBase\GE_DataBase\28\28')
    c1 = 1;
    c2 = 208;
    r1 = 1;
    r2 = 48;
    v = 125;
end

% E:\NewDataBase\GE_DataBase\55
if strcmp(directory_name, 'E:\NewDataBase\GE_DataBase\55')
    c1 = 1;
    c2 = 256;
    r1 = 1;
    r2 = 48;
    v = 125;
end

% E:\NewDataBase\GE_DataBase\2009_10_28_USC\kal3_2010_02_26\KAL 3.5 re
if strcmp(directory_name, 'E:\NewDataBase\GE_DataBase\2009_10_28_USC\kal3_2010_02_26\KAL 3.5 re')
    c1 = 5;
    c2 = 105;
    r1 = 21;
    r2 = 172;
    v = 200;
end

% E:\NewDataBase\GE_DataBase\2009_10_28_USC\kal 1
if strcmp(directory_name, 'E:\NewDataBase\GE_DataBase\2009_10_28_USC\kal 1')
    c1 = 10;
    c2 = 172;
    r1 = 4;
    r2 = 134;
    v = 120;
end


% E:\NewDataBase\GE_DataBase\2009_10_28_USC\kal 2
if strcmp(directory_name, 'E:\NewDataBase\GE_DataBase\2009_10_28_USC\kal 2')
    c1 = 10;
    c2 = 172;
    r1 = 11;
    r2 = 44;
    v = 110;
end




% E:\NewDataBase\GE_DataBase\kal 3.5\KAL 3.5_NewData
if strcmp(directory_name, 'E:\NewDataBase\GE_DataBase\kal 3.5\KAL 3.5_NewData')
    c1 = 4;
    c2 = 106;
    r1 = 20;
    r2 = 171;
    v = 210;
end


% E:\NewDataBase\GE_DataBase\New_data_2010_05_13\KAL 3.5 re
if strcmp(directory_name, 'E:\NewDataBase\GE_DataBase\New_data_2010_05_13\KAL 3.5 re')
    c1 = 4;
    c2 = 106;
    r1 = 20;
    r2 = 171;
    v = 210;
end







% E:\NewDataBase\GE_DataBase\2009_10_28_USC\kal 1
if strcmp(directory_name, 'E:\NewDataBase\GE_DataBase\2009_10_28_USC\kal 1')
    c1 = 11;
    c2 = 172;
    r1 = 6;
    r2 = 131;
    v = 135;
end


% E:\NewDataBase\GE_DataBase\kal 3 renew
if strcmp(directory_name, 'E:\NewDataBase\GE_DataBase\kal 3 renew')
    c1 = 1;
    c2 = 276;
    r1 = 10;
    r2 = 336;
    v = 80;
end





% hand = figure(2);
if dicomFlag == 1 || dicomFlag == 4 || dicomFlag == 5 || dicomFlag == 7
    CBS = 1;    % display CscanPanel;
    Ind_Y = -1;
    
    
    vib = zeros(v,4);
    
    for Ind_X = 1:v
        [scanPanel1,scanPanel2] = Priv_Current_Layer_dcm(CBS, Ind_X, Ind_Y, DataInformation);
        
        
        %
        CscanPanel = scanPanel1(r1:r2,c1:c2);
        %         CscanPanel = scanPanel1;
        %         imshow(mat2gray(CscanPanel),hand);
        vib(Ind_X,1) = trimmean(CscanPanel(:),20);
        vib(Ind_X,2) = mean(CscanPanel(:));
        vib(Ind_X,3) = std(CscanPanel(:));
        
        kkk = 1;
        
    end
    vstd = max(vib(:,3));
    %     plot(vib(:,1));hold on;plot(vib(:,2),'r')
    %
    %     t = 1:v;
    %     y = vib(:,1);
    %     ind=find(diff(sign(diff(y)))==+2)+1;
    %     val=interp1(t(ind),y(ind),t,'linear');
    %     plot(t,val,'r')
    %     kkk = 1;
    
    debug = 0;
    
    zonghe = vib(:,1);
    bottom = length(zonghe);
    directory_name = getappdata(gcf,'directory_name');
    
    if isempty(directory_name)
        warndlg('You work improperly now, please open any working directory first!');
        return;
    end
    
    DataInformationFileName = [directory_name,'\','DataInformation.mat'];
    if exist(DataInformationFileName,'file');
        load(DataInformationFileName);
    else
        warndlg('You may lost the "DataInformation.mat", re-click the "Open Voxel Files" in File-menu');
        return;
    end
    
    % Update the check button states
    DataInformation.calibrationFlag = get(findobj('tag','checkbox_cal'),'Value');
    DataInformation.Relative = 1 - get(findobj('tag','C_SDM'),'Value');                 % if this is 1, show the relative image, otherwise, show abstract image
    DataInformation.directory_name = directory_name;
    
    %==========================================================================
    ThresholdName = [directory_name,'\Threshold.mat'];
    if exist(ThresholdName,'file')
        load(ThresholdName);
    else
        threshold = 300;
    end
    threshold = vstd;
    %     temp = bottom*DataInformation.Ly;
    %==========================================================================
    
    
    save(DataInformationFileName, 'DataInformation');
    
    setappdata(gcf,'directory_name',directory_name);
    set(findobj('tag','figure1'),'name',directory_name);
    
    if directory_name           % do if folder is opened correctly
        
        % decide if this folder contains all the DICOM files needed
        % for normal DICOM and calibrated DICOM files
        % if there are all type DICOM files, then display C B Sscans,
        % otherwise, if there are only Cscans then display them.
        
        %==========================
        % dicomFlag = 1      % only C-scan files
        % dicomFlag = 2      % only B-scan files
        % dicomFlag = 3      % only S-scan files
        % dicomFlag = 4      % only C-scan and B-scan files
        % dicomFlag = 5      % only C-scan and S-scan files
        % dicomFlag = 6      % only B-scan and S-scan files
        % dicomFlag = 7      % all scan files
        %==========================
        DicomType = Priv_CheckDicomFiles(DataInformation);
        
        % if DicomType is 7 so you can do the defects detection
        
        if DicomType ~= 7
            warndlg('To do the defect detection, please create the C- and B-scan DICOM files first');
            return;
        end
        
        zonghe = zonghe - DataInformation.Constant;
        if isempty(zonghe)
            warndlg('Select the trainning data or load the trainning data first');
            return;
        end
        if sum(isnan(zonghe))
            warndlg('Load the trainning data first!');
            return;
        end
        
        % compute the model only based on two points
        y1 = abs(min(zonghe));
        y2 = max(zonghe);
        if y2 <= 0
            warndlg('Error in modeling, check the input signal');
            return;
        end
        
        x1 = 1;
        x2t = find(zonghe == y2);    % should check the y2
        x2 = x2t(1,1);
        
        %         if y2/y1 < 0.6
        %             y2 = min(zonghe(x2:end));
        %             x2t = find(zonghe == y2);
        %             x2 = x2t(1,1);
        %             y2 = abs(y2);
        %         end
        tao = (x2 - x1)/reallog(y1/y2);
        k = y1/exp(-1/tao);
        funL = -k * exp(-[1:bottom]'/tao) - 2.1*threshold;
        %         funU = -funL + threshold;
        funU = -funL;
        
        if debug == 1
            figure,plot(zonghe);hold on;
            plot(funL,'k');
            plot(funU,'m');
            hold off;
        end
        
        vectorT = [1:bottom]';
        yU = [funU(:,ones(1,DataInformation.Ly))];
        yL = [funL(:,ones(1,DataInformation.Ly))];
        
        kkk = 1;
        
        % from here, we start do the defect detection.
        dicomPathCal = DataInformation.dicomPathCal;
        Lx = DataInformation.Lx;
        
        h = waitbar(0,'Detecting defects and saving results to DICOM');
        wb_ind = 1;
        
        %@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
        %     % make the low-pass filter. 用来生成高斯滤波器
        %     gradientsigma = 1;
        %     sze = fix(6*gradientsigma);   if ~mod(sze,2); sze = sze+1; end
        %     f = fspecial('gaussian', sze, gradientsigma); % Generate Gaussian filter.
        %@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
        
        Cscan = zeros(DataInformation.Lx,DataInformation.Ly);
        topInd = zeros(DataInformation.Lx,DataInformation.Ly);
        
        for Ind_X = 1:Lx;     %============================================
            strInd_X = num2str(Ind_X);
            if (Ind_X<10)
                strInd_X = ['000',strInd_X]; %#ok<*AGROW>
            elseif(Ind_X < 100)
                strInd_X = ['00',strInd_X];
            elseif(Ind_X < 1000)
                strInd_X = ['0',strInd_X];
            else
                strInd_X =strInd_X; %#ok<ASGSL>
            end
            
            % load the B-scan DICOM files and subtract the model
            Panel_X = 'Bscan_';
            FileNameX = [dicomPathCal,'\',Panel_X,'Cal_',strInd_X,'.dcm'];
            BscanPanel = double(dicomread(FileNameX));
            BscanPanel = BscanPanel - DataInformation.Constant;
            
            % create a new blank image;
            BscanPanelNew = zeros(size(yU));    % z * y
            
            debugc = 1;
            
            % test code for correlation of Ascans;
            [cr,cc] = size(BscanPanel(1:bottom,:));
            if debugc == 0
                for ii = 1:cc-1
                    for jj = ii+1:cc
                        xianggt = corrcoef(BscanPanel(1:bottom,ii),BscanPanel(1:bottom,jj));
                        xiangg(ii,jj) = abs(xianggt(1,2));
                        kkk = 1;
                    end
                end
            end
            
            BscanTemp = abs(BscanPanel(1:bottom,:));
            indTemp = find(BscanTemp > yU);
            BscanPanelNew(indTemp) = BscanTemp(indTemp);
            
            BscanPanelNew_bin = zeros(size(BscanPanelNew));
            BscanPanelNew_bin(find(BscanPanelNew>10)) = 5000;   %???
            BscanPanelNew = BscanPanelNew_bin;
            
            % 在这里抹掉除第一层（z坐标）之外的所有东西
            for col_t = 1:DataInformation.Ly
                itemp = find(BscanPanelNew(:,col_t)>0);
                if ~isempty(itemp)
                    BscanPanelNew(itemp(1,1)+1:end,col_t) = 0;
                    topInd(Ind_X,col_t) = itemp(1,1);
                end
            end
            
            [Index_Z,Index_Y] = find(BscanPanelNew > 0);
            %             zuobiao3D =
            
            Cscan(Ind_X,:) = sum(BscanPanelNew);
            
            clear BscanPanelNew_bin;
            
            % BscanPanelNew = filter2(f, BscanPanelNew); % Gradient of the image in x
            
            if Ind_X == 30
                kkk = 1;
            end
            
            %=====================================
            %         BscanPanelNewReshape = Priv_reshape(DataInformation,BscanPanelNew);
            %         BscanPanelNew = BscanPanelNewReshape;
            %=====================================
            
            if debug == 1
                figure,surf((BscanPanelNew)),shading interp
            end
            
            DisplayPath = [directory_name,'\Display3D\'];
            setappdata(gcf,'DisplayPath',DisplayPath);
            
            if exist(DisplayPath,'dir') ~= 7
                mkdir(DisplayPath)
            end
            defectDicomName = [DisplayPath,Panel_X,'Cal_',strInd_X,'.dcm'];
            
            studyid='102';
            seriesnum=265;
            info.StudyID=studyid;
            info.SeriesNumber=seriesnum;
            
            dictempcal = uint16(BscanPanelNew+DataInformation.Constant);
            %         dicomwrite(dictempcal', defectDicomName);
            dicomwrite(dictempcal', defectDicomName,info);
            
            wb_ind = Ind_X;
            waitbar(wb_ind/(Lx));
            
            kkk = 1;
        end
        
        
        close(h);
        
        %% topInd 里面保存的是除去了后续波动的defect的表面位置，是不平的，这里根据Cscan的记录找到相应的块，取平均值
        [Cscan_L, num] = bwlabel(Cscan);
        if num > 0
            for L_r_ind = 1:num
                label_tempInd = find(Cscan_L == L_r_ind);
                topInd(label_tempInd) = floor(mean(topInd(label_tempInd)));
            end
        end
        
        %% reset the dicom files so to display in another software
        ori_files = dir(fullfile(DisplayPath,'\*.dcm'));
        info=dicominfo([DisplayPath '\' ori_files(1).name]);
        
        studyuid=info.StudyInstanceUID;
        seriesuid=info.SeriesInstanceUID;
        
        studyid='525';
        seriesnum=525;
        
        for i=1:size(ori_files(:),1)
            if ori_files(i).isdir == 0
                img=dicomread([DisplayPath,'\',ori_files(i).name]);
                img_k = zeros(size(img));
                
                info=dicominfo([DisplayPath,'\',ori_files(i).name]);
                info.Filename=[DisplayPath,'\',ori_files(i).name];
                info.StudyInstanceUID=studyuid;
                info.SeriesInstanceUID=seriesuid;
                info.InstanceNumber=i;
                info.SliceLocation=double(i);
                info.ImagePositionPatient=[0 0 i];
                info.StudyID=studyid;
                info.SeriesNumber=seriesnum;
                info.SliceThickness=1;
                info.PixelSpacing=[1 1];
                info.SpacingBetweenSlices=1;
                
                topvalue = find(topInd(i,:) > 0);
                if ~isempty(topvalue)
                    for ind_temp = 1:length(topvalue)
                        img_k(topvalue(ind_temp), topInd(i,topvalue(ind_temp))) = ...
                            DataInformation.MaxData;
                        %DataInformation.Constant + DataInformation.Constant;
                    end
                    
                    kkk = 1;
                end
                img = img_k;
                
                %===========================
                % fill the boundary
                img = img';
                if i == 1
                    img(10,:) = DataInformation.MaxData;
                    img(bottom,:) = DataInformation.MaxData;
                    img(:,10) = DataInformation.MaxData;
                    img(:,DataInformation.Ly) = DataInformation.MaxData;
                end
                
                if i == 1 || i == Lx
                    img(1,:) = DataInformation.MaxData;
                    img(bottom,:) = DataInformation.MaxData;
                    img(:,1) = DataInformation.MaxData;
                    img(:,DataInformation.Ly) = DataInformation.MaxData;
                else
                    img(1,1) = DataInformation.MaxData;
                    img(1,DataInformation.Ly) = DataInformation.MaxData;
                    img(bottom,1) = DataInformation.MaxData;
                    img(bottom,DataInformation.Ly) = DataInformation.MaxData;
                end
                img = img';
                %===========================
                
                dicomwrite(img,[DisplayPath,'\',ori_files(i).name],info,'CreateMode','copy');
                % vol(:,:,i)=img;
            end
        end
        
        clc
        dos('C:\Program Files\CVLab\SetupMipDemo\MipDemo.exe');
    end
    
    
    
end

%% function: ROI = Priv_computeROI()
% used to compute the region of interest
function ROI = Priv_computeROI()

dim1 = [];
dim2 = [];

directory_name = getappdata(gcf,'directory_name');

if isempty(directory_name)
    warndlg('You work improperly now, please open any working directory first!');
    return;
end

DataInformationFileName = [directory_name,'\','DataInformation.mat'];
if exist(DataInformationFileName,'file');
    load(DataInformationFileName);
else
    warndlg('You may lost the "DataInformation.mat", re-click the "Open Voxel Files" in File-menu');
    return;
end

Lx = DataInformation.Lx;
Ly = DataInformation.Ly;
Lz = DataInformation.Lz;

dimx = zeros(Lx,1);
dimy = zeros(Ly,1);
dimz = zeros(Lz,1);

if directory_name           % do if folder is opened correctly
    
    % decide if this folder contains all the DICOM files needed
    % for normal DICOM and calibrated DICOM files
    % if there are all type DICOM files, then display C B Sscans,
    % otherwise, if there are only Cscans then display them.
    
    %==========================
    % dicomFlag = 1      % only C-scan files
    % dicomFlag = 2      % only B-scan files
    % dicomFlag = 3      % only S-scan files
    % dicomFlag = 4      % only C-scan and B-scan files
    % dicomFlag = 5      % only C-scan and S-scan files
    % dicomFlag = 6      % only B-scan and S-scan files
    % dicomFlag = 7      % all scan files
    %==========================
    DicomType = Priv_CheckDicomFiles(DataInformation);
    
    % if DicomType is 7 so you can do the defects detection
    
    if DicomType ~= 7
        warndlg('To do the defect detection, please create the C- and B-scan DICOM files first');
        return;
    end
    
    Cscan = zeros(DataInformation.Lx,DataInformation.Ly);
    topInd = zeros(DataInformation.Lx,DataInformation.Ly);
    
    dicomPathCal = DataInformation.dicomPathCal;
    
    
    for Ind_X = 1:Lx;     %==============================================
        strInd_X = num2str(Ind_X);
        if (Ind_X<10)
            strInd_X = ['000',strInd_X]; %#ok<*AGROW>
        elseif(Ind_X < 100)
            strInd_X = ['00',strInd_X];
        elseif(Ind_X < 1000)
            strInd_X = ['0',strInd_X];
        else
            strInd_X =strInd_X; %#ok<ASGSL>
        end
        
        % load the B-scan DICOM files and subtract the model
        Panel_X = 'Bscan_';
        FileNameX = [dicomPathCal,'\',Panel_X,'Cal_',strInd_X,'.dcm'];
        BscanPanel = double(dicomread(FileNameX));
        
        dimy = dimy + sum(abs(BscanPanel),1)';
        dimz = dimz + sum(abs(BscanPanel),2);
        
        
    end
end

ROI = 1;








% --------------------------------------------------------------------
function M_T_showIn3D_Callback(hObject, eventdata, handles)
% hObject    handle to M_T_showIn3D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

directory_name = getappdata(gcf,'directory_name');
DataInformationFileName = [directory_name,'\','DataInformation.mat'];
load(DataInformationFileName);
DataInformation.calibrationFlag = 1;

% check the dicom file
dicomFlag = Priv_CheckDicomFiles(DataInformation);

[c1,c2,r1,r2,v] = Rriv_getROI(directory_name);

% if there are Bscans, then continue
if dicomFlag == 1 || dicomFlag == 4 || dicomFlag == 5 || dicomFlag == 7
    CBS = 1;    % display CscanPanel;
    Ind_Y = -1;
    
    vib = zeros(v,3);
    
    % 求每一个Cscan的平均值
    for Ind_X = 1:v
        [scanPanel1,scanPanel2] = Priv_Current_Layer_dcm(CBS, Ind_X, Ind_Y, DataInformation);
        CscanPanel = scanPanel1(r1:r2,c1:c2);   % 取有效区域
        vib(Ind_X,1) = trimmean(CscanPanel(:),20); % - DataInformation.Constant;
        vib(Ind_X,2) = mean(CscanPanel(:)); % - DataInformation.Constant;
        vib(Ind_X,3) = std(CscanPanel(:));
    end
    
    % 论文用图打印
%     figure,plot((vib(1:120,1)),'Linewidth',2,'color','k')
%     hold on;errorbar(vib(1:120,1),vib(1:120,3),'xr')
%     plot(vib(1:120,3),'Linewidth',2,'color','r')
    
    vstd = max(vib(:,3));
    %     plot(vib(:,1));hold on;plot(vib(:,2),'r')
    %
    %     t = 1:v;
    %     y = vib(:,1);
    %     ind=find(diff(sign(diff(y)))==+2)+1;
    %     val=interp1(t(ind),y(ind),t,'linear');
    %     plot(t,val,'r')
    %     kkk = 1;
    
    debug = 0;
    
    zonghe = vib(:,1);
    
    if isempty(zonghe)
        warndlg('Select the trainning data or load the trainning data first');
        return;
    end
    
    bottom = length(zonghe);

    %==========================================================================
    threshold = vstd;
    %==========================================================================

    if directory_name           % do if folder is opened correctly
        
        % decide if this folder contains all the DICOM files needed
        % for normal DICOM and calibrated DICOM files
        % if there are all type DICOM files, then display C B Sscans,
        % otherwise, if there are only Cscans then display them.
        
        %==========================
        % dicomFlag = 1      % only C-scan files
        % dicomFlag = 2      % only B-scan files
        % dicomFlag = 3      % only S-scan files
        % dicomFlag = 4      % only C-scan and B-scan files
        % dicomFlag = 5      % only C-scan and S-scan files
        % dicomFlag = 6      % only B-scan and S-scan files
        % dicomFlag = 7      % all scan files
        %==========================
        DicomType = Priv_CheckDicomFiles(DataInformation);
        
        % if DicomType is 7 so you can do the defects detection
        
        if DicomType ~= 7
            warndlg('To do the defect detection, please create the C- and B-scan DICOM files first');
            return;
        end
        
        zonghe = zonghe - DataInformation.Constant;

        %==================================================================
        % compute the model only based on two points
        y1 = abs(min(zonghe));
        y2 = max(zonghe);
        if y2 <= 0
            warndlg('Error in modeling, check the input signal');
            return;
        end
        
        x1 = 1;
        x2t = find(zonghe == y2);    % should check the y2
        x2 = x2t(1,1);
        
        %         if y2/y1 < 0.6
        %             y2 = min(zonghe(x2:end));
        %             x2t = find(zonghe == y2);
        %             x2 = x2t(1,1);
        %             y2 = abs(y2);
        %         end
        tao = (x2 - x1)/reallog(y1/y2);
        k = y1/exp(-1/tao);
        funL = -k * exp(-[1:bottom]'/tao) - 2*threshold;
        %         funU = -funL + threshold;
        funU = -funL;
        
        if debug == 1
            figure,plot(zonghe);hold on;
            plot(funL,'k');
            plot(funU,'m');
            hold off;
        end
        
        vectorT = [1:bottom]';
        yU = [funU(:,ones(1,DataInformation.Ly))];
        yL = [funL(:,ones(1,DataInformation.Ly))];
        
        %==================================================================
        % The end of computing the model only based on two points
        
        kkk = 1;
        
        % from here, we start do the defect detection.
        dicomPathCal = DataInformation.dicomPathCal;
        Lx = DataInformation.Lx;
        
        h = waitbar(0,'Detecting defects and saving results to DICOM');
        wb_ind = 1;
        
        %@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
        %     % make the low-pass filter. 用来生成高斯滤波器
        %     gradientsigma = 1;
        %     sze = fix(6*gradientsigma);   if ~mod(sze,2); sze = sze+1; end
        %     f = fspecial('gaussian', sze, gradientsigma); % Generate Gaussian filter.
        %@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
        
        Cscan = zeros(DataInformation.Lx,DataInformation.Ly);
        topInd = zeros(DataInformation.Lx,DataInformation.Ly);
        
        % 这两个参数是用来保存三维坐标点的
        flag = 0;
        zuobiao3D = [];
        zb_Ind = 1;
        
        for Ind_X = 1:Lx;     %============================================
            strInd_X = num2str(Ind_X);
            if (Ind_X<10)
                strInd_X = ['000',strInd_X]; %#ok<*AGROW>
            elseif(Ind_X < 100)
                strInd_X = ['00',strInd_X];
            elseif(Ind_X < 1000)
                strInd_X = ['0',strInd_X];
            else
                strInd_X =strInd_X; %#ok<ASGSL>
            end
            
            % load the B-scan DICOM files and subtract the model
            Panel_X = 'Bscan_';
            FileNameX = [dicomPathCal,'\',Panel_X,'Cal_',strInd_X,'.dcm'];
            BscanPanel = double(dicomread(FileNameX));
            BscanPanel = BscanPanel - DataInformation.Constant;
            
            % 论文用图打印：第一张，第30张
%             figure,plot(BscanPanel(1:120,:));grid
%             hold on;
%             plot(funU(1:120)-1.8*threshold, 'linewidth',3)
%             plot(-(funU(1:120)-1.8*threshold), 'linewidth',3)

%             figure,surf(flipud(BscanPanel)/100);shading interp
%             axis equal
            
            % create a new blank image;
            BscanPanelNew = zeros(size(yU));    % z * y
            
            debugc = 1;
            
            % test code for correlation of Ascans;
            [cr,cc] = size(BscanPanel(1:bottom,:));
            if debugc == 0
                for ii = 1:cc-1
                    for jj = ii+1:cc
                        xianggt = corrcoef(BscanPanel(1:bottom,ii),BscanPanel(1:bottom,jj));
                        xiangg(ii,jj) = abs(xianggt(1,2));
                        kkk = 1;
                    end
                end
            end
            
            BscanTemp = abs(BscanPanel(1:bottom,:));
            indTemp = find(BscanTemp > yU);
            BscanPanelNew(indTemp) = BscanTemp(indTemp);
            
            BscanPanelNew_bin = zeros(size(BscanPanelNew));
            BscanPanelNew_bin(find(BscanPanelNew>10)) = 5000;   %???
            BscanPanelNew = BscanPanelNew_bin;
            
            % 在这里抹掉除第一层（z坐标）之外的所有东西
            for col_t = 1:DataInformation.Ly
                itemp = find(BscanPanelNew(:,col_t)>0);
                if ~isempty(itemp)
                    BscanPanelNew(itemp(1,1)+1:end,col_t) = 0;
                    topInd(Ind_X,col_t) = itemp(1,1);
                    flag = 1;   % 表明这是第一次
                end
            end
            
            if flag > 0
                [Index_Z,Index_Y] = find(BscanPanelNew > 0);
                xyzLen = length(Index_Z);
                for zb_Indt = 1:xyzLen
                    zuobiao3D(zb_Ind,1) = Ind_X;
                    zuobiao3D(zb_Ind,2) = Index_Y(zb_Indt,1);
                    zuobiao3D(zb_Ind,3) = Index_Z(zb_Indt,1);
                    zb_Ind = zb_Ind + 1;
                end
            end
            flag = 0;
            
            Cscan(Ind_X,:) = sum(BscanPanelNew);
            
            clear BscanPanelNew_bin;
            
            % BscanPanelNew = filter2(f, BscanPanelNew); % Gradient of the image in x

            %=====================================
            %         BscanPanelNewReshape = Priv_reshape(DataInformation,BscanPanelNew);
            %         BscanPanelNew = BscanPanelNewReshape;
            %=====================================
            
            if debug == 1
                figure,surf((BscanPanelNew)),shading interp
            end
            
            DisplayPath = [directory_name,'\Display3D\'];
            setappdata(gcf,'DisplayPath',DisplayPath);
            
            if exist(DisplayPath,'dir') ~= 7
                mkdir(DisplayPath)
            end
            defectDicomName = [DisplayPath,Panel_X,'Cal_',strInd_X,'.dcm'];
            
            studyid='102';
            seriesnum=265;
            info.StudyID=studyid;
            info.SeriesNumber=seriesnum;
            
            dictempcal = uint16(BscanPanelNew+DataInformation.Constant);
            %         dicomwrite(dictempcal', defectDicomName);
            dicomwrite(dictempcal', defectDicomName,info);
            
            wb_ind = Ind_X;
            waitbar(wb_ind/(Lx));
            
            kkk = 1;
        end
        
        
        close(h);
        
        %% topInd 里面保存的是除去了后续波动的defect的表面位置，是不平的，
        %% 这里根据Cscan的记录找到相应的块，取平均值
        [Cscan_L, num] = bwlabel(Cscan);
        if num > 0
            for L_r_ind = 1:num
                label_tempInd = find(Cscan_L == L_r_ind);
                topInd(label_tempInd) = floor(trimmean(topInd(label_tempInd),30));
            end
        end
        
        % 从平滑的topInd中重新找到defect的位置坐标：
        
        topIndnew = flipud(topInd);
        [tpR,tpC] = find(topIndnew > 0);
        newzb3D(:,1) = tpR;
        newzb3D(:,2) = tpC;
        for iii = 1:length(tpR)
            newzb3D(iii,3) = v - topIndnew(tpR(iii),tpC(iii));
        end
        
        xr = DataInformation.Lx;
        yr = DataInformation.Ly;
        zr = v;
        display3D(xr,yr,zr, newzb3D);
        
        kkk = 1;
        
    end
    
    
    
end





function display3D(xr,yr,zr, zuobiao3Dinput)
% xr = 48;
% yr = 208;
% zr = 135;
temp = yr;
yr = xr;
xr = temp;
zuobiao3D(:,1) = zuobiao3Dinput(:,2);
zuobiao3D(:,2) = zuobiao3Dinput(:,1);
zuobiao3D(:,3) = zuobiao3Dinput(:,3);

figure;
hold on;
%% 画主对象
x = [1,xr;1,xr;1,xr;1,xr;1,xr;];
y = [1,1;1,1;yr,yr;yr,yr;1,1;];
z = [1,1;zr,zr;zr,zr;1,1;1,1;];
x1 = [1,1;1,1];
y1 = [1,yr;1,yr;];
z1 = [1,1;zr,zr;];
x2 = [xr,xr;xr,xr;];
y2 = [1,yr;1,yr;];
z2 = [1,1;zr,zr;];

h2 = surf (x,y,z); shading interp
set(h2, 'FaceAlpha',0.5);
set(h2, 'EdgeAlpha',0);
set(h2, 'FaceColor',[1 1 0]);

h2 = surf (x1,y1,z1); shading interp
set(h2, 'FaceAlpha',0.5);
set(h2, 'EdgeAlpha',0);
set(h2, 'FaceColor',[1 1 0]);

h2 = surf (x2,y2,z2); shading interp
set(h2, 'FaceAlpha',0.5);
set(h2, 'EdgeAlpha',0);
set(h2, 'FaceColor',[1 1 0]);


% [x,y,z] = getObject(xr,yr,zr);
% h2 = surf (x,y,z); axis equal
% set(h2, 'FaceAlpha',0.5);
% set(h2, 'EdgeAlpha',0.5);
% set(h2, 'FaceColor',[0.1 0.1 0.1]);
grid


[x,y,z] = getElementObject();
% load Data3DDisplay.mat;
[rows,cols] = size(zuobiao3D);

tic;
for i = 1:rows
    xzb = zuobiao3D(i,1);
    yzb = zuobiao3D(i,2);
    zzb = zuobiao3D(i,3);
    
    colorT = zzb/zr;
    
    h2 = surf (x + xzb,y + yzb,z + zzb); shading interp
    set(h2, 'FaceAlpha',1);
    set(h2, 'EdgeAlpha',0);
    set(h2, 'FaceColor',[0.5 colorT colorT]);
end
toc;

axis equal
axis([1 xr 1 yr 1 zr]);
grid;

shading flat;
light('Position',[-80,-262,-200],'style','infinite'); %利用light( )函数为图像设置光照效果
light('Position',[500,5000,4500],'style','infinite'); light('Position',[5000,100,300],'style','infinite');

hold off;


kkk = 1;



function [x,y,z] = getElementObject()

x = [-0.5,-0.5,-0.5,-0.5,-0.5;...
    0.5, 0.5, 0.5, 0.5, 0.5;...
    0.5, 0.5, 0.5, 0.5, 0.5;...
    -0.5,-0.5,-0.5,-0.5,-0.5;...
    -0.5,-0.5,-0.5,-0.5,-0.5;];
y = [-0.5,-0.5,-0.5,-0.5,-0.5;
    -0.5,-0.5,-0.5,-0.5,-0.5;
    0.5, 0.5,-0.5,-0.5, 0.5;
    0.5, 0.5,-0.5,-0.5, 0.5;
    -0.5,-0.5,-0.5,-0.5,-0.5;];
z = [-0.5,-0.5,-0.5,-0.5,-0.5;
    -0.5,-0.5,-0.5,-0.5,-0.5;
    -0.5, 0.5, 0.5,-0.5,-0.5;
    -0.5, 0.5, 0.5,-0.5,-0.5;
    -0.5,-0.5,-0.5,-0.5,-0.5;];

function [x,y,z] = getObject(xr,yr,zr)

x = [0,	0,	0,	0,	0;
    1,	1,	1,	1,	1;
    1,	1,	1,	1,	1;
    0,	0,	0,	0,	0;
    0,	0,	0,	0,	0;];

y = [0,	0,	0,	0,	0;
    0,	0,	0,	0,	0;
    1,	1,	0,	0,	1;
    1,	1,	0,	0,	1;
    0,	0,	0,	0,	0;];

z = [0,	0,	0,	0,	0;
    0,	0,	0,	0,	0;
    0,	1,	1,	0,	0;
    0,	1,	1,	0,	0;
    0,	0,	0,	0,	0;];

x = x * xr;
y = y * yr;
z = z * zr;


%% return the ROI
function [c1,c2,r1,r2,v] = Rriv_getROI(directory_name)
c1 = 11;
c2 = 172;
r1 = 6;
r2 = 131;
v = 135;

%% setup parameters
% E:\NewDataBase\GE_DataBase\28\28
if strcmp(directory_name, 'E:\NewDataBase\GE_DataBase\28\28')
    c1 = 1;
    c2 = 208;
    r1 = 1;
    r2 = 48;
    v = 125;
end

% E:\NewDataBase\GE_DataBase\55
if strcmp(directory_name, 'E:\NewDataBase\GE_DataBase\55')
    c1 = 1;
    c2 = 256;
    r1 = 1;
    r2 = 48;
    v = 125;
end

% E:\NewDataBase\GE_DataBase\2009_10_28_USC\kal3_2010_02_26\KAL 3.5 re
if strcmp(directory_name, 'E:\NewDataBase\GE_DataBase\2009_10_28_USC\kal3_2010_02_26\KAL 3.5 re')
    c1 = 5;
    c2 = 105;
    r1 = 21;
    r2 = 172;
    v = 200;
end

% E:\NewDataBase\GE_DataBase\2009_10_28_USC\kal 1
if strcmp(directory_name, 'E:\NewDataBase\GE_DataBase\2009_10_28_USC\kal 1')
    c1 = 10;
    c2 = 172;
    r1 = 4;
    r2 = 134;
    v = 120;
end


% E:\NewDataBase\GE_DataBase\2009_10_28_USC\kal 2
if strcmp(directory_name, 'E:\NewDataBase\GE_DataBase\2009_10_28_USC\kal 2')
    c1 = 10;
    c2 = 172;
    r1 = 11;
    r2 = 44;
    v = 110;
end




% E:\NewDataBase\GE_DataBase\kal 3.5\KAL 3.5_NewData
if strcmp(directory_name, 'E:\NewDataBase\GE_DataBase\kal 3.5\KAL 3.5_NewData')
    c1 = 4;
    c2 = 106;
    r1 = 20;
    r2 = 171;
    v = 210;
end

% E:\NewDataBase\GE_DataBase\New_data_2010_05_13\KAL 3.5 re
if strcmp(directory_name, 'E:\NewDataBase\GE_DataBase\New_data_2010_05_13\KAL 3.5 re')
    c1 = 4;
    c2 = 106;
    r1 = 20;
    r2 = 171;
    v = 210;
end

% E:\NewDataBase\GE_DataBase\2009_10_28_USC\kal 1
if strcmp(directory_name, 'E:\NewDataBase\GE_DataBase\2009_10_28_USC\kal 1')
    c1 = 11;
    c2 = 172;
    r1 = 6;
    r2 = 131;
    v = 135;
end

% E:\NewDataBase\GE_DataBase\kal 3 renew
if strcmp(directory_name, 'E:\NewDataBase\GE_DataBase\kal 3 renew')
    c1 = 1;
    c2 = 276;
    r1 = 10;
    r2 = 336;
    v = 80;
end
