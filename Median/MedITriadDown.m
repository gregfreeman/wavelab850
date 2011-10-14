function [smooth,rough] = MedITriadDown(x,j,D)
% MedITriadDown -- Med Triad Down
%  Usage
%    [smooth,rough] = MedITriadDown(x,j,D)
% 

        global SORTX
        n = 3^j;
	
	% coarsening
	N = length(SORTX);
	J = log(N)/log(3);
	TriMergeSort(j);
	blocklength = round(3^(J-j+1)); numblock = round(3^(j-1));
	smooth = SORTX( (blocklength+1)/2 : blocklength : N );
	% refinement
	if D == 0;
	  interpolant = reshape([smooth; smooth; smooth], 1, n);
	elseif D == 2;
	  [m1,m2,m3] = QuadMedRef(smooth(1), smooth(2), smooth(3), 'Left');
	  interpolant(:,1) = [m1; m2; m3];
	  for i = 2:(n/3-1),
	    [m1,m2,m3] = QuadMedRef(smooth(i-1), smooth(i), smooth(i+1));
	    interpolant(:,i) = [m1; m2; m3];
	  end
	  [m1,m2,m3] = QuadMedRef(smooth(n/3-2), smooth(n/3-1), smooth(n/3), 'Right');
	  interpolant(:,n/3) = [m1; m2; m3];
	  interpolant = reshape(interpolant, 1, n);
	else
	  fprintf('I only know how to so D=0 or 2!\n');
	end
	
	rough = x - interpolant;
    
% 
% Copyright (c) 1995. David L. Donoho and Thomas P.Y.Yu
% 
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
