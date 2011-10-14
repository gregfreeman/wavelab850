function Signal = ReadSignal(Name)
% ReadSignal -- Read 1-d signal from file in ascii format
%  Usage
%    signal = ReadSignal(Name)
%  Inputs
%    Name    'Caruso', 'ESCA', 'Greasy', 'HochNMR',
%            'Seismic', 'Laser', 'RaphaelNMR',
%            'Sunspots', 'Transients', 'Tweet'
%  Outputs
%    signal   1-d signal
%
%  Side Effects
%    A descriptor file for the data is printed
%
    global WLVERBOSE
	global WAVELABPATH        % set by WavePath.m
	global PATHNAMESEPARATOR  % set by WavePath.m 
%
	if strcmp(Name,'Tweet'),
	  filename = 'tweet';
	elseif strcmp(Name,'Transients'),
	  filename = 'transients';
	elseif strcmp(Name,'Sunspots'),
	  filename = 'sunspots';
	elseif strcmp(Name,'RaphaelNMR'),
	  filename = 'RaphNMR';
	elseif strcmp(Name,'Laser'),
	  filename = 'laser';
	elseif strcmp(Name,'Seismic'),
	  filename = 'seismic';
	elseif strcmp(Name,'HochNMR'),
	  filename = 'HochNMR';
	elseif strcmp(Name,'Greasy'),
	  filename = 'greasy';
	elseif strcmp(Name,'ESCA'),
	  filename = 'esca';
	elseif strcmp(Name,'Caruso'),
	  filename = 'caruso';
	elseif strcmp(Name,'msignal'),
	  filename = 'msignal';
	elseif strcmp(Name,'lady'),
	    filename = 'lady';
	else
	    disp('I only know how to read the signals:     ');
	    disp('   Caruso, ESCA, Greasy, HochNMR,        ');
	    disp('   Seismic, Laser, RaphaelNMR,           ');
	    disp('   Sunspots, Transients, Tweet           ');
	    filename = 'BOGUS';
	end
	
	if ~strcmp(filename,'BOGUS'),
	    filepath = [WAVELABPATH 'Datasets'  ...
	               PATHNAMESEPARATOR filename '.asc'];
	    fid = fopen(filepath,'r');
	    if fid < 0,
	        disp('ReadSignal: I was unable to open the dataset you requested        ');
	        disp('Practically the only way this error could occur       ');
	        disp('is by the failure of the WavePath.m file to reflect   ');
	        disp('the actual name of the root WaveLab directory.        ');
	        disp('Solution: quit Matlab, edit WavePath, restart Matlab. ');
	        disp('In our experience this always works.                  ');
	    else
	       if strcmp(WLVERBOSE,'Yes') 
		 fprintf('Reading %s\n', filepath)
		 docpath = [WAVELABPATH 'Datasets'  ...
		       PATHNAMESEPARATOR filename '.txt'];
		 type(docpath)
	       end	       
	        Signal = fscanf(fid,'%g');
	        fclose(fid);
	        par = size(Signal);
		if strcmp(WLVERBOSE,'Yes') 
		  fprintf('It is an array of size[%4.0f,%4.0f]\n',par(1),par(2))
		end		
	    end
	end

%
% Copyright (c) 1993-5, Jonathan Buckheit and David Donoho
%

%	Revision History
%		09/29/99	DLD Changed .doc to .txt
%     
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
