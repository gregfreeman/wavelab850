function x_use = Gen_data(i) 
 risk_global; 
if i == 0
   disp('Give file name ')
    file_name = input('NEW DATA FILE NAME ?','s' );
    if ~exist(file_name), break, end
    eval(['load ' file_name]);
    disp('Name of Data -- file name without extension')
    data_name = input('NAME OF DATA SET ?','s');
    x_use = eval(data_name);
end;
[ aa bb ] = size(x_use);
if (aa ~= 1),
  x_use = x_use';
  x_use = reshape(x_use,1,aa*bb);
end
x_use = ...
   x_use(1:2^(fix(log(length(x_use))/log(2) )));

n = length(x_use);
x_name = data_name;
x_length = n;
plot_newdata;

    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
