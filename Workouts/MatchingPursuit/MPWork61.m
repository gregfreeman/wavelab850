% MPWork61 -- Matching-Pursuit, Best-Basis Compression
%
%   Comparison on Four Basic Signals:
%
%     	LinChirp
% 		TwoChirp
%		QuadChirp
%		MishMash
%
%	Must be run after MPWork21, MPWork31
%
	n   = 1024;
	qmf = MakeONFilter('Coiflet',3);
%
	figure(compressfig);
%
	for i=1:4,

		if i==1,
			SigName = 'LinChirp';
		elseif i==2,
			SigName = 'TwoChirp';
		elseif i==3,
			SigName = 'QuadChirp';
		elseif i==4,
			SigName = 'MishMash';
		end			
%
		hs = MakeSignal(SigName,n);

		subplot(2,2,i)
		Compare4Decomp(hs,SigName,qmf,10,6)

	end
%
	ifprint(gcf,'mp_fig611.ps')

			
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
