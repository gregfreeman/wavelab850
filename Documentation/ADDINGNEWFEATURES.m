% ADDINGNEWFEATURES -- To Add New Features to WaveLab
%
%  NEW DATASETS:
%
%
%  New *1-d signal*: 
%
%  [1] Choose a *filename* (<= eight characters) and *file identifier*
%  (any length you like, for readability). Say that your filename
%  is "myownsig" and your identifier is "JoesVeryOwnSignal".
%
%  [2] Create an ascii data file named "myownsig.asc", which contains your
%  signal in vertical format (one number per line). 
%
%  [3] Create an ascii file named "myownsig.doc", explaining the name
%  shape, source, and other relevant facts about your data.
%  (See for example Datasets/caruso.asc and Datasets/caruso.doc)
%
%  [4] Add a fragment to ReadSignal.m recognizing the identifier.
%
%  [5] Also, update the help header of ReadSignal.m and
%  the failure diagnostic at the bottom of the file.
%
%
%  New *2-d Image*:
%
%  [1] decide on a *filename* (<= eight char.) and a *file identifier*
%  (any length you like, for readability). Say that your filename
%  is "myownimg" and your identifier is "CreationInMyOwnImage". 
%
%  [2] Create a raw binary file named "myownimg.raw" containing byte-codes
%  coding the gray level of each pixel, and 
%
%  [3] Create a .doc file. (e.g. mimic lincoln.doc), 
%
%  [4] Add a fragment to ReadImage.m recognizing the identifier.  
%
%  [5] Also, update the help header of ReadImage.m and
%  the failure diagnostic at the bottom of the file.
%
%
%  NEW SCRIPTS
%
%  To add new demonstration scripts to the scripts directory, having
%  the same format and effect as AdaptDemo, BlockyDemo, TourDemo,
%  SCDemo, and so on:
%
%  [1] Decide on a *Name* for your Demo and a *short prefix* for files
%      implementing your demo. For example, "MyOwnDemo" and "mo".
%
%  [2] Create a new subdirectory of WaveLab/Scripts. For Example,
%      "MyOwn".
%
%  [3] Create the following m-files.
%      MyOwnDemo    -- starts the Demonstration, invokes Choices
%      MyOwnInit    -- sets up data structures
%      MyOwnFig     -- called from Choices
%      MyOwnIntro   -- help file, explains contents of directories
%      MyOwnCleanup -- clears all globals created by the demo
%
%      Suggestion: copy the corresponding files in one of the other
%      subdirectories of Scripts into your new subdirectory, giving
%      them these names; then edit these files to refer to your own
%      new scripts.
%
%  [4] Create the scripts which implement your demo:
%      mofig1.m, mofig2.m, ....
%
%      These scripts need to follow these rules
%
%      Rule I.   One Script creates one complete figure, not a series
%                of figures, and not just a subplot of a figure.
%      Rule II.  If several scripts need to work with the same variables --
%                for example, if you want a variable to be created in
%                one script and then used in later scripts -- these variables
%                must be made global.
%      Rule III. No pauses or prints in a script.
%      Rule IV.  As far as possible try to use the tools in WaveLab
%                Utilities subdirectory to perform actions like setting axes
%
%      Inspection of existing scripts will help in following these rules.
%
%  If you obey these rules, then your scripts will be upward compatible
%  with script-running engines making more sophisticated applications of the 
%  Matlab user interface.
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
