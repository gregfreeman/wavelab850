% INSTALLATION -- Installation of WaveLab
% 
% 	Unix Instructions:  
% 
% 	1. Binary Download the archive WaveLab850.tar.Z to, for example, /tmp
% 
% 	2. Uncompress the archive
% 
% 	3. Decide where you want the WaveLab Directory to reside.  It will have a
% 		number of subdirectories and occupy >2 MB disk space
% 
% 	4. cd to the place you want the directory to reside
%   
% 	5. ``tar xvf <WaveLabTarFile>'', where <WaveLabTarFile> should
% 		be the absolute pathname of the WaveLab.tar archive as you have
% 		obtained it by binary FTP
% 
% 		After you de-tar the file for your machine, you should have
% 		the following directory structure:
% 
%       WaveLab
%       WaveLab/Browsers/One-D
%       WaveLab/Brushlets
%       WaveLab/Continuous
%       WaveLab/Datasets
%       WaveLab/DeNoising
%       WaveLab/Documentation
%       WaveLab/FastAlgorithms
%       WaveLab/Interpolating
%       WaveLab/Meyer
%       WaveLab/Orthogonal
%       WaveLab/Packets
%       WaveLab/Packets2
%       WaveLab/Papers
%       WaveLab/Papers/Adapt
%       WaveLab/Papers/Asymp
%       WaveLab/Papers/Blocky
%       WaveLab/Papers/Ideal
%       WaveLab/Papers/MinEntSeg
%       WaveLab/Papers/ShortCourse
%       WaveLab/Papers/SpinCycle
%       WaveLab/Papers/Tour
%       WaveLab/Papers/VillardDeLans
%       WaveLab/Pursuit
%       WaveLab/Stationary
%       WaveLab/Steerable
%       WaveLab/Symmetric
%       WaveLab/Triadic
%       WaveLab/Utilities
%       WaveLab/Wigner
%       WaveLab/Workouts
%       WaveLab/Workouts/BestOrthoBasis
%       WaveLab/Workouts/MatchingPursuit
%       WaveLab/Workouts/MultiFractal
%       WaveLab/Workouts/Toons
% 
% 	6. Edit the file WavePath.m, put the lines:
% 
% 		if strcmp(Friend,'<YourMachineType>'),
% 			WAVELABPATH = '<AbsolutePathNameforWaveLabMainDirectory>' ;
% 			PATHNAMESEPARATOR = '<YourMachine*sPathSeparator>';
% 		end
% 
% 		in the appropriate place (this will be evident).
% 
% 		Here Friend has been set by the MATLAB command:
% 
% 			Friend = computer;
% 
% 	7. In your Home directory, in the matlab subdirectory,
% 		put a copy of startup.m and of WavePath.m
% 		
% 	8. cd to WaveLab/MEXSource
% 
% 	9. Type ``installMEX'' to compile and install the .mex files.
% 		If you have an older version of MATLAB, this command may yield
% 		compilation errors; in this case try ``installMEX.old'' instead
% 		
% 
% 	Trouble-Shooting UNIX:
% 
% 	Compare the output of ``ls -R WaveLab'' with Documentation/WLFiles.m to
% 	see if you have all the files
% 
% 	Compare the output of the MATLAB path functions with the list above to
% 	see if you have all the paths.
% 
% 
% 	Macintosh Instructions:
% 
% 	1. Binary Download the file WaveLab802.sea.hqx to your Macintosh
% 
% 	2. UnBinHex the file, creating a self-extracting archive
% 
% 	3. Double-click on the self-extracting archive and install it in the
% 		``Toolbox'' folder of your Matlab 4.1 folder
% 
% 	4. Using from the Mac Finder, determine if you have any files named
% 		startup.m (besides the one contained in WaveLab/) in the hierarchy
% 		rooted at Matlab.  If you don't, skip to step 6
% 
% 	5. If you do have more than one startup.m file, copy the contents of the
% 		startup.m in Matlab/Toolbox/WaveLab to the startup.m file, and rename
% 		the one if Matlab/Toolbox/WaveLab
% 
% 	6. Edit WavePath.m if your Matlab directory has a different pathname
% 		reference than the one supplied at the top of this file
% 
% 
% 	DOS Instructions:
% 
% 	1. Binary download the file wlab802.zip to your PC
% 
% 	2. cd to your toolbox folder in the Matlab folder
% 
% 	3. ``pkunzip -d wlab802.zip''
% 
% 	After you unzip you should have the following subdirectory structure:
% 
% 		wavelab
% 		wavelab\browsers\one-d
%       wavelab\brush
% 		wavelab\cont
% 		wavelab\datasets
% 		wavelab\denoise
% 		wavelab\doc
% 		wavelab\fastalg
% 		wavelab\interp
% 		wavelab\meyer
% 		wavelab\ortho
% 		wavelab\packets
% 		wavelab\packets2
% 		wavelab\papers
% 		wavelab\papers\adapt
% 		wavelab\papers\asymp
% 		wavelab\papers\blocky
% 		wavelab\papers\ideal
% 		wavelab\papers\mentseg
% 		wavelab\papers\shortcrs
% 		wavelab\papers\spincycl
% 		wavelab\papers\tour
% 		wavelab\papers\vdl
% 		wavelab\pursuit
% 		wavelab\station
%       wavelab\steer
% 		wavelab\symm
%       wavelab\triadic
% 		wavelab\util
% 		wavelab\workouts
% 		wavelab\workouts\bob
% 		wavelab\workouts\mp
% 		wavelab\workouts\multifrac
% 		wavelab\workouts\toons
% 
% 	4. ``copy c:\matlab\toolbox\wavelab\wavepath.m c:\matlab\bin''
% 
% 	5. Create a startup file in c:\matlab\bin which runs wavepath
% 		at startup time.
% 
% 	(4-5 alternate) Edit matlabrc.m to insert in the path all
% 		the directories referenced in wavepath.m
% 
% 	Trouble-Shooting DOS:
% 
% 	1. To check that you have every file that you should,
% 		look at doc\wlfiles.txt.  See if everything is there!
% 
% 	2. Check that while in matlab, the ``path'' function returns
% 		a list that looks like the one under item 3 above
    
    
%   
% Part of WaveLab Version 802
% Built Sunday, October 3, 1999 8:52:27 AM
% This is Copyrighted Material
% For Copying permissions see COPYING.m
% Comments? e-mail wavelab@stat.stanford.edu
%   
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
