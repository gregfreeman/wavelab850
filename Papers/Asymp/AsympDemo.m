%********************************************************
function AsympDemo(action)
%Usage: AsympDemo
%Description: Demo for paper Wavelet Shrinkage: Asymptopia?
%Date: August 1, 2005
%********************************************************
global plotOffset
global LastFigureNo
global PaperName
global MakeFigureFilePrefix
global IfNewWindow
global IfAddTitle
global IfLoadData
global StopPlot
global WLVERBOSE
global NRfigures
global CRfigures
global UnderConstructionFigures
% -------------------------------------------------------
LastFigureNo = 10;
PaperName = 'Wavelet Shrinkage: Asymptopia?';
MakeFigureFilePrefix = 'asfig';
% NRfigures = {1};
% CRfigures = {8,10,11};
% UnderConstructionFigures = {20};
%--------------------------------------------------------
global ASFIGNUM 
ASFIGNUM = 0;
clc; help('AsympIntro');


WLVERBOSE='No';
IfNewWindow = 0;
IfAddTitle = 0;
IfCompute = 0;

if nargin == 0,
    Initialize_GUI;
    c=get(gcf,'Children');
    [m,n]=size(c);
    plotOffset = m;
    action = '';
end

if  isequal(action,'NewWindow'),
    IfNewWindow = get(findobj(gcf,'tag','newWindow'),'value');
    if IfNewWindow,AsympDemo;end
% elseif  isequal(action,'AddTitle'),
%     IfAddTitle = get(findobj(gcf,'tag','iftitle'),'value');
% elseif  isequal(action,'Compute'),
%     IfCompute = get(findobj(gcf,'tag','IfCompute'),'value');
elseif isequal(action,'ploteach'),
    PlotFigure;
elseif isequal(action,'plotall'),
    StopPlot = 0;
    PlotAllFigures;
elseif  isequal(action,'stop'),
    StopPlot = 1;
elseif  isequal(action,'seecode'),
    edit1 = get(findobj(gcf,'tag','edit1'),'value');
    if edit1 < 10,
        s=strcat('0', num2str(edit1));
        else
        s=num2str(edit1);
    end
    s = ['edit', ' ', strcat(MakeFigureFilePrefix, s)];
    eval(s);
elseif  isequal(action,'CloseAllDemo'),
    CloseDemoFigures;
    ClearGlobalVariables;
end

%********************************************************
function Initialize_GUI
%********************************************************

% -------------------------------------------------------
fs = 9; %default font size
% -------------------------------------------------------
global LastFigureNo
global PaperName;
%CloseDemoFigures
%close all
figure;
figureNoList = (1:LastFigureNo)';
%clf reset;
set(gcf,'pos', [50   55   560*1.45   420*1.45], 'Name', PaperName, 'NumberTitle','off');
set(gcf,'doublebuffer','on','userdata',1);

uicontrol('tag','newWindow', 'style','checkbox', ...
    'units','normal',  'position',[.85 .92, .12 .05], ...
    'string','New Window', 'fontsize',fs, ...
    'userdata',0, 'backgroundcolor', [0.8 0.8 0.8],...
    'callback','AsympDemo(''NewWindow'')');

% uicontrol('tag','iftitle', 'style','checkbox', ...
%     'units','normal',  'position',[.85 .88, .12 .05], ...
%     'string','Title',  'fontsize',fs, ...
%     'userdata',0,      'backgroundcolor', [0.8 0.8 0.8],...
%     'callback','AsympDemo(''AddTitle'')');

% uicontrol( 'tag','IfCompute',   'style','checkbox', ...
%     'units','normal', 'position',[.85 .84, .12 .05], ...
%     'string','Compute',  'fontsize',fs, ...
%     'userdata',0,  'backgroundcolor', [0.8 0.8 0.8],...
%     'callback','AsympDemo(''Compute'')');
uicontrol( 'tag','text1',    'style','text', ...
    'units','normal', 'position', [.85 .79, .12 .04], ...
    'string','Figure','backgroundcolor', [0.8 0.8 0.8],...
    'fontsize',fs);
uicontrol('tag','text2', 'style','text', ...
    'units','normal',   'position', [.04 .93, .7 .04], ...
    'string','',    'backgroundcolor', [0.8 0.8 0.8],...
    'fontsize',fs);
