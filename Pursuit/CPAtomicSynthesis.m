function sig = CPAtomicSynthesis(atomic,cp,bell)
% CPAtomicSynthesis -- Generate signal from list of CP-components
%  Usage
%    sig = CPAtomicSynthesis(atoms,cp,bell)
% Inputs
%    atoms    list of 1-d time-frequency atoms in CP space
%    cp       cosine packet table (from which atoms are taken)
%    bell     bellname (e.g. 'Sine') 
% Outputs
%    sig      the superposition of the CP-components
%
% See Also
%      CPPursuit, CPImpulse
%

	[natom,ncharm] = size(atomic);
	[n,L] = size(cp);
	sig = zeros(1,n);
	for j=1:natom,
		a = atomic(j,1); d = atomic(j,2); 
		b = atomic(j,3); k = atomic(j,4);
		if a ~= 0, 
		   dcp = CPImpulse(cp,d,b,k,bell);
		   sig = sig + a .* dcp(:,1)';
		end    
	end
    sig = dct_iv(sig);

%
% Copyright (c) 1993. David L. Donoho
% 
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
