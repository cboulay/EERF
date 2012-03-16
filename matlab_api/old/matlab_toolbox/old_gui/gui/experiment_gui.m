function varargout = experiment_gui(varargin)
% EXPERIMENT_GUI MATLAB code for experiment_gui.fig
%      EXPERIMENT_GUI, by itself, creates a new EXPERIMENT_GUI or raises the existing
%      singleton*.
%
%      H = EXPERIMENT_GUI returns the handle to a new EXPERIMENT_GUI or the handle to
%      the existing singleton*.
%
%      EXPERIMENT_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXPERIMENT_GUI.M with the given input arguments.
%
%      EXPERIMENT_GUI('Property','Value',...) creates a new EXPERIMENT_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before experiment_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to experiment_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help experiment_gui

% Last Modified by GUIDE v2.5 26-Jul-2011 17:04:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @experiment_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @experiment_gui_OutputFcn, ...
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


% --- Executes just before experiment_gui is made visible.
function experiment_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to experiment_gui (see VARARGIN)

mainGuiInput = find(strcmp(varargin, 'main_gui'));
if ~isempty(mainGuiInput)
    handles.main_gui = varargin{mainGuiInput+1};
end
experInput = find(strcmp(varargin,'exper'));
if ~isempty(experInput)
    handles.exper=varargin{experInput+1};
end

% Choose default command line output for subject_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
refresh_experiment(hObject);

% UIWAIT makes experiment_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = experiment_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function et_exp_name_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of et_exp_name as text
%        str2double(get(hObject,'String')) returns contents of et_exp_name as a double
handles.exper.Name=get(hObject,'String');
refresh_experiment(gcbf);


% --- Executes during object creation, after setting all properties.
function et_exp_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to et_exp_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pb_subj_add_Callback(hObject, eventdata, handles)
anis=E3.Subject.get_obj_array;
[Selection,ok] = listdlg('ListString',{anis.Name},'SelectionMode','multiple');
ani=anis(Selection);
if ok && ~isempty(ani)
    anis=handles.exper.Subjects;
    handles.exper.Subjects=[anis ani];
    if length(ani)>1
        set(handles.lb_subj,'Value',length(handles.exper.Subjects));
    else
        set(handles.lb_subj,'Value',find(strcmp({handles.exper.Subjects.Name},ani.Name)));
    end
end
refresh_experiment(gcbf);
function pb_subj_remove_Callback(hObject, eventdata, handles)
%Remove this subject from the list attributed to this experiment.
subj_list = cellstr(get(handles.lb_subj,'String'));
selected_subj=subj_list{get(handles.lb_subj,'Value')};
subjs=handles.exper.Subjects;
subjs(strcmpi({subjs.Name},selected_subj))=[];
handles.exper.Subjects=subjs;
refresh_experiment(gcbf);
function lb_subj_Callback(hObject, eventdata, handles)
% Hints: contents = cellstr(get(hObject,'String')) returns lb_subj contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lb_subj
function lb_subj_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pb_analysis_remove_Callback(hObject, eventdata, handles)
analysis_list = cellstr(get(handles.lb_analyses,'String'));
selected_analysis=analysis_list{get(handles.lb_analyses,'Value')};
analyses=handles.exper.Analyses;
analyses(strcmpi({analyses.Name},selected_analysis))=[];
handles.exper.Analyses=analyses;
refresh_experiment(gcbf);
function pb_analysis_add_Callback(hObject, eventdata, handles)
analyses=E3.Analysis.get_obj_array;
[Selection,ok] = listdlg('ListString',{analyses.Name},'SelectionMode','multiple');
analysis=analyses(Selection);
if ok && ~isempty(analysis)
    analyses=handles.exper.Analyses;
    handles.exper.Analyses=[analyses analysis];
    if length(analysis)>1
        set(handles.lb_analyses,'Value',length(handles.exper.Analyses));
    else
        set(handles.lb_analyses,'Value',find(strcmp({handles.exper.Analyses.Name},analysis.Name)));
    end
end
refresh_experiment(gcbf);
function lb_analyses_Callback(hObject, eventdata, handles)
% Hints: contents = cellstr(get(hObject,'String')) returns lb_analyses contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lb_analyses
function lb_analyses_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pb_exper_delete_Callback(hObject, eventdata, handles)
handles.exper.remove_from_db;
if isfield(handles,'main_gui')
    refresh_e3analysis(handles.main_gui);
end
close(gcbf);

function pb_run_selected_Callback(hObject, eventdata, handles)
ana_names=cellstr(get(handles.lb_analyses,'String'));
ana_name=ana_names{get(handles.lb_analyses,'Value')};
analysis=handles.exper.Analyses(strcmpi({handles.exper.Analyses.Name},ana_name));
handles.exper.run_analysis(analysis);