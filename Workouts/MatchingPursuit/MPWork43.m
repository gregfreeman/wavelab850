% MPWork43 -- Matching-Pursuit, WP and CP Tours on Transients Signal
%
	qmf = MakeONFilter('Coiflet',3);
%
	figure;
	% tr = MakeExample('transients');
        tr = ReadSignal('Transients');
	SigName = 'Transients';
	[wpatoms,wpresid] = WPPursuitTour('P',tr,9,     qmf,300,SigName);
	subplot(2,2,3); axis([0 500 -5 5])
	subplot(2,2,4); brighten(-.5)
	ifprint(gcf,'mpfig431.ps');
%
	figure;
	[cpatoms,cpresid] = CPPursuitTour('P',tr, 6,'Sine', 300,SigName);
	subplot(2,2,3); axis([0 500 -5 5])
	subplot(2,2,4); brighten(-.5)
	ifprint(gcf,'mpfig432.ps');
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
