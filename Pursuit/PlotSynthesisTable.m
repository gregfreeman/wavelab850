function PlotSynthesisTable(TfType,atomlist,n,D,scal,tit)
% PlotSynthesisTable -- Display entries in atomlist as WP or CP table
%  Usage
%    MakeSynthesisTable(TFType,atomic,n,D,scal,ttl)
%  Inputs
%    TFType	  string, 'WP' or 'CP' indicating type of atom
%    atomic	  atoms from wavelet packet or cosine packet table
%    n,D      usual packet table parameters (from which atoms are taken)
%    scal     optional scaling factor (0 => autoscale)
%    ttl      optional title
%
%  Side Effects
%    spike plot of coefficients in synthesis table
%
%  See Also
%    MakeSynthesisTable, PlotPacket Table
%
		pkt = MakeSynthesisTable(atomlist,zeros(n,D+1));
%
		if nargin < 5,
			PlotPacketTable(pkt);
		else
			PlotPacketTable(pkt,scal);
		end
%
		if strcmp(TfType,'WP'),
			xlabel('Frequency[Time]')
	    else
			xlabel('Time[Frequency]')
	    end
%
     	ylabel('depth d')
		title(sprintf('Synthesis Table %s',tit))
		drawnow;
    
    

 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
