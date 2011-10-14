function  mat = RAW2MAT(filename,lines,columns)

% RAW2MAT  mat = RAW2MAT(filename,lines,columns) loads a '.raw' file into
%          matrix 'mat' of size 'lines' * 'columns'.

  fid = fopen(filename,'r');
  mat = fread(fid,[columns,lines])';
  status = fclose(fid);
%  if status == 0
%    disp('successful')
%  else
%    disp('unsuccessful')
%  end
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
