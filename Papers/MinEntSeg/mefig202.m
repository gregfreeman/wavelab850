% mefig202 -- Portray Average-Interpolating (Boundary) Wavelets
% 
% This display shows a collection of average-interpolating wavelets.
% Such wavelets are portrayed for various degrees of interpolations,
% scales, and positions.
%

	MakeAllFilters;
%
	%clf; 
    subplot(221);
	for j= [1 2  5 7 8],
	a = zeros(1,8); 
	a(j) = 1; 
	for k=1:5, 
	  a = AIRefine(a,2,Fil2,EdgeFil2); 
	end;
	t = (0:255) ./256; if j==1, axis([0 1 -20 20]); end
	if j==1, pch = '-.'; end
	if j==2, pch = '--'; end
	if j==5, pch = '-'; end
	if j==7, pch ='--'; end
	if j==8, pch = '-.'; end
	plot(t,8 .*a, pch); if j==1, hold; end;
	end
	title('2.2a Interval Wavelets phi_{3,k}, D=2'); hold off;
%
	subplot(222)
	for j= [1 2  9 15 16],
	a = zeros(1,16); 
	a(j) = 1; 
	for k=1:5, 
	  a = AIRefine(a,4,Fil4,EdgeFil4); 
	end;
	t4 = (0:(length(a)-1)) ./length(a); if j==1, axis([0 1 -20 20]); end
	if j==1, pch = '-.'; end
	if j==2, pch = '--'; end
	if j==9, pch = '-'; end
	if j==15, pch ='--'; end
	if j==16, pch = '-.'; end
	plot(t4,8 .*a, pch); if j==1, hold; end;
	end
	title('2.2b Interval Wavelets phi_{4,k}, D=4'); hold off;
%
	subplot(223)
	for j= [1 2  5 7 8],
	a = zeros(1,16); 
	a(2*j) = 1; a(2*j-1) = -1; 
	for k=1:4, 
	  a = AIRefine(a,2,Fil2,EdgeFil2); 
	end;
	t = (0:255) ./256; if j==1, axis([0 1 -20 20]); end
	if j==1, pch = '-.'; end
	if j==2, pch = '--'; end
	if j==5, pch = '-'; end
	if j==7, pch ='--'; end
	if j==8, pch = '-.'; end
	plot(t,8 .*a, pch); if j==1, hold; end;
	end
	title('2.2c Interval Wavelets psi_{3,k}, D=2'); hold off;
%
	subplot(224)
	for j= [1 2  9 15 16],
	a = zeros(1,32); 
	a(2*j) = 1; a(2*j-1) = -1; 
	for k=1:4, 
	  a = AIRefine(a,4,Fil4,EdgeFil4); 
	end;
	if j==1, axis([0 1 -20 20]); end
	if j==1, pch = '-.'; end
	if j==2, pch = '--'; end
	if j==9, pch = '-'; end
	if j==15, pch ='--'; end
	if j==16, pch = '-.'; end
	plot(t4,8 .*a, pch); if j==1, hold; end;
	end
	title('2.2d Interval Wavelets psi_{4,k}, D=4'); hold off;

%  
% Prepared for the paper Minimum Entropy Segmentation 
% Copyright (c) 1994 David L. Donoho
%  
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
