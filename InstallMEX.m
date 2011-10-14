function InstallMEX

global WAVELABPATH

MEX_OK = 1;

% Check if all the MEX files are installed
for file={'CPAnalysis' 'WPAnalysis' 'FWT_PO' 'FWT2_PO' 'IWT_PO' ...
      'IWT2_PO' 'UpDyadHi' 'UpDyadLo' 'DownDyadHi' 'DownDyadLo' 'dct_iv' ...
      'FCPSynthesis' 'FWPSynthesis' ...
      'dct_ii' 'dst_ii' 'dct_iii' 'dst_iii' ...
      'FWT_PBS' 'IWT_PBS' ...
      'FWT_TI' 'IWT_TI' ...
      'FMIPT' 'IMIPT' ...
      'FAIPT' 'IAIPT' 'LMIRefineSeq' 'MedRefineSeq'}
  
  file = char(file);
  if exist(file)~=3,
    MEX_OK = 0;
    break;
  end
end

% If not, install...
if ~MEX_OK,
  disp('WaveLab detects that some or all of your MEX files are not installed,')
  R=input('do you want to install them now? [[Yes]/No] \n','s');
if strcmp(R,'') + strcmp(R,'Yes') | strcmp(R,'yes') | strcmp(R,'y') | strcmp(R,'Y') | strcmp(R,'YES'), 
  disp('INSTALLING MEX FILES, MAY TAKE A WHILE ...')
  disp(' ')
  disp('WaveLab assumes that your mex compiler is properly installed.')
  disp('In particular, you should be able to call mex.m within matlab')
  disp('to compile a mex file.')
  disp('Consult your system administrator if not.')
  disp(' ')      
  FIRST_COMPILE = 0;
  
  eval(sprintf('cd ''%sMEXSource''', WAVELABPATH));
  
  for file={'CPAnalysis' 'WPAnalysis' 'FWT_PO' 'FWT2_PO' 'IWT_PO' ...
	'IWT2_PO' 'UpDyadHi' 'UpDyadLo' 'DownDyadHi' 'DownDyadLo' 'dct_iv' ...
	'FCPSynthesis' 'FWPSynthesis' ...
	'dct_ii' 'dst_ii' 'dct_iii' 'dst_iii' ...
	'FWT_PBS' 'IWT_PBS' ...
	'FWT_TI' 'IWT_TI' ...
	'FMIPT' 'IMIPT' ...
	'FAIPT' 'IAIPT' 'LMIRefineSeq' 'MedRefineSeq'}
  
    file = char(file);
    disp(sprintf('%s.c',file));
    eval(sprintf('mex %s.c',file));
  end

  Friend = computer;
  isPC = 0; isMAC = 0;
  if strcmp(Friend(1:2),'PC')
    isPC = 1;
  elseif strcmp(Friend,'MAC2')
    isMAC = 1;
  end
  
  if isunix,
    !mv CPAnalysis.mex* ../Packets/One-D
    !mv WPAnalysis.mex* ../Packets/One-D
    !mv FWT_PO.mex* ../Orthogonal
    !mv FWT2_PO.mex* ../Orthogonal
    !mv IWT_PO.mex* ../Orthogonal
    !mv IWT2_PO.mex* ../Orthogonal
    !mv UpDyadHi.mex* ../Orthogonal
    !mv UpDyadLo.mex* ../Orthogonal
    !mv DownDyadHi.mex* ../Orthogonal
    !mv DownDyadLo.mex* ../Orthogonal
    !mv dct_iv.mex* ../Packets/One-D
    !mv FCPSynthesis.mex* ../Pursuit
    !mv FWPSynthesis.mex* ../Pursuit
    !mv dct_ii.mex* ../Meyer
    !mv dst_ii.mex* ../Meyer
    !mv dct_iii.mex* ../Meyer
    !mv dst_iii.mex* ../Meyer
    !mv FWT_PBS.mex* ../Biorthogonal
    !mv IWT_PBS.mex* ../Biorthogonal
    !mv FWT_TI.mex* ../Invariant
    !mv IWT_TI.mex* ../Invariant
    !mv FMIPT.mex* ../Median 
    !mv IMIPT.mex* ../Median
    !mv FAIPT.mex* ../Papers/MIPT
    !mv IAIPT.mex* ../Papers/MIPT
    !mv LMIRefineSeq.mex* ../Papers/MIPT
    !mv MedRefineSeq.mex* ../Papers/MIPT
  elseif isPC,
    dos('move CPAnalysis.dll ..\Packets\One-D');
    dos('move WPAnalysis.dll ..\Packets\One-D');
    dos('move FWT_PO.dll ..\Orthogonal');
    dos('move FWT2_PO.dll ..\Orthogonal');
    dos('move IWT_PO.dll ..\Orthogonal');
    dos('move IWT2_PO.dll ..\Orthogonal');
    dos('move UpDyadHi.dll ..\Orthogonal');
    dos('move UpDyadLo.dll ..\Orthogonal');
    dos('move DownDyadHi.dll ..\Orthogonal');
    dos('move DownDyadLo.dll ..\Orthogonal');
    dos('move dct_iv.dll ..\Packets\One-D');
    dos('move FCPSynthesis.dll ..\Pursuit');
    dos('move FWPSynthesis.dll ..\Pursuit');
    dos('move dct_ii.dll ..\Meyer');
    dos('move dst_ii.dll ..\Meyer');
    dos('move dct_iii.dll ..\Meyer');
    dos('move dst_iii.dll ..\Meyer');
    dos('move FWT_PBS.dll ..\Biorthogonal');
    dos('move IWT_PBS.dll ..\Biorthogonal');
    dos('move FWT_TI.dll ..\Invariant');
    dos('move IWT_TI.dll ..\Invariant');
    dos('move FMIPT.dll ..\Median ');
    dos('move IMIPT.dll ..\Median');
    dos('move FAIPT.dll ..\Papers\MIPT');
    dos('move IAIPT.dll ..\Papers\MIPT');
    dos('move LMIRefineSeq.dll ..\Papers\MIPT');
    dos('move MedRefineSeq.dll ..\Papers\MIPT');
  elseif isMAC,
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
  end
end
end

eval(sprintf('cd ''%s''', WAVELABPATH));

clear MEX_OK isPC R
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
