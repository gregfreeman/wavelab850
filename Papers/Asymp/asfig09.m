% asfig09 -- Asymptopia Figure 09: Comparison to Good-Gaskins Smoother
%  
% Here we illustrate the application of wavelet thresholding to Poisson
% Counts data. The Good-Gaskins 1980 scattering data are transformed by the Anscombe 
% variance-stabilizing transformation for poisson data, which are
% then processed exactly as if the data obeyed the white noise model.
%
% Note that for these data, the wavelet result is very closely comparable
% to the result that Good and Gaskins obtained by using computationally
% much more challenging methods.
%
%
	global t xh y rootgood
    
    	load scatter
	y = 2.*sqrt(scatter + .375);
	t =(-135):10:(-135+255*10); 
	QMF_Filter = MakeONFilter('Coiflet',3);
	[xh,wcoef] = WaveShrink(y,'Visu',5,QMF_Filter);
%
	%clf;  
    load goodfit;
	rootgood = 2*sqrt(goodfit+.375);

	versaplot(311,t,xh,[],'9 (a) Wavelet Shrinkage (-);  Good&Gaskins (..)',[],1)
	versaplot(311,t,rootgood,'-.',[],[],0)
	versaplot(312,t,xh-rootgood,[],'9 (b) Wavelet-Good&Gaskins'  ,[],[])
	versaplot(325,t,xh,[],'9 (c) Closeup ',[500 900 20 60],1);
	versaplot(325,t,rootgood,'-.',[],[],1);
	versaplot(325,t,y,'.',[],[],0);
	versaplot(326,t,xh,[],'9 (d) Closeup ',[1000 1400 20 40],1);
	versaplot(326,t,rootgood,'-.',[],[],1);
	versaplot(326,t,y,'.',[],[],0);
	
%  
% Prepared for the paper Wavelet Shrinkage: Asymptopia?
% Copyright (c) 1994 David L. Donoho and Iain M. Johnstone
% 

% 	Revision History
%		09/29/99	MRD		declared variables global 
%       10/1/05     AM      changeing the name of the variable QMF to QMF_Filter
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
