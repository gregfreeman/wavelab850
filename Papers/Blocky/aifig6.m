% aifig6 -- Depict 2-d Average-Interpolation%% (Panel a) A set of 2-d block averages at a fine scale,% (Panel b) a set of 2-d block averages two scales coarser,% (Panel c) Refinement of the coarse-scale averages (D=2)% (Panel c) Refinement of the coarse-scale averages (D=4)%% Refinement of the coarse-scale information nearly reproduces% the original fine-scale data.%global Fil2 Fil4 Fil6 Fil8global EdgeFil2 EdgeFil4 EdgeFil6 EdgeFil8%n = 64; lev=2;[x,y] = ...meshgrid((-.501+1/(2*n)):(1/n):(.501-1/(2*n)),(-.5+1/(2*n)):(1/n):(.5-1/(2*n)));y = flipud(y);r = sqrt(x .^2 + y .^2);subplot(221)sr = (sin(5 .*(r)) ./ (5 .*(r))).^2; clear r x y;mesh(sr); title('6(a) Averages of (sin(5r)/(5r))^2,  Fine scale, j=6')csr = HCoarsen2d(sr,lev);clear sr;Hsr = HRefine2d(csr,lev);subplot(222);mesh(Hsr); title('6(b) Averages at Coarse scale, j=4')clear Hsr; Rsr2 = AIRefine2d(csr,lev,2,Fil2,EdgeFil2);subplot(223);mesh(Rsr2); title('6(c) D=2 Interpolation from Coarse to Fine') clear Rsr2;Rsr4 = AIRefine2d(csr,lev,4,Fil4,EdgeFil4);subplot(224);mesh(Rsr4); title('6(d) D=4 Interpolation from Coarse to Fine');%	Revision History%		09/29/99	MRD	meshdom replaced by meshgrid/flipud         
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
