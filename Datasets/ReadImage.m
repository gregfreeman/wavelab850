function Image = ReadImage(Name)
% ReadImage -- Read Image file in 8-bit raw binary format
%  Usage
%    Image = ReadImage(Name)
%  Inputs
%    Name    'Barton', 'Canaletto', 'Coifman', 'Daubechies',
%            'Fingerprint', 'Lincoln', 'Lenna', 'MRIScan', 'Phone'
%  Outputs
%    Image    2-d signal, n by n, n dyadic
%
%  Side Effects
%    A descriptor file for the data is printed
%
    global WLVERBOSE
	global WAVELABPATH        % set by WavePath.m
	global PATHNAMESEPARATOR  % set by WavePath.m
%
	if strcmp(Name,'Barton'),
	    filename = 'barton.raw';
	    par = [512,512];
	    source = 'barton.txt';
	elseif strcmp(Name,'Canaletto'),
	    filename = 'canaletto.raw';
	    par = [512,512];
	    source = 'canaletto.txt';
	elseif strcmp(Name,'Coifman'),
	    filename = 'coifman.raw';
	    par = [256,256];
	    source = 'coifman.txt';
	elseif strcmp(Name,'Daubechies'),
	    filename = 'daubechies.raw';
	    par = [256,256];
	    source = 'daubechies.txt';
	elseif strcmp(Name,'Fingerprint'),
	    filename = 'fingerprint.raw';
	    par = [512,512];
	    source = 'fingerprint.txt';
	elseif strcmp(Name,'Lenna'),
		filename = 'lenna.raw';
		par = [256,256];
		source = 'lenna.txt';
	elseif strcmp(Name,'Lincoln'),
	    filename = 'lincoln.raw';
	    par = [64,64];
	    source = 'lincoln.txt';
	elseif strcmp(Name,'MRIScan'),
	    filename = 'mriscan.raw';
	    par = [256,256];
	    source = 'mriscan.txt';
	elseif strcmp(Name,'Phone'),    
	    filename = 'phone.raw';
	    par = [128,128];
	    source = 'phone.txt';
	elseif strcmp(Name,'Barbara'),
	    filename = 'barb.raw';
	    par = [512,512];
	    source = 'barb.txt';
	else
	    disp('I only know how to read the datasets:            ');
	    disp('   Barton, Canaletto, Coifman, Daubechies,       ');
	    disp('   Fingerprint, Lincoln, Lenna, MRIScan, Phone   ');
	    filename = 'BOGUS';
	end
	
	if ~strcmp(filename,'BOGUS'),
	    filename = [WAVELABPATH 'Datasets'  ...
	               PATHNAMESEPARATOR filename];
	    fid = fopen(filename,'r');
	    if fid < 0,
	        fprintf('ReadImage: I was unable to open the dataset "%s"',filename);
	        disp('Typically way this error could occur       ');
	        disp('is by the failure of your WavePath.m file to reflect   ');
	        disp('the actual name of the root WaveLab directory.        ');
	        disp('Solution: quit Matlab, correctw WavePath, restart Matlab. ');
	        disp('In our experience this always works.                  ');
	      else
		if strcmp(WLVERBOSE,'Yes') 
		  fprintf('Reading %s\n', filename)
		  fprintf('It is an array of size [%4.0f,%4.0f]\n',par(1),par(2))
		  docfile = [WAVELABPATH 'Datasets'  ...
			PATHNAMESEPARATOR source];
		  type(source)
		end
	        Image = fread(fid,par);
	        fclose(fid);
	    end
	end
 
%
% Copyright (c) 1993-5. Jonathan Buckheit and David Donoho
% 
% Modified by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
%

% 	Revision History
%		1.2 09/29/99	DLD		changed .doc -> .txt
%								changed fid < 0 message.
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
