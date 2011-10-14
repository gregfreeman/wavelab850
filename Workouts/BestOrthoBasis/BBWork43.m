% BBWork43 -- WP and CP Tours on Transients Signal
%
	figure;
        tr = ReadSignal('Transients');
	WPTour('P', tr,9,MakeONFilter('Coiflet',3),'Transient');
	subplot(2,2,3); axis([0 500 -5 5])
	subplot(2,2,4); brighten(-.5)
	ifprint(gcf,'bbwork431.ps');
%
	figure;
	CPTour('P', tr,6,'Transient');
	subplot(2,2,3); axis([0 500 -5 5])
	subplot(2,2,4); brighten(-.5)
	ifprint(gcf,'bbwork432.ps');
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
