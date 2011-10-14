function Seg_Pursuit
% Seg_Pursuit -- Seg Pursuit
%
	global history
	global Bumps n ord
%
	D=2; F2 = MakeAIFilter(D);
	E2 = MakeAIBdryFilter(D);
	[R2,P2] = MakeAIRightFilter(D);
	L=5;
%
	if ~exist('JumpFigure'),
		JumpFigure = figure;
		ProgFigure = figure;
	end
	
	n = length(Bumps);
	r = Bumps;
	tlist = [];
	history = zeros(10,n);
	for iter=1:10,

		 figure(ProgFigure);
		 subplot(311);
		 plot(ord,r); title('residual'); drawnow
		 t0 = clock;
		 ECoeff  = FastAllSeg(r,L,D,R2);
		 wc      = FWT_AI(r,L,D,F2,E2);
		 t1 = clock; 
		 disp(sprintf('Elapsed Time at iteration %g: %g\n',iter,etime(t1,t0)))

		 EntType = 2; 
		 profile = FastEntProfile(wc,ECoeff,L,D,EntType);
		 subplot(312)
		 plot(ord,profile); 
		 miss = isnan(profile); 
		 
		 if ~isempty(find(miss)),
		   profile(find(miss)) = 100;%*ones(find(miss)); 
		 end
		 		 
		 [e,i] = min(profile); disp([e i])
		 axis([0 1 e max(e+2,2)])
		 tnext = (i-1)/n;
		 tlist = [tlist tnext];
		 figure(JumpFigure)
		 df = SharpPart(wc,ECoeff,L,D,F2,E2,tnext);
		 figure(ProgFigure);

		 subplot(313);
		 plot(ord, df);
		 title(sprintf('Term at iteration %g',iter));
		 history(iter,:) = df(:)';
		 r = r-df;
		 drawnow;
	end
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
