% toon0121 -- Wavelets Come in Genders
%
%  Father Wavelets are functions with nonvanishing integral,
%  which when restricted to unit scale, have integral 1.
%
%  Mother Wavelets have integral 0.
% 
	wMother = zeros(1,1024);
	wMother(dyad2ix(4,8)) = 1;
	wFather = zeros(1,1024);
	wFather(9) = 1;
%
	QMFD4 = MakeONFilter('Daubechies',4);
	x = IWT_PO(wMother,4,QMFD4);
	subplot(221);
	plot(t(300:800),x(300:800)); title(' Mother D4 Wavelet ');
%
	x = IWT_PO(wFather,4,QMFD4);
	subplot(223);
	plot(t(300:800),x(300:800)); title(' Father D4 Wavelet ');
%
	QMFSymm8 = MakeONFilter('Symmlet',8);
	x = IWT_PO(wMother,4,QMFSymm8);
	subplot(222);
	plot(t(300:800),x(300:800)); title(' Mother S8 Symmlet ');
%
	wFather([1 9]) =[1 0];   % extremely weird that we are forced to do this
	x = IWT_PO(wFather,4,QMFSymm8);
	subplot(224);
	plot(t(300:800),x(300:800)); title(' Father S8 Symmlet ');
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
