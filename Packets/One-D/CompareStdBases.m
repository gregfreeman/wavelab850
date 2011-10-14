function minlev = CompareStdBases(tree,D)
% CompareStdBases -- Calculate entropy of some standard bases
%  Usage
%    bestlev = CompareStdBases(stree,D)
%  Inputs
%    stree      stat tree (e.g. returned by CalcStatTree)
%    D          maximum level to search
%  Outputs
%    bestlev    best single level of basis
%
%  Side Effects
%    Prints out statistics of all single-level bases of packet
%    table, prints out statistics of wavelet basis.
%
%  See Also
%    ImagePhaseVarious, PlotPhaseVarious
%

	entlevel = zeros(1,D+1);
	fprintf('entropy by level\n')
	entmin = 10 .^6;
	minlev = 0;
	for d=0:D
		loindex = node(d,0);
		hiindex = node(d,2^d-1);
		entlevel(d+1)= sum(tree(loindex:hiindex));
		fprintf('%g  %g \n',d,entlevel(d+1))
		if(entlevel(d+1) < entmin),
			minlev = d; entmin = entlevel(d+1);
		end
	end
	fprintf('best level = %g; entropy = %g \n', minlev, entmin)
	entwave = tree(node(D,0));
	for d=1:D
		entwave = entwave + tree(node(d,1));
	end
	fprintf('wavelet entropy= %g \n',entwave)

%    
% Copyright (c) 1993. David L. Donoho
%     
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
