function Plot2dPartition(basis,color,ax,D)
% Plot2dPartition -- Show partition of Time/Freq plane by best basis
%  Usage
%    Plot2dPartition(basis,color,ax,D)
%  Inputs
%    basis    quadtree specifying partition of time
%             or frequency plane
%    color    string, e.g. 'y'
%    ax       axis parameter of plot this should be overlaid on
%    D        maximum deoth of splitting
%
%  Side Effects
%    Unless a ``hold on'' command is performed, this function will
%    overwrite the current graphics window.
%
%  Description
%    Plot a 2d partition corresponding to the decomposition
%    of the spatial variable.
%
%  Examples
%    The code fragment:
%
%       GrayImage(img); hold on; 
%       stat  = Calc2dStatTree('CP',img,5,'Entropy',[]);
%       basis = Best2dBasis(stat,5);
%       Plot2dPartition(basis,'y',[1 256 1 256],5);
%
%    will overlay on a gray-scale display of img the partition
%    corresponding to the best decomposition of the spatial variable.
%
    n = 1024; %LockAxes(ax);
%
% initialize tree traversal stack
%
    stack = zeros(3,100);
    k = 1;
    stack(:,k) = [0 0 0]'; % d, bx, by
%
    while(k > 0),
        d = stack(1,k); bx = stack(2,k); by = stack(3,k); k=k-1;
%       fprintf('d bx by'); disp([d bx by])
        if(basis(qnode(d,bx,by)) ~= 0) ,  % nonterminal node
           [lox hix loy hiy] = quadbounds(d,bx,by,n);
%          fprintf('[lox hix loy hiy]'); disp([lox hix loy hiy])
           xmin = ax(1) + (ax(2)-ax(1))*(lox-1)/n;
           xmax = ax(1) + (ax(2)-ax(1))*(hix-1)/n;
           ymin = ax(1) + (ax(2)-ax(1))*(loy-1)/n;
           ymax = ax(1) + (ax(2)-ax(1))*(hiy-1)/n;
           xave = (xmin+xmax)/2;
           yave = (ymin+ymax)/2;
%          plot([ xave xave ], [ymin ymax],color);
%          plot([ xmin xmax],  [yave yave],color);
           plot( [ymin ymax],[ xave xave ],color); %transpose due to 'image'
           plot(  [yave yave],[ xmin xmax],color);
           k = k+1; stack(:,k) = [(d+1) (2*bx)   (2*by)   ]';
           k = k+1; stack(:,k) = [(d+1) (2*bx+1) (2*by)   ]';
           k = k+1; stack(:,k) = [(d+1) (2*bx)   (2*by+1) ]';
           k = k+1; stack(:,k) = [(d+1) (2*bx+1) (2*by+1) ]';
        end
    end
    UnlockAxes;

%
% Copyright (c) 1993. David L. Donoho
% 
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
