function [sig,ord,aux] = MakeMESTestSig(Name,n)
% MakeMESTestSig -- Make MES Test Signal
%  Usage
%    [sig,ord,aux] = MakeMESTestSig(Name,n)
%

if strcmp(Name,'Bumps'),
	%
	%	Make Bumps Object
	%
		n   = 2048;
		ord = (0:(n-1))./n; 
		pos = [ .2 .23 .25 .33 .35 .50 .54 .65  .66 .68 .71];
		hgt = [ 4  5   3   4  5  4.2 2.1 4.3  3.1 5.1 4.2];
		wth = [.005 .005 .006 .01 .01 .03 .01 .01  .005 .008 .005];
		Bumps = 0.*ord;
		for j =1:length(pos)
		  Bumps = Bumps + hgt(j)./( 1 + abs((ord - pos(j))./wth(j))).^4;
		end
	sig = Bumps;
	aux = pos;

elseif strcmp(Name,'Ramp'),
	%
	% Make Ramp Signal
	%
		Ramp = zeros(1,n);
		t = .37; id = floor(t .* n); t = id /n;
		front = 1:id; back = (id+2):n; 
		eta = (t*n)-id;
		Ramp(front) = (front - .5)./(id);
		Ramp(back) = (back - (t .* n) - .5)./(n-id);
		Ramp(id+1) = (eta)*(1 + eta/(2*id)) + (1-eta)*((1-eta)/(2*(n-id)));
	sig = Ramp;
	ord = (1:n) ./ n;;
	aux = id;
elseif strcmp(Name,'Cusp'),

		Cusp = zeros(1,n);
		t = .37; id = floor(t .* n); t = id /n;
		front = 1:id; back = (id+2):n; 
		eta = (t*n)-id;	
		Cusp(front) = n .*(exp(-abs((1:id)./n  - t))-exp(-abs((0:(id-1))./n - t)));
		Cusp(back) = n .*(exp(-abs(((id+1):(n-1))./n - t))-exp(-abs(((id+2):n)./n-t)));
		Cusp(id+1) = n * ((1 - exp(-abs(id/n - t))) + (1 - exp(-abs((id+1)/n - t))));
	sig = Cusp;
	ord = t;
	aux = id;
elseif strcmp(Name,'Noise'),
		Noise = filter([1 1 1 1 1 1 1 1 1 1 1],1,WhiteNoise(zeros(1,n)));
		t = .37; id = floor(t .* n); t = id /n;
		front = 1:id; back = (id+2):n; 
		eta = (t*n)-id;	
		Cusp(front) = n .*(exp(-abs((1:id)./n  - t))-exp(-abs((0:(id-1))./n - t)));
		Cusp(back) = n .*(exp(-abs(((id+1):(n-1))./n - t))-exp(-abs(((id+2):n)./n-t)));
		Cusp(id+1) = n * ((1 - exp(-abs(id/n - t))) + (1 - exp(-abs((id+1)/n - t))));
		Noise = Noise(1:n) ./ 5 + Cusp;
	sig = Noise;
elseif strcmp(Name,'HeaviSine'),
		x = (0:(n-1)) ./ n;
		HeaviSine = - n.*(cos(4*pi .*(x+ 1/n)) - cos(4*pi .*x)) ./ pi;
		Jump = zeros(1,n);
		t = .37; id = floor(t .* n); t = id /n;
		front = 1:id; back = (id+2):n; 
		Jump(front) = - ones(1,length(front));
		Jump(back) = ones(1,length(back));
		Jump(id+1) = ((id+1) - n * t) - (n*t - id) ;
		HeaviSine = HeaviSine - Jump ;
	sig = HeaviSine;
else
	fprintf('Error in MakeMESTestSig: Unrecognised Name %s \n',Name)
end 

    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
