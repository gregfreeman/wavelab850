% aifig3 -- AI Wavelets%% The result of average-interpolating a sequence which% consists of (-1,1) in a sea of zeros.%% global Fil2 Fil4 Fil6 Fil8global EdgeFil2 EdgeFil4 EdgeFil6 EdgeFil8%nref = 4;kronecker = zeros(1,32);kronecker(17) = -1; kronecker(18) = 1;%   a = kronecker;   for j=1:nref,      a = AIRefine(a,2,Fil2,EdgeFil2);    end;   t = 16*(0:(length(a)-1)) ./ length(a) -8;     versaplot(221,t,a,[],'3(a) AI Wavelet, D=2',[],[]) ;    a2 =a;%%  D=4%   a = kronecker;   for j=1:nref,      a = AIRefine(a,4,Fil4,EdgeFil4);    end;   versaplot(222,t,a,[],'3(b) AI Wavelet, D=4',[],[]);    a4=a;%%  D=6%   a = kronecker;   for j=1:nref,      a = AIRefine(a,6,Fil6,EdgeFil6);    end;   versaplot(223,t,a,[],'3(c) AI Wavelet, D=6',[],[]) ;    a6=a;%%  D=8%   kronecker = zeros(1,64);   kronecker(33) = -1; kronecker(34) = 1;   a = kronecker;   for j=1:nref,      a = AIRefine(a,8,Fil8,EdgeFil8);    end;   t = (0 : (length(a)-1)) .* 32 ./ (length(a)) - 16;   inx = (t >= -8) & (t < 8); a8=a;   versaplot(224,t(inx),a(inx),[],'3(d) AI Wavelet, D=8',[],[])         
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
