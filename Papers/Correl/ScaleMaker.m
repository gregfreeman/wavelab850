function scalvec = ScaleMaker(wc,L,fname)
% ScaleMaker -- Calculate level dependent estimates of scale
%  Usage
%     scalvec = ScaleMaker(wc,L,fname)
% 
%  Inputs
%     wc	wavelet coefficients from an orthogonal wavelet transform
%     L         Low-Frequency cutoff for calculating scales
%     fname	string giving name of function to calculate measure of
%		  scale (e.g. 'std', 'MAD')
% 
%  Outputs 
%     scalvec	vector of length J-1, with scale estimates in for
%		  levels L:(J-1) in the corresponding slots
%
%  Description
%     calculate level dependent estimates of scale, using user specified
%     scale measure (in fname) 

[n,J] = dyadlength(wc);
scalvec =  zeros( size(1:(J-1)) );

for i = L:(J-1)
        scalvec(i) = eval( [ fname '(wc(dyad(i)))' ] );
end

    
    

    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
