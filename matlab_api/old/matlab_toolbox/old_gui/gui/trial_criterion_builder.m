function varargout = trial_criterion_builder(varargin)
% TRIAL_CRITERION_BUILDER MATLAB code for trial_criterion_builder.fig
%      TRIAL_CRITERION_BUILDER, by itself, creates a new TRIAL_CRITERION_BUILDER or raises the existing
%      singleton*.
%
%      H = TRIAL_CRITERION_BUILDER returns the handle to a new TRIAL_CRITERION_BUILDER or the handle to
%      the existing singleton*.
%
%      TRIAL_CRITERION_BUILDER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRIAL_CRITERION_BUILDER.M with the given input arguments.
%
%      TRIAL_CRITERION_BUILDER('Property','Value',...) creates a new TRIAL_CRITERION_BUILDER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before trial_criterion_builder_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to trial_criterion_builder_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help trial_criterion_builder

% Last Modified by GUIDE v2.5 22-Jul-2011 22:24:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @trial_criterion_builder_OpeningFcn, ...
                   'gui_OutputFcn',  @trial_criterion_builder_OutputFcn, ...
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


% --- Executes just before trial_criterion_builder is made visible.
function trial_criterion_builder_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to trial_criterion_builder (see VARARGIN)
dontOpen = false;
subjectGuiInput = find(strcmp(varargin, 'subject_gui'));
if (isempty(subjectGuiInput)) ...
    || (length(varargin) <= subjectGuiInput) ...
    || (~ishandle(varargin{subjectGuiInput+1}))
    dontOpen = true;
else
    % Remember the handle, and adjust our position
    handles.subject_gui = varargin{subjectGuiInput+1};

    % Position to be relative to parent:
    parentPosition = getpixelposition(handles.subject_gui);
    currentPosition = get(hObject, 'Position');  
    % Set x to be directly in the middle, and y so that their tops align.
    newX = parentPosition(1) + (parentPosition(3)/2 - currentPosition(3)/2);
    newY = parentPosition(2) + (parentPosition(4)/2 - currentPosition(4)/2);
    %newY = parentPosition(2) + (parentPosition(4) - currentPosition(4));
    newW = currentPosition(3);
    newH = currentPosition(4);
    set(hObject, 'Position', [newX, newY, newW, newH]);
    
    handles.fts=E3.Feature_type.get_obj_array;
    set(handles.pu_ls_feature,'String',{handles.fts.Name});
    set(handles.pu_rs_feature,'String',{handles.fts.Name});
    set(handles.pu_comparison,'String',{'<';'<=';'>';'>=';'=';'!='});
end
if dontOpen
   disp('-----------------------------------------------------');
   disp('Improper input arguments. Pass a property value pair') 
   disp('whose name is "changeme_main" and value is the handle')
   disp('to the changeme_main figure, e.g:');
   disp('   x = changeme_main()');
   disp('   changeme_dialog(''changeme_main'', x)');
   disp('-----------------------------------------------------');
else
   %uiwait(hObject);
end

% Choose default command line output for trial_criterion_builder
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes trial_criterion_builder wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = trial_criterion_builder_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in pu_rs_feature.
function pu_rs_feature_Callback(hObject, eventdata, handles)
% Hints: contents = cellstr(get(hObject,'String')) returns pu_rs_feature contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pu_rs_feature
function pu_rs_feature_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function et_value_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of et_value as text
%        str2double(get(hObject,'String')) returns contents of et_value as a double
function et_value_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in pu_comparison.
function pu_comparison_Callback(hObject, eventdata, handles)
% Hints: contents = cellstr(get(hObject,'String')) returns pu_comparison contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pu_comparison
function pu_comparison_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pu_ls_feature_Callback(hObject, eventdata, handles)
% Hints: contents = cellstr(get(hObject,'String')) returns pu_ls_feature contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pu_ls_feature
function pu_ls_feature_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pb_add.
function pb_add_Callback(hObject, eventdata, handles)
subj_gui = handles.subject_gui;
subjHandles = guidata(subj_gui);
ani=subjHandles.ani;

new_crit=E3.Trial_criterion;
new_crit.subject_id=ani.DB_id;

ls_ft=handles.fts(get(handles.pu_ls_feature,'Value'));
new_crit.ls_feature_type_id=ls_ft.DB_id;

comp=get(handles.pu_comparison,'String');
comp=comp{get(handles.pu_comparison,'Value')};
new_crit.Comparison_operator=comp;

%If there is a critrion with matching primary key, this will update,
%otherwise it will add a new one to the database.
if get(handles.rb_value,'Value')
    new_crit.Rs_value=str2double(get(handles.et_value,'String'));
else
    rs_ft=handles.fts(get(handles.pu_rs_feature,'Value'));
    new_crit.rs_feature_type_id=rs_ft.DB_id;
end

refresh_subject(subj_gui);

% --- Executes on button press in pb_close.
function pb_close_Callback(hObject, eventdata, handles)
close(gcbf);

% --- Executes on button press in pb_showme.
function pb_showme_Callback(hObject, eventdata, handles)
% hObject    handle to pb_showme (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%!!!!Plot the feature values for the baseline period
ft=handles.fts(get(handles.pu_ls_feature,'Value'));
subj = handles.subject_gui;
subjHandles = guidata(subj);
ani=subjHandles.ani;
pts(length(ani.Periods))=E3.Period_type;
vals=cell(1,length(ani.Periods));
for pp=1:length(ani.Periods)
    trials=ani.Periods(pp).get_trials(false);
%     pts(pp).DB_id=ani.Periods(pp).period_type_id;
%     trials=ani.get_trials_for_pt(pts(pp),false);
    vals{pp}=trials.get_feature_value_for_ft(ft);
end

diff_x=NaN(1,length(vals));
for pp=1:length(vals)
    [n,x{pp}]=hist(vals{pp},floor(length(unique(vals{pp}))/10));
    diff_x(pp)=min(diff(x{pp}));
end
diff_x=min(diff_x)/10;
new_x=[];
for pp=1:length(vals)
    new_x=union(new_x,x{pp});
end
if max(new_x)<0
    new_x=min(new_x):diff_x:0;
elseif min(new_x)>0
    new_x=0:diff_x:max(new_x);
else
    new_x=min(new_x):diff_x:max(new_x);
end

figure;
color_order=get(gca,'ColorOrder');
for pp=1:length(vals)
    [n,x]=hist(vals{pp},new_x);
    plot(x,n,'Color',color_order(pp,:)),hold on
end
hold off
legend({pts.Name})
xlabel(ft.Name)
ylabel('Count (# trials)')
n_trials=NaN(length(vals),1);
for pp=1:length(vals)
    n_trials(pp)=length(vals{pp});
end
title({num2str(n_trials)})