uicontrol( 'tag','text3', 'style','text', ...
    'units','normal',  'position', [.04 .01, .7 .04], ...
    'string','',   'backgroundcolor', [0.8 0.8 0.8],...
    'fontsize',fs);
uicontrol( 'tag','edit1', 'style','list', ...
    'units','normal',   'position',[.85 .50 .12 .30], ...
    'string',{num2str(figureNoList)}, 'backgroundcolor',[0.8 0.8 0.8], ...
    'fontsize',fs,  'callback','AsympDemo(''ploteach'')');


uicontrol( 'tag','RunAllFig', 'style','pushbutton', ...
    'units','normal',  'position',[.85 .40 .12 .06], ...
    'string','Run All Fig' ,  'fontsize',fs, ...
    'interruptible','on',   'callback','AsympDemo(''plotall'')');

uicontrol( 'tag','stop',  'style','pushbutton', ...
    'units','normal',   'position',[.85 .32 .12 .06], ...
    'string','Stop',    'fontsize',fs, ...
    'userdata',0,   'callback','AsympDemo(''stop'');');
%'callback','set(gcbo,''userdata'',1)');
uicontrol(  'tag','SeeCode',   'style','pushbutton', ...
    'units','normal',   'position',[.85 .24 .12 .06], ...
    'string','See Code' ,   'fontsize',fs, ...
    'callback', 'AsympDemo(''seecode'')');
uicontrol(  'style','pushbutton',    'units','normal', ...
    'position',[.85 .16 .12 .06],   'string','Close', ...
    'fontsize',fs,   'callback','close');
uicontrol(  'style','pushbutton',  'units','normal', ...
    'position',[.85 .08 .12 .06],   'string','Close All', ...
    'fontsize',fs, 'callback','AsympDemo(''CloseAllDemo'')');

%********************************************************
function PlotFigure
%********************************************************
global MakeFigureFilePrefix
global IfNewWindow
global IfAddTitle
global IfCompute
global NRfigures
global CRfigures
global UnderConstructionFigures
ListControl = findobj(gcf,'tag','edit1');
set(ListControl,'Enable','off');
 
DeleteSubplots;
%set(gcf,'Visible', 'off');
edit1 = get(findobj(gcf,'tag','edit1'),'value');
IfAddTitle = get(findobj(gcf,'tag','iftitle'),'value');
IfCompute = get(findobj(gcf,'tag','IfCompute'),'value');
%IfNewWindow = get(findobj(gcf,'tag','newWindow'),'value');
IfNewWindow = 0;
AsympFig(edit1);

%if edit1 < 10,
%   s=strcat('0', num2str(edit1));
%else

%end
%eval(s);
%
%     IfLoadData = ~IfCompute;
%     switch edit1,
%         case UnderConstructionFigures
%             fprintf('\n\nFigure %d is still under construction', edit1);
%         case NRfigures
%             s=[strcat(MakeFigureFilePrefix, s), '(', num2str(IfNewWindow), ')'];
%                 fprintf('\n\n\nLoading Data for Figure %d...\n', edit1);
% 			    %    tic;
%                 eval(s);
%                 fprintf('\nData Loaded.  Figure %d generated.\n', edit1);
%         case CRfigures
%             s=[strcat(MakeFigureFilePrefix, s), '(', num2str(IfNewWindow), ',', num2str(IfAddTitle),',', num2str(IfLoadData),')'];
%             if IfLoadData,
%                 fprintf('\n\n\nLoading Data for Figure %d...\n', edit1);
% 			    %    tic;
%                 eval(s);
%                 fprintf('\nData Loaded.  Figure %d generated.\n', edit1);
% 			    %     toc,
%             else
%                 fprintf('\n\n\nComputing for Figure %d...\n', edit1);
%                 eval(s);
%                 fprintf('\nComputations done.  Figure %d generated.\n', edit1);
%             end
%         otherwise
%             s=[strcat(MakeFigureFilePrefix, s), '(', num2str(IfNewWindow), ',', num2str(IfAddTitle),')'];
%             fprintf('\n\n\nComputing for Figure %d...\n', edit1);
% 		%    tic;
%             eval(s);
%             fprintf('\nComputations done.  Figure %d generated.\n', edit1);
% 		%     toc,
%           end

