function varargout = EVALUATE(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EVALUATE_OpeningFcn, ...
                   'gui_OutputFcn',  @EVALUATE_OutputFcn, ...
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



function EVALUATE_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = EVALUATE_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

function pushbutton1_Callback(hObject, eventdata, handles)
Spoken=get(handles.Spoken,'string')
Spoken=str2num(Spoken)
Written=get(handles.Written,'string')
Written=str2num(Written)
Comprehension=get(handles.Comprehension,'string')
Comprehension=str2num(Comprehension)
fis=readfis('fuzzy_system_2.fis')
Level=evalfis(fis,[Spoken,Written,Comprehension])
fis2=readfis('fuzzy_system_class.fis')
class=evalfis(fis2,[Spoken,Written,Comprehension])
interval1 = 0:0.01:1
interval2 = 1:0.01:3
interval3 = 2:0.01:5
interval4 = 4:0.01:7
interval5 = 6:0.01:9
interval6 = 9:0.01:10
interval12 =0:0.01:3
interval34 =2:0.01:7
interval56 =6:0.01:10
Answer1= 'A1'
Answer2= 'A2'
Answer3= 'B1'
Answer4= 'B2'
Answer5= 'C1'
Answer6= 'C2'
Class1= 'BEGINNER'
Class2= 'INTERMEDIATE'
Class3= 'ADVANCED'
Advice_1 ='Focus on working step by step to improve your abilities in all aspects'
Advice_2 ='It_s Time For you To do more than you already have' 
Advice_3 ='Very Good Work, Keep it up'
%Testing Level
if and(Level>interval1(1), Level<interval1(end))
set(handles.Level,'string',Answer1)
elseif and(Level>interval2(1), Level<interval2(end))
set(handles.Level,'string',Answer2)
elseif and(Level>interval3(1), Level<interval3(end))
set(handles.Level,'string',Answer3)
elseif and(Level>interval4(1), Level<interval4(end))
set(handles.Level,'string',Answer4)
elseif and(Level>interval5(1), Level<interval5(end))
set(handles.Level,'string',Answer5)
elseif and(Level>interval6(1), Level<interval6(end))
set(handles.Level,'string',Answer6)
else 
    set(handles.Level,'string','err')
end

%Close_To_Level
if and(Level>interval1(1), Level<interval1(end))
set(handles.Close_To_Level,'string',Answer2)

elseif and(Level>interval2(1), Level<interval2(end))
set(handles.Close_To_Level,'string',Answer3)

elseif and(Level>interval3(1), Level<interval3(end))
set(handles.Close_To_Level,'string',Answer4)

elseif and(Level>interval4(1), Level<interval4(end))
set(handles.Close_To_Level,'string',Answer5)

else 
    set(handles.Close_To_Level,'string','')
    set(handles.text13, 'Visible', 'Off')
end
%Testing Class
if and(class>interval12(1), class<interval12(end))
set(handles.Class,'string',Class1)
set(handles.Advice,'string',Advice_1)
elseif and(class>interval34(1), class<interval34(end))
set(handles.Class,'string',Class2)
set(handles.Advice,'string',Advice_2)
elseif and(class>interval56(1), class<interval56(end))
set(handles.Class,'string',Class3)
set(handles.Advice,'string',Advice_3)
else 
    set(handles.Class,'string','err')
end

%Reset Button 
function pushbutton2_Callback(hObject, eventdata, handles)

set(handles.Spoken,'string',num2str(0))
set(handles.Written,'string',num2str(0))
set(handles.Comprehension,'string',num2str(0))

set(handles.Level,'string','None')
%Switch on Close_Level
set(handles.text13, 'Visible', 'On')

set(handles.Close_To_Level,'string','None')

set(handles.Class,'string','...........................................')
set(handles.Advice,'string','Advice For You')

 
function Level_Callback(hObject, eventdata, handles)

function Level_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Close_To_Level_Callback(hObject, eventdata, handles)

function Close_To_Level_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Spoken_Callback(hObject, eventdata, handles)

function Spoken_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Written_Callback(hObject, eventdata, handles)

function Written_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Comprehension_Callback(hObject, eventdata, handles)

function Comprehension_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Class_Callback(hObject, eventdata, handles)

function Class_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function uipanel2_CreateFcn(hObject, eventdata, handles)

function pushbutton1_CreateFcn(hObject, eventdata, handles)
