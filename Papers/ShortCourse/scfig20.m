% scfig20 -- Short Course 20: Four Time-Frequency test signals
%
% We display here four signals used to study time-frequency DeNoising.
%
% QuadChirp: a quadratic chirp law
%
% MishMash: The superposition of QuadChirp with a linear chirp
%           and a high-frequency sinusoid.
% 
% Bumps:    Studied earlier (see Figures 5-9)
%
% Doppler:  Studied earlier (see Figures 5-9)
%
% We are interested in the extent to which one can recover
% oscillatory signals like QuadChirp and MishMash while still
% getting the advantages of wavelet reconstruction as in
% Bumps and Doppler
%
global yQuad yMish vBumps vDoppler tt
global xQuad xMish uBumps uDoppler
global rhoTFA
global nTFA
%
% 	clf;
	subplot(221); plot(tt,xQuad);    title(' 20 (a) QuadChirp ')
	subplot(222); plot(tt,xMish);    title(' 20 (b) MishMash ')
	subplot(223); plot(tt,uBumps);   title(' 20 (c) Bumps ')
	subplot(224); plot(tt,uDoppler); title(' 20 (d) Doppler ')
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
