function sig = MakeChirps(Name,N);
%
% MakeChirps -- Make artificial chirp signal
% Usage
%   sig = MakeSignal(Name,N)
% Inputs
%   Name   string: 'HypChirps','LinChirps','Chirps'
%   N      desired signal length
%


	
	if strcmp(Name,'HypChirps'),
		alpha	= 15*N*pi/1024;
		beta    = 5*N*pi/1024;
		t  	= (1.001:1:N+.001)./N; 
		f1      = zeros(1,N);
		f2      = zeros(1,N);	
		f1  	= sin(alpha./(.8-t)).*(0.1<t).*(t<0.68);
		f2  	= sin(beta./(.8-t)).*(0.1<t).*(t<0.75);
		M  	= round(0.65*N);
		P 	= floor(M/4);
		enveloppe = ones(1,M); % the rising cutoff function 
            enveloppe(1:P) = (1+sin(-pi/2+((1:P)-ones(1,P))./(P-1)*pi))/2;
            enveloppe(M-P+1:M) = reverse(enveloppe(1:P));
  		env 	= zeros(1,N);
  		env(ceil(N/10):M+ceil(N/10)-1) = enveloppe(1:M);
		sig     = (f1+f2).*env;
	elseif strcmp(Name,'LinChirps'),
		b 	= 100*N*pi/1024;
		a 	= 250*N*pi/1024;
		t 	= (1:N)./N; 
		A1 	= sqrt((t-1/N).*(1-t));
		sig	= A1.*(cos((a*(t).^2)) + cos((b*t+a*(t).^2)));
	elseif strcmp(Name,'Chirps'),
		t 	= (1:N)./N.*10.*pi;  
  		f1 	= cos(t.^2*N/1024);
		a 	= 30*N/1024;
  		t 	= (1:N)./N.*pi;  
  		f2 	= cos(a.*(t.^3));
  		f2 	= reverse(f2);
		ix 	= (-N:N)./N.*20;
 		g 	= exp(-ix.^2*4*N/1024);
		i1 	= (N/2+1:N/2+N);
		i2 	= (N/8+1:N/8+N);
		j  	= (1:N)/N;
    		f3 	= g(i1).*cos(50.*pi.*j*N/1024);
		f4 	= g(i2).*cos(350.*pi.*j*N/1024);
		sig 	= f1+f2+f3+f4;
   	enveloppe = ones(1,N); % the rising cutoff function 
  	enveloppe(1:N/8) = (1+sin(-pi/2+((1:N/8)-ones(1,N/8))./(N/8-1)*pi))/2;
  	enveloppe(7*N/8+1:N) = reverse(enveloppe(1:N/8));
 		sig 	= sig.*enveloppe;
	end;
	      
% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:38 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
