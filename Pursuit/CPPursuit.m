function [atomic,res] = CPPursuit(x,D,bellname,natom,frac,show)
% CPPursuit -- Matching Pursuit with Cosine Packet Dictionary
%  Usage
%    atomic = CPPursuit(x,D,bell,natom,frac,show)
%  Inputs
%    x        1-d signal to be decomposed
%    natom    maximum number of atoms desired
%    frac     min fraction total signal energy to enter
%    D,bell   usual Cosine Packets parameters (Depth, name of bell)
%    show     plot intermediate results? [0=no,1=yes]
%  Outputs
%    atomic   parameters of atomic decomposition
%
%  See Also
%    PlotAtomicPhasePlane, CPImpulse, CPAnalysis
%

	n = length(x); nrm = norm(x);
	cp = CPAnalysis(x,D,'Sine');
	atomic = zeros(natom,4);
	res = ShapeAsRow(x); amax = max(abs(res)); t = (.5:(n-.5))./n;
	nuc = 0;
	amp = nrm;
%
	while(nuc < natom & amp > frac*nrm),
	
		 [amp,ind] = max(abs(cp(:)));           % find largest contribution
		 [d,b,k] = ix2pkt(ind,D,n);
		 a = cp(pkt2ix(d,b,k,D,n),d+1);
		 
		 fprintf('CPPursuit step %3.0f :',nuc+1); disp([ a d b k ])
		 
		 dcp = CPImpulse(cp,d,b,k,'Sine');      % remove single largest contribution
		 cp = cp - a.*dcp;

		 if amp==0, break, end
		 if show,
			res = MonitorPursuit('CP',nuc,t,amax,res,a,dcp,D,'Sine');
		 end

		 nuc = nuc + 1;
		 atomic(nuc,:) = [a d b k];             % store result
	end
%
	if show,
		 subplot(121); UnlockAxes;
		 subplot(122); UnlockAxes;
	else
		 res = CPSynthesis(zeros(1,2^D),cp(:,1),bellname);
    end

%
% Copyright (c) 1993. David L. Donoho
% 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
