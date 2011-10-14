function  MAT2RAW(filename,x)

% MAT2RAW  MAT2RAW(filename,x) writes matrix 'x' into file 'filename' in
%          'raw' form.

  [s1,s2]=size(x);
  for i=1:s1
	for j=1:s2
		if x(i,j)<0 x(i,j)=0;end;
		if x(i,j)>255 x(i,j)=255;end;
	end
  end
		
  fid = fopen(filename,'w');
  count = fwrite(fid,x','char')
  status = fclose(fid);
  if status == 0
    disp('successful')
  else
    disp('unsuccessful')
  end
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
