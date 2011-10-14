function TriMergeSort(j)
% 
%        
        global SORTX
	
	N = length(SORTX);
	J = log(N)/log(3);
	blocklength = round(3^(J-j));
	numblock = N/blocklength;
	
	start = 0;
	
	INFINITY = max(SORTX) + 1;
	
	for k=1:round((numblock/3)),
	  % start = (k-1)*3*blocklength;
	  blocks = [ SORTX( (start+1) : (start+blocklength) ) ; ...
	      SORTX( (start+blocklength+1) : (start+2*blocklength) ) ;...
	      SORTX( (start+2*blocklength+1) : (start+3*blocklength) ) ];
	  % merge started
          index = [1 1; 2 1; 3 1];
	  v = [blocks(1,1) blocks(2,1) blocks(3,1)];
	  [v, I] = sort(v);
	  index = [index(I(1),:) ; index(I(2),:) ; index(I(3),:)];

	  while start < 3*k*blocklength,
	    if  index(2,2) > blocklength, % done
	      SORTX((start+1) : 3*k*blocklength) = ...
		blocks(index(1,1),index(1,2):blocklength);
	      start = 3*k*blocklength;
	    else 
	      v2 = blocks(index(2,1),index(2,2)); 
	      
	      s1_prev = index(1,2);
	      
	      index(1,2) = max(find( ...
		blocks(index(1,1),s1_prev:blocklength) <= v2)) + s1_prev;

	      SORTX((start+1) : (start+index(1,2)-s1_prev)) = ...
		blocks(index(1,1),s1_prev:(index(1,2)-1));

	      start = start + index(1,2)-s1_prev;	    
	      
	      if index(1,2) > blocklength 
		index = [index(2,:) ; index(3,:) ; index(1,:)];
	      elseif index(3,2) > blocklength,
		index = [index(2,:) ; index(1,:) ; index(3,:)];
	      else
		if blocks(index(1,1),index(1,2)) > blocks(index(3,1),index(3,2)),
		  index = [index(2,:) ; index(3,:); index(1,:)];
		else
		  index = [index(2,:) ; index(1,:); index(3,:)];
		end
	      end
	      
	    end
	  end  % merge finished
	end    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
