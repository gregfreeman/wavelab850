% MPWork62 -- Matching-Pursuit, Best-Basis Compression
%
%   Comparison on Four Complex Signals:
%
%     	Sorrows
% 		Riemann
%		Seismic
%		Tweet
%
%	Must be run after MPWork22, MPWork32
%

	n   = 1024;
	qmf = MakeONFilter('Coiflet',3);
%
	figure(compressfig);
%
	for i=1:4,

		if i==1,
			SigName = 'WernerSorrows';
			hs = MakeSignal(SigName,n);
			SigName = 'Sorrows';
		elseif i==2,
			SigName = 'Riemann';
			hs = MakeSignal(SigName,n);
			hs = hs ./ norm(hs) .* sqrt(1000);
		elseif i==3,
			SigName = 'Seismic';
			hs = ReadSignal('Seismic')';
			hs = hs ./ norm(hs) .*sqrt(1000);
		elseif i==4,
			SigName = 'Tweet';
			hs = ReadSignal('Tweet');
			hs = hs ./ norm(hs) .* sqrt(8192);
		end			
%
		subplot(2,2,i)
		Compare4Decomp(hs,SigName,qmf,10,6)

	end
%
	ifprint(gcf,'mp_fig621.ps')

			
    
    

 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