WriteCaptions(edit1);
AdjustSubplots;
titles= ['Figure ', num2str(edit1)];
text1 = findobj(gcbo,'tag','text1');
set(text1,'string', titles);
set(ListControl,'Enable','on');

%set(gcf,'Visible', 'on');
%********************************************************
function PlotAllFigures
%********************************************************
global LastFigureNo
global StopPlot
global IfNewWindow

for i=1:LastFigureNo,
    if StopPlot == 1,
        break;
    end
    h=findobj(gcf,'tag','edit1');
    set(h,'Value',i);
    PlotFigure;
    pause(3);
    %DeleteNonDemoFigures
end
%********************************************************
function WriteCaptions(edit1)
%********************************************************
global MakeFigureFilePrefix
global NRfigures
global CRfigures
global UnderConstructionFigures

captions='';

if edit1 < 10,
    s=strcat('0', num2str(edit1));
else
    s=num2str(edit1);
end

text3 = findobj(gcf,'tag','text3');

switch edit1,
    case UnderConstructionFigures
        set(text3,'string',   ['This figure is still under construction']);
    case NRfigures
        set(text3,'string',   ['This figure is produced by', ' ', strcat(MakeFigureFilePrefix, num2str(edit1)),'.m','               ','(NR)']);
    case CRfigures
        set(text3,'string',   ['This figure is produced by', ' ', strcat(MakeFigureFilePrefix, num2str(edit1)),'.m','               ','(CR)']);
    otherwise
        set(text3,'string',   ['This figure is produced by', ' ', strcat(MakeFigureFilePrefix, s),'.m', '               ', '(R)']);
end

%********************************************************
function AdjustSubplots
%********************************************************
global plotOffset
% set(gcf,'Visible', 'off');
MagnificationFactor = 0.92;
right = 0.78;
c = get(gcf,'Children');
[m1,n1]=size(c);
m=m1-plotOffset;
p = zeros(m, 4);
for i=m:-1:1,
    %get all suplots'  positions
    p(i,:) = get(c(i),'position');
end
% contract all subplots
p = p * MagnificationFactor;
col=sum(unique(p(:,1))<1);
LegNo = length(findobj(gcf,'tag','legend'));
if ~isempty(LegNo)
    col = col- LegNo;
end
diff = length(unique(p(:,1))) - col;
if col > 0,
    row = m/col;
end
cond1 = isempty(LegNo);
hshift = .05;
%simpliy do a horizontal shift for children that is not "camera" menu nor legend
for i=m:-1:1
    if  p(i,1)<1,
        cond2 = and(~cond1, ~strcmp(get(c(i),'tag'), 'legend'));
        if or(cond1, cond2),
            width = p(i,3);
            %hshift = (right - col * width) / (col+1);
            p(i,1) = p(i,1) - hshift;
            set(c(i), 'position', p(i,:));
        end
    end
end

%********************************************************
function DeleteSubplots
%********************************************************
global plotOffset
c = get(gcf,'Children');
[m1,n1]=size(c);
m=m1-plotOffset;
for i=1:m,
    delete(c(i));
end
%********************************************************
function DeleteNonDemoFigures
%********************************************************
h=findobj(0,'Type','figure');
[m,n]=size(h);
for i=1:m,
    if h(i)~=1
        close(h(i));
    end
end
%********************************************************
function CloseDemoFigures
%********************************************************
global PaperName;
h=findobj(0,'Name', PaperName);
[m,n]=size(h);
for i=1:m,
    close(h(i))
end
%********************************************************
function ClearGlobalVariables
%********************************************************
global plotOffset
global LastFigureNo
global PaperName
global MakeFigureFilePrefix
global IfNewWindow
global IfAddTitle
global IfLoadData
global StopPlot
global WLVERBOSE;
global NRfigures;
global CRfigures;
global UnderConstructionFigures;

clear plotOffset
clear LastFigureNo
clear PaperName
clear MakeFigureFilePrefix
clear IfNewWindow
clear IfAddTitle
clear IfLoadData
clear StopPlot
clear WLVERBOSE;
clear NRfigures;
clear CRfigures;
clear UnderConstructionFigures; 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
