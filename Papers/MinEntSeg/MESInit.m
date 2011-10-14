function MESInit
% MESInit -- Setup global variables for MES Demo
%
	global n x id
	global Ramp Cusp Noise HeaviSine
	global E2 F2
%
	if isempty(n),
	   n = 1024;
	end
	x = (0:(n-1)) ./ n;
%
%
	
	[Ramp,x,id] = MakeMESTestSig('Ramp',n);
	Cusp      = MakeMESTestSig('Cusp',n);	
	Noise     = MakeMESTestSig('Noise',n);
	HeaviSine = MakeMESTestSig('HeaviSine',n);
%
	E2 = MakeAIBdryFilter(2);
	F2 = MakeAIFilter(2);

    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
