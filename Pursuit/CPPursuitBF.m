function [atomic,normres] = CPPursuitBF(x,D,bellname,natom,frac,show)
% CPPursuitBF -- Matching Pursuit using Cosine Packet Dictionary with backfitting
%  Usage
%    atomic = CPPursuitBF(x,D,bell,natom,frac,show)
%  Inputs
%    x        1-d signal to be decomposed
%    natom    maximum number of atoms desired
%    frac     min fraction total signal energy to enter
%    D,bell   usual Cosine Packets parameters (Depth, name of bell)
%    show     plot intermediate results? 0=no, 1=yes
%  Outputs
%    atomic   parameters of atomic decomposition [a l b k]
%    normres  norm of residules from each step
%
%  Side Effects
%    If show=1, intermediate results are plotted
%
%  See Also
%    PlotAtomicPhasePlane, CPImpulse, CPAnalysis, CPPursuit
%
	x = x(:)';
	amax = max(abs(x));
	n = length(x); nrm = norm(x);
	cp = CPAnalysis(x,D,'Sine');

	% Initialization
	cpres = cp;
	atomic = zeros(1, 4);
	res = x; amax = max(abs(res)); t = (.5:(n-.5))./n;
	nuc = 0;
	amp = nrm;
	nplot = 0;
	normres = [norm(res)];
	GramInvNew = zeros(natom);
	basis = zeros(natom, n);
	pktype = 'Sine';

	while(nuc < natom & amp > frac*nrm),
		 cpres = cpres(:);
		 [amp,ind] = max(abs(cpres));
	         if amp==0, break, end
		 [l,b,k] = ix2pkt(ind,D,n);
		 a = cpres(ind);
		 fprintf('CPPursuitBF step %3.0f :',nuc); 
		 dcp = CPImpulse(cp,l,b,k,'Sine');
		 newterm = CPSynthesis(zeros(1,2^D),dcp,'Sine');

		% [atomic basis nuc cpres] = update(atomic basis nuc cp);

		 if nuc == 0,

			%Initialize everything
			GramInvNew(1,1) = 1;
			basis(1,:) = newterm;
			atomic(1,:) = [a l b k];
			nuc = 1;
			GramInv = GramInvNew(1,1);
			X = basis(1,:)';
			CoefNew = a;
			
		 else

			% Update the Inverse of the Gram Matrix
			 Q = GramInv * X' * newterm';
			 m = 1 / (newterm * newterm' ...
				- newterm * X * GramInv * X' * newterm');
			 GramInvNew(1:nuc, 1:nuc) = GramInv + Q * Q' * m;
			 GramInvNew(1:nuc, nuc+1) =  - Q * m;
			 GramInvNew(nuc+1, 1:nuc) =  - Q' * m;
			 GramInvNew(nuc+1, nuc+1) = m;

			% Update everything
			 nuc = nuc + 1;
			 GramInv = GramInvNew(1:nuc, 1:nuc);
			 basis(nuc,:) = newterm;
			 X = (basis(1:nuc, :))';
			 CoefNew = GramInv * X' * x';
			 atomic(nuc,:) = [a l b k];
			 atomic(1:nuc, 1) = CoefNew;
		 end

		% CP of the residual
		 res = x - CoefNew' * basis(1:nuc,:);
		 normres = [normres norm(res)];
		 cpres = CPAnalysis(res, D, 'Sine');
		 disp([ a l b k norm(res)])


		% if show
		if show,
		  nucold = nuc -1;
		  if rem(nucold,5) == 0,
		        clf; 
		        subplot(121); LockAxes([0 1 nucold nucold+6]); 
		        title(sprintf('Terms to enter at steps (%g:%g)',nucold+1,nucold+5));
		        subplot(122); LockAxes([0 1 nucold nucold+6]); 
		        title(sprintf('Residuals at steps (%g:%g)',nucold+1,nucold+5));
		  end

		  subplot(121); plot(t, nucold + 1 + newterm .* ( a/(3*amax)));
		  subplot(122); plot(t, nucold + 1 +  res ./(3*amax));
		  drawnow;
		end
	end



%
% Copyright 1994. Shaobing Chen and David Donoho
%
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
