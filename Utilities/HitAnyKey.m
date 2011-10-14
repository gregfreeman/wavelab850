function HitAnyKey(arg)
% HitAnyKey -- Tool for pausing in scripts
%  Usage
%    HitAnyKey([arg])
%  Inputs
%    arg    optional value to store into global HitKeyMemory
%
%  Description
%    Hit any key to continue
%
global HitKeyMemory
if nargin == 1,
   HitKeyMemory = arg;
end
drawnow;
if ~strcmp(HitKeyMemory,'SkipPauses'),
	if ~strcmp(HitKeyMemory,'AutoPrint'),
	  disp('Awaiting Input; Hit P to print before continuing')
	  disp('                Hit X to suppress further pauses')
	  disp('                Hit any other key to continue   ')
	  char = input('input P,X, or other?','s');
	  if (char ~= [])
	  	if strcmp(char(1),'P'),
			print
	  	elseif strcmp(char(1),'X'),
			HitKeyMemory = 'SkipPauses';
	  	end
	  end
	else
	  print
	end
end

%
% Copyright (c) 1993-5, Jonathan Buckheit and David Donoho
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
