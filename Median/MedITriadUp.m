function x = MedITriadUp(smooth,rough,D)
% MedITriadUp -- Med Triad Up
%  Usage
%    MedITriadUp(smooth,rough)
%

        n = length(rough);
	
	if D == 0,
	  interpolant = reshape([ smooth ; smooth; smooth ],1,n);
	elseif D == 2,
	  interpolant = [];
	  
	  [m1,m2,m3] = QuadMedRef(smooth(1), smooth(2), smooth(3), 'Left');
	  interpolant = [interpolant m1 m2 m3];
	  for i = 2:(n/3-1),
	    [m1,m2,m3] = QuadMedRef(smooth(i-1), smooth(i), smooth(i+1));
	    interpolant = [interpolant m1 m2 m3];
	  end
	  [m1,m2,m3] = QuadMedRef(smooth(n/3-2), smooth(n/3-1), smooth(n/3), 'Right');	  
	  interpolant = [interpolant m1 m2 m3];
	else
	  fprintf('I only know how to so D=0 or 2!\n');
	end
	
	x = rough + interpolant;

% 					
% Copyright (c) 1995. David L. Donoho and Thomas P.Y.Yu
%     
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
