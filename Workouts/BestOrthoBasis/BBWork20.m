% BBWork20 -- Illustrate Candidate signals

	n = 1024;
	t = (0:(n-1))./n;
%
	figure;
	subplot(2,2,1)
	x = MakeSignal('HeaviSine',n);
	plot(t,x)
	title('HeaviSine')
%
	subplot(2,2,2)
	x = MakeSignal('Ramp',n);
	plot(t,x)
	title('Ramp')
%
	subplot(2,2,3)
	x = MakeSignal('Doppler',n);
	plot(t,x)
	title('Doppler')
%
	subplot(2,2,4)
	x = MakeSignal('LinChirp',n);
	plot(t,x)
	title('LinChirp');
%
	ifprint(gcf,'bbfig201.ps')
	figure;
%
	subplot(2,2,1)
	x = MakeSignal('QuadChirp',n);
	plot(t,x)
	title('QuadChirp')
%	
	subplot(2,2,2)
	x = MakeSignal('TwoChirp',n);
	plot(t,x)
	title('TwoChirp')
%
	subplot(2,2,3)
	x = MakeSignal('MishMash',n);
	plot(t,x)
	title('MishMash')
%
	subplot(2,2,4)
	x = MakeSignal('WernerSorrows',n);
	plot(t,x)
	title('Sorrows')
%
	ifprint(gcf,'bbfig202.ps')


    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
