function x = WPSynthesis(basis,pkt,qmf)
% WPSynthesis -- Synthesize signal from wavelet packet coefficients
%  Usage
%    x = WPSynthesis(btree,wp,qmf)
%  Inputs
%     btree    basis tree indicating wavelet packet to use
%     wp       wavelet packet table
%     qmf      quadrature mirror filter
%  Outputs
%     x        1-d signal whose wavelet packet coefft's in
%              basis btree are in wp
%
%  Examples
%     [n,D] = dyadlength(signal);
%     qmf = MakeONFilter('Haar');
%     wp = WPAnalysis(signal,D,qmf);
%     stree = CalcStatTree(wp,'Entropy');
%     [btree,vtree] = BestBasis(stree,D);
%     signal2 = WPSynthesis(btree,wp,qmf); % signal == signal2

	[n,L] = size(pkt);
	wp = pkt;
%
% initialize tree traversal stack
%
	stack = zeros(3,2^L);
	k = 1;
	stack(:,k) = [0 0 0 ]';
%
	while(k > 0),
		d = stack(1,k); b = stack(2,k); marked = stack(3,k); k=k-1;
		if(basis(node(d,b)) ~= 0) ,  % nonterminal node
		   if(marked == 0),
			   k = k+1; stack(:,k) = [d b 1]';
			   k = k+1; stack(:,k) = [(d+1) (2*b) 0]';
			   k = k+1; stack(:,k) = [(d+1) (2*b+1) 0]';
		   else
			   lson = rem(b,2);
			   lpchan = wp(packet(d+1,2*b+lson    ,n),d+2)';
			   hpchan = wp(packet(d+1,2*b+(1-lson),n),d+2)';
			   s = UpDyadHi(hpchan,qmf) + UpDyadLo(lpchan,qmf);
			   wp(packet(d,b,n),d+1) = s';
		   end         
		 end
	end
	x = wp(:,1)';

%
% Copyright (c) 1993. David L. Donoho
%     
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
