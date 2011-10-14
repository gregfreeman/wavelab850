function x = MedTriadUp(smooth,rough)
% MedTriadUp -- Med Triad Up
%  Usage
%    MedTriadUp(smooth,rough)
%

n = length(rough);
cx = reshape(rough,3,n/3);
x = cx + [ smooth ; smooth; smooth ];
x = reshape(x,1,n);
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
