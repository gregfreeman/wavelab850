function out = DiscrDenoise(btree,wp1,Exploded,thresh,thresh_max,qmf,D)
% DiscrDenoise -- Denoising of inverse filtered signal
%		in best discriminant basis
%  Usage
% out = DiscrDenoise(btree,Exploded,thresh,qmf)
%
%  See Also
%    WPAnalysis, DisBasis, Discr
%

	n=length(Exploded);
	wp = WPAnalysis(Exploded,D,qmf);
	wpout=wp-wp;


	for d=0:D,
	  for b=0:(2^d-1),
	    if (thresh_max(node(d,b)) < max(max(wp1(packet(d,b,n),d+1))))
		wpout(packet(d,b,n),d+1)=SoftThresh(wp(packet(d,b,n),d+1),thresh(node(d,b)));
	    end
	  end
	end

	out = WPSynthesis(btree,wpout,qmf);    


% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr

    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
