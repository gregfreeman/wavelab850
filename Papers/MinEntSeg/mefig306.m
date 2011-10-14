% mefig306 -- Ideal and SURE Risk Profiles, objects "Ramp," "Cusp" 
%
% In this display, we show the behavior of two special entropies
% for objects "Ramp" and "Cusp".  The first, ideal risk, is applied
% to noiseless data, and measures the mean-squared error of reconstruction
% using an ideal keep-kill estimator.  The second, SURE, is applied
% to noisy data and estimates the MSE of reconstruction using a soft
% threshold rule.
%
%  3.6a ideal/RAMP
%  3.6b ideal/CUSP
%  3.6c SURE/RAMP
%  3.6d SURE/CUSP
%
	global Ramp Cusp
	global id n
%
  t=id/n;   %AM 10/05
	%clf;
	plotnum = 1;
	amp = 5;
%
	L=4; D=2; 
	F2 = MakeAIFilter(D);
	E2 = MakeAIBdryFilter(D);
%
 ObNames = [ 'Clean' ; 'Noisy'];
 SiNames = [ 'Ramp'  ; 'Cusp'];
 for nObj = 1:2,
	for nNam = 1:2,
	  Objective = ObNames(nObj,:),
	  Name      = SiNames(nNam,:),
	  if strcmp(Name,'Ramp'),
	     obj = Ramp;
	  else
	     obj = Cusp;
	  end

	  if strcmp(Objective,'Clean'),
	     data = amp .* obj;
	  else
	     data = amp .* obj +  WhiteNoise(obj);
	  end
	
	  wc = FWT_AI(data,L,D,F2,E2);
	
	  if strcmp(Objective,'Noisy') ,  %SURE
	     thr = sqrt(2 .* log(n));
	     p = wc.^2; tt = thr^2;
	     ngt = sum( p > tt);
	     nlt = n - ngt;
	     slt = sum( p .* ( p <= tt )); 
	     eord = n - 2*nlt + tt*ngt + slt;
	     irisk = zeros(1,16); 
	     for spot = (id-8):(id+7),
	       tt = spot / n; 
	       wc = FWT_SegAI(data,L,D,F2,E2,tt);
	       p = wc.^2;
	       ngt = sum( p > tt);
	       nlt = n - ngt;
	       slt = sum( p .* ( p <= tt ));
	       eort = n - 2*nlt + tt*ngt + slt;
	       irisk(9+spot-id) = eort;
	     end
		 subplot(2,2,plotnum); 
		 plotnum=plotnum+1;
	     plot((id-8):(id+7),irisk)
	     if strcmp(Name,'Ramp'),
	         FigNo = '3.6c';
	     else
	         FigNo = '3.6d';
	     end
	     tit =  [ FigNo ' SURE Measure, t=k/n, ideal = %g' ] ;
	     tit = sprintf(tit,id);
	     title(tit)
	     xlabel('k')
	     ylabel('SURE(k)')
	   else
	     thr = sqrt(2 .* log(n));
	     p = wc.^2; tt = thr^2;
	     ngt = sum( p > tt);
	     slt = sum( p .* ( p <= tt )); 
	     eord = ngt+slt;
	     irisk = zeros(1,16); 
	     id = floor(t .* n);
	     for spot = (id-8):(id+7),
	       tt = spot / n; 
	       wc = FWT_SegAI(data,L,D,F2,E2,tt);
	       p = wc.^2;
	       ngt = sum( p > tt);
	       slt = sum( p .* ( p <= tt )); 
	       eort = ngt+slt;
	       irisk(9+spot-id) = eort;
	     end
		 subplot(2,2,plotnum); plotnum = plotnum+1;
	     plot((id-8):(id+7),irisk)
	     if strcmp(Name,'Ramp'),
	         FigNo = '3.6a';
	     else
	         FigNo = '3.6b';
	     end
	     tit =  [ FigNo ' Risk Measure, t=k/n, ideal = %g' ]
	     tit = sprintf(tit,id);
		 title(tit)
	     xlabel('k')
	     ylabel('Risk(k)')
	  end
	  drawnow;
  end % Cusp,Ramp
end %Clean,Noisy





%  
% Prepared for the paper Minimum Entropy Segmentation 
% Copyright (c) 1994 David L. Donoho
%  
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
