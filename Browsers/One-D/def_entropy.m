function def_entropy(kk)
% def_entropy -- Called by WLBrowser
%  Usage
%    def_entropy(kk)
%  Inputs
%    kk    type of entropy:
%            1    'Entropy'
%            2    'l^p'
%            3    'N(eps)'
%            4    'Risk'
%            5    'SURE'
%

global ent_type ent_par
global h_entmenu

for i=1:5,
   set(h_entmenu(i),'Checked','off')
end
set(h_entmenu(kk),'Checked','on')

if kk==1,
	ent_type = 'Entropy';
	ent_par = 0.;
elseif kk==2,
    ent_type = 'l^p';
	ent_par  = 1; 
elseif kk==3,
    ent_type = 'N(eps)';
	ent_par  = 1;
elseif kk==4,
    ent_type = 'Risk';
	ent_par  = namp;
elseif kk==5,
    ent_type = 'SURE';
	ent_par  = namp;
end

    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
