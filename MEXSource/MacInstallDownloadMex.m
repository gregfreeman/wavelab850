% MacInstallDownloadMex -- Install Macintosh Mex Files Downloaded from Web
%
%	(0) Install Wavelab on your mac
%	(1)	Download the mex file archive from
%		http://www-stat.stanford.edu/~wavelab/mexlib/mexmacos.sea.hqx
%	(2)	unbinhex the file, creating mexmacos.sea
%	(3) in the finder, double click on  mexmacos.sea
%	(4) Stuffit will present a window asking where
%		you want to install the mex files
%		Place the mex files in the MexSource subfolder of your Wavelab folder,
%		creating this folderif need be
%	(5) startup matlab
%	(6) Invoke this script in matlab
%
	global WAVELABPATH
	cd([WAVELABPATH 'MexSource'])
	
  Friend = computer;
  isPC = 0; isMAC = 0;
  if strcmp(Friend(1:2),'PC')
    isPC = 1;
  elseif strcmp(Friend,'MAC2')
    isMAC = 1;
  end
  
  if ~isMAC,
  	fprintf('Huh? this is supposed to be Macintosh -- Mex install aborted')
  end
  
    acopy('CPAnalysis.mex', '::Packets:One-D')
    acopy('WPAnalysis.mex' ,'::Packets:One-D')
    acopy('FWT_PO.mex' ,'::Orthogonal')
    acopy('FWT2_PO.mex' ,'::Orthogonal')
    acopy('IWT_PO.mex' ,'::Orthogonal')
    acopy('IWT2_PO.mex' ,'::Orthogonal')
    acopy('UpDyadHi.mex' ,'::Orthogonal')
    acopy('UpDyadLo.mex' ,'::Orthogonal')
    acopy('DownDyadHi.mex' ,'::Orthogonal')
    acopy('DownDyadLo.mex' ,'::Orthogonal')
    acopy('dct_iv.mex' ,'::Packets:One-D')
    acopy('FCPSynthesis.mex' ,'::Pursuit')
    acopy('FWPSynthesis.mex' ,'::Pursuit')
    acopy('FastAllSeg.mex' ,'::Papers:MinEntSeg')
    acopy('FastEntProfile.mex' ,'::Papers:MinEntSeg')
    acopy('off_filter.mex' ,'::Papers:MinEntSeg')
    acopy('dct_ii.mex' ,'::Meyer')
    acopy('dst_ii.mex' ,'::Meyer')
    acopy('dct_iii.mex' ,'::Meyer')
    acopy('dst_iii.mex' ,'::Meyer')
    acopy('FWT_PBS.mex' ,'::Biorthogonal')
    acopy('IWT_PBS.mex' ,'::Biorthogonal')
    acopy('FWT_TI.mex' ,'::Invariant')
    acopy('IWT_TI.mex' ,'::Invariant')
    acopy('FMIPT.mex' ,'::Median')
    acopy('IMIPT.mex' ,'::Median')
    acopy('FAIPT.mex' ,'::Papers:MIPT')
    acopy('IAIPT.mex' ,'::Papers:MIPT')
    acopy('LMIRefineSeq.mex' ,'::Papers:MIPT')
    acopy('MedRefineSeq.mex' ,'::Papers:MIPT')
  eval(sprintf('cd ''%s''', WAVELABPATH));

	clear isPC isMAC