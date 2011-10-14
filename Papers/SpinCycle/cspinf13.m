% cspinf13 -- Ordinary Non-Spinning CP De-Noising
%
global t N D
global QuadChirp MishMash n
global xQuad yQuad
global xMish yMish
%
	D = 7;
	[cQuad,bQuad,sQuad]          = CPDeNoise(yQuad,D,'Sine');
	[cMish,bMish,sMish]          = CPDeNoise(yMish,D,'Sine');
%
%
% 	figure;
	axQuad = [.05 .35 -15 15]; axQErr = [.05 .35 -4 4];
	axMish = [.05 .35 -20 20]; axMErr = [.05 .35 -4 4];
	subplot(221);plot(t,cQuad); axis(axQuad);	title(' 13(a) SURE CP DeNoising, QuadChirp')
	subplot(222);plot(t,cMish); axis(axMish);	title(' 13(b) SURE CP DeNoising, MishMash')
	subplot(223);plot(t,cQuad-xQuad); axis(axQErr);	title(' 13(c) Error: SURE CP, Quad')
	subplot(224);plot(t,cMish-xMish); axis(axMErr);	title(' 13(d) Error: SURE CP, Mish')
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
