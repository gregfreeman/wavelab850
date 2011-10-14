% MPWork00 -- Basics of Matching Pursuit, Illustrate Step-by-Step Behavior
%
	n = 1024;
	t = (0:(n-1))./n;
	qmf = MakeONFilter('Coiflet',3);
	D   = log2(n);
%
%	Signals
%
	xi  		= pi/5 .* t;
	SlowChirp   = cos(xi .* (1:n));
	SigName = 'SlowChirp';
%
	figure;
	[a,r] = CPPrintPursuit(SlowChirp,6,'Sine',20,.001,[5 10 15]);
%
	figure;
	subplot(2,1,1)
	plot(t,SlowChirp)
	title('SlowChirp: Chirp from 0 to 1/5 Nyquist');
	ax = axis;
	subplot(2,1,2)
	plot(t, r)
	title('Residual After 20 Iterations CPPursuit')
	axis(ax);

	ifprint(gcf,'mp_fig001.ps')
%
	figure;
	[a,r] = WPPrintPursuit(SlowChirp,D,qmf,20,.001,[5 10 15]);
%
	figure;
	subplot(2,1,1)
	plot(t,SlowChirp)
	title('SlowChirp: Chirp from 0 to 1/5 Nyquist');
	ax = axis;
	subplot(2,1,2)
	plot(t, r)
	title('Residual After 20 Iterations WPPursuit')
	ax = axis;
	ifprint(gcf,'mp_fig002.ps')
%
	figure;
	[cpatoms,cpresid] = CPPursuitTour('P',SlowChirp,6,'Sine',300,SigName);
	subplot(2,2,3)
	axis([0 500 0 10])
	
	ifprint(gcf,'mp_fig003.ps')

	figure;
	[wpatoms,wpresid] = WPPursuitTour('P',SlowChirp,10,qmf,300,SigName);
	subplot(2,2,3)
	axis([0 500 0 10])
	
	ifprint(gcf,'mp_fig004.ps')


    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
