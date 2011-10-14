% toon0431 -- Compare First-n and Best-n Compression Numbers
%                          of Four Objects
%
%  First plot the four signals that will be used in this example.
%
	n = 2048;
	Bumps     = MakeSignal('Bumps',n);
	Doppler   = MakeSignal('Doppler',n);
	HeaviSine = MakeSignal('HeaviSine',n);
	Blocks    = MakeSignal('Blocks',n);
	t         = (1:n)./n;
%
	subplot(221); plot(t,Blocks);
	title('Blocks')
%
	subplot(222); plot(t,Bumps);
	title('Bumps')
%
	subplot(223); plot(t,HeaviSine);
	title('HeaviSine')
%
	subplot(224); plot(t,Doppler);
	title('Doppler')
    
    

 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
