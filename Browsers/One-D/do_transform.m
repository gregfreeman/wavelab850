function do_transform(type)
% do_transform -- Called by WLBrowser
%  Usage
%    do_transform(type)
%
global x_use noise_type x_noise
global QMF_Filter Empty_Data

fprintf('in do_transform, %s\n',type);
tok = type(1:2);
	if     strcmp(tok,'sq'),
	    x_use = sqrt(abs(x_use));
	elseif strcmp(tok,'lo'),
	    x_use = log(abs(x_use)+eps);
	elseif strcmp(tok,'Fr'),
	    x_use = 2 .* sqrt(abs(x_use + .375));
	elseif strcmp(tok,'Gr'),
	    x_use = sqrt(6/pi) * log(abs(x_use)+eps);
	elseif strcmp(tok,'no'),
	    if noise_type == 2,
		    x_noise = rand(size(x_use));
		else
		    x_noise = randn(size(x_use)); 
		end
	    x_use = x_use + x_noise;
	else
		if ~exist('QMF_Filter'),
		   QMF_Filter = MakeONFilter('Coiflet',3);
		end
		x_use = NormNoise(x_use,QMF_Filter);
	end

plot_new_data;

%  Revision History
%             10/1/05     AM     the name of the variable QMF is changed to
%                                 QMF filter

    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
