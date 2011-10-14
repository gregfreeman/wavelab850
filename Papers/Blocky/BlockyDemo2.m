% BlockyDemo -- Show Blocky Figs with Point & Click Interface%  To run, type BlockyDemoheader = 'Blocky Figures';labels = ['Change Settings' ; 'Run All Scripts' ; ...          'Run One Script ' ; 'Clean Up       '];callbacks = ['BlockyFig(19)'; 'BlockyFig(20)'; ...             'BlockyFig(21)'; 'BlockyCleanup'];global BLOCKYFIGNUM BLOCKYFIGNUM = 0;clc; help('BlockyIntro');%choices('Blocky',header,labels,callbacks);    NumberOfChoices=4;choice=0;while (choice<NumberOfChoices)    choice=menu(header,'Change Settings', 'Run All Scripts','Run One Script', 'Clean Up and Exit');    eval(callbacks(choice,:));endclear header labels callbacks     
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
