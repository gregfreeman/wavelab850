function PlotAtomicPhase(TFType,atomlist,n,titlestr)
% PlotAtomicPhase -- Plot time-frequency content of atom list
%  Usage
%    PlotAtomicPhase(atomlist,n[,titlestr]) 
%  Inputs
%    TFType       string indicating type of TF atoms: 'CP' or 'WP'   
%    atomlist     atom list, e.g. as produced by CPPursuit or WPPursuit
%    n            signal length
%    titlestr     signal name (optional)
%
%  Side Effects
%    A plot of Time-Frequency Plane, with rectangles showing Heisenberg
%    cells of the atoms making a significant contribution.
%
	if nargin < 4,
	   titlestr = ' ';
	end
	[natom,ncharm] = size(atomlist);
	ss = norm(atomlist(:,1));
%
	LockAxes([0 1 0 1]);
	titlestr = ['Phase plane: ' titlestr ];
	title(titlestr);
	xlabel('Time');
	ylabel('Frequency');
%
	for k=1:natom,
		  e = n*(atomlist(k,1)./ss)^2;
		  d = atomlist(k,2); b = atomlist(k,3); f = atomlist(k,4);
		  ylo = b/2^d;     yhi = (b+1)/2^d;
		  xlo = f*(2^d)/n; xhi = (f+1)*(2^d)/n;
		  if strcmp(TFType,'WP'), 
		      DrawHeisenberg(xlo, xhi, ylo,yhi, e)
		  else
		      DrawHeisenberg(ylo, yhi, xlo,xhi, e)
		  end		  
	end
%
    UnlockAxes;

%
% Copyright (c) 1993. David L. Donoho
%
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
