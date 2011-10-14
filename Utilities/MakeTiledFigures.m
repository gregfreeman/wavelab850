function [h1,h2,h3,h4] = MakeTiledFigures(nfig,format)
% MakeTiledFigures -- Tile the screen with figures
%  Usage
%    [h1,h2] = MakeTiledFigures(2,format);
%    [h1,h2,h3] = MakeTiledFigures(3,format);
%    [h1,h2,h3,h4] = MakeTiledFigures(4,format);
%  Inputs
%    nfig          number of figure windows to create
%    format        string,  '|' or '-'   for nfig=2
%                           '|-' or '-|' for nfig=3
%                           '+'          for nfig=4
%  Outputs
%    h1,h2,h3,h4   handles for each figure window created
%
%  Description
%    An array of figure windows is created, tiling the screen
%
%         Possible Layouts (nfig,format label beneath each)
%
%     |---|---|   |-------|   |---|---|   |---|---|   |---|---|
%     |   |   |   |       |   |   |   |   |   |   |   |   |   |
%     |   |   |   |-------|   |   |---|   |---|   |   |---|---|
%     |   |   |   |       |   |   |   |   |   |   |   |   |   |
%     |---|---|   |-------|   |---|---|   |---|---|   |---|---|
%       2,'|'        2,'-'      3,'|-'      3,'-|'      4,'+'
%

        screen = get(0,'ScreenSize');
        width = screen(3);
        height = screen(4);

        wid2 = floor(width/2);
        hgt2 = floor(height/2);

if nfig==2,
        h1 = figure;
        h2 = figure;

        if strcmp(format,'|'),
			rect1 = [0 0 wid2 height];
			rect2 = [wid2 0 wid2 height];
        else
			rect2 = [   0    0 width hgt2];
			rect1 = [   0 hgt2 width hgt2];
        end
        set(h1,'Position',rect1);
        set(h2,'Position',rect2);
        figure(h1);
elseif nfig==3,
        h1 = figure;
        h2 = figure;
        h3 = figure;

        if strcmp(format,'|-'),
			rect1 = [   0    0 wid2 height];
			rect3 = [wid2    0 wid2 hgt2];
			rect2 = [wid2 wid2 wid2 hgt2];
        else
			rect2 = [   0    0 wid2 hgt2];
			rect1 = [   0 hgt2 wid2 hgt2];
			rect3 = [wid2    0 wid2 height];
        end
        set(h1,'Position',rect1);
        set(h2,'Position',rect2);
        set(h3,'Position',rect3);
        figure(h1);

elseif nfig==4,
        h1 = figure;
        h2 = figure;
        h3 = figure;
        h4 = figure;

        if strcmp(format,'+'),
			rect1 = [   0 hgt2 wid2 hgt2];
			rect2 = [wid2 wid2 wid2 hgt2];
			rect3 = [   0    0 wid2 hgt2];
			rect4 = [wid2    0 wid2 hgt2];
        end

        set(h1,'Position',rect1);
        set(h2,'Position',rect2);
        set(h3,'Position',rect3);
        set(h4,'Position',rect4);
        figure(h1);
else
        fprintf('in MakeTiledFigures: nfig =%i out of range',nfig),
end

%
% Copyright (c) 1995, David L. Donoho
%

    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
