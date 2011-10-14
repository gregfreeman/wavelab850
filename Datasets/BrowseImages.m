function BrowseImages
% BrowseImages -- Show Images with Point & Click Interface
%  Usage
%    BrowseImages
%
%  Description
%    A choices menu appears on the screen, you select your choice
%    and see an image display of the corresponding image.
%
	global ImageNAMES
	header = 'Images in WaveLab';
	ImageNAMES = strvcat( 'Barton     ','Canaletto  ','Coifman    ', ...
                          'Daubechies ','Fingerprint','Lenna      ', ...
                          'Lincoln    ','MRIScan    ','Phone      ', ...
	                      'Slide Show ');
	callbacks = ['ImageFig(01)'; 'ImageFig(02)'; 'ImageFig(03)'; ...     
	             'ImageFig(04)'; 'ImageFig(05)'; 'ImageFig(06)'; ...
				 'ImageFig(07)'; 'ImageFig(08)'; 'ImageFig(09)'; ...
				 'Imagefig(10)'; 'ImageFig(11)'];
%	clc; help('ImageIntro')
	choices('Image',header,ImageNAMES,callbacks,'yes');
 length skellen(k)
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
