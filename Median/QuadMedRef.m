function [m21,m22,m23,a,b,c,rule] = QuadMedRef(m1,m2,m3,option)
% QuadMedRef -- Quadratic Interpolation given median information
%  Usage
%    [m21,m22,m23, a,b,c] = QuadMedRef(m1, m2, m3)
%  Inputs
%    m1,m2,m3     medians of the desired quadratic polynomial on
%                 [0,1], [1,2] and [2,3] respectively
%    option       interval to impute to:
%                   default, impute to [1,2]
%                   option='Left' => impute to [0,1]
%                   option='Right => impute to [2,3]
%  Outputs
%    m21,m22,m23  medians of the computed quadratic polynomial on
%                 [1,4/3], [4/3,5/3], [5/3,2] respectively
%    a, b, c      coef. of the interpolating quadratic polynomial,
%                 p(x) = a + bx + cx^2,
%                 Median{p(x) | [0,1]} = m1,
%                 Median{p(x) | [1,2]} = m2, and
%                 Median{p(x) | [2,3]} = m3.
% 

% Warning: This is an old and slower implementation. 
%          When this code was developed,
%          the author hadn't developed the closed form formulae for
%          directly calculating the medians from one scale to the other.
%          Instead, he had only formulae that calculate the median
%          interpolant and (consequently) median refinement was done by 
%          two separate steps: median interpolation followed by median 
%          imputation, as in the definition. He later developed the formulae 
%          that combines the two steps into one single step; and he 
%          reimplemented this code in mex.
%          This code, however, is useful by itself because it gives also 
%          the median interpolant.
% 

        % 
        % compute a quadratic polynomial p(x) = a + bx + cx^2
        % with medians m1, m2, m3 on [0,1], [1,2] and [2,3] 
        % respectively
        % 
        % This program relies on the following:
        % Lemma 1: If p(x) has it's (unique) maxima at x*
        % then 
        % (1) Median{p(x) | [x0, x0+1]} = p(xo+1/2) if
        %        x* <= x0+1/4 or x* >= x0+3/4
        % (2) Median{p(x) | [x0, x0+1]} = p(x*+1/4) if
        %        x0+1/4 <= x* <= x0+1/2
        % (3) Median{p(x) | [x0, x0+1]} = p(x*-1/4) if
        %        x0+1/2 <= x* <= x0+3/4
        % 
        % Lemma 2: Let d = (m3-m2)/(m2-m1) (assume m2-m1 != 0),
        % then x* is uniquely determined by d. In particular,
        % (1) x* in [1/4, 3/4] if 7/3 <= d <= 5
        % (2) x* in [9/4, 11/4] if 1/5 <= d <= 3/7
        % (3) x* in [5/4, 7/4] if -3 <= d <= -1/3
        % 

        d1 = m2 - m1;
	d2 = m3 - m2;

	% handle degenerate cases first
	
	% a horizontal line
	if abs(d1) < eps & abs(d2) < eps,
	  rule = -1;
	  a = m2; b = 0; c = 0;
	  m21 = m2; m22 = m2; m23 = m2;
	  return;
	end
	% a straight line instead of quadratic	
	if abs(d1 - d2) < eps,
	  rule = 0;  
	  a = 3/2*m1 - m2/2; 
	  b = -m1 + m2; 
	  c = 0;
	  if nargin == 3,
	    m21 = a + b*7/6;
	    m22 = a + b*3/2;
	    m23 = a + b*11/6;
	    return;
	  else
	    if strcmp(option,'Left')
	      m21 = a + b*1/6;
	      m22 = a + b*1/2;
	      m23 = a + b*5/6;
	      return;
	    elseif strcmp(option,'Left')
	      m21 = a + b*13/6;
	      m22 = a + b*5/2;
	      m23 = a + b*17/6;
	      return;
	    end
	  end
	end
	% identify case when d1 and d2 are very small, because
	% later we will consider d1/d2 or d2/d1
	% Also note that d1=0 => extrema at x* = 1
	%                d2=0 => extrema at x* = 2
	if abs(d1) < eps | abs(d2) < eps,
	  rule = 1;  
	  a = 15/8*m1 - 5/4*m2 + 3/8*m3;
	  b = -2*m1 + 3*m2 - m3;
	  c = m1/2 -m2 + m3/2;
	  if nargin == 3,
	    m21 = a + b*7/6 + c*49/36;
	    m22 = a + b*3/2 + c*9/4;
	    m23 = a + b*11/6 + c*121/36;
	    return;
	  else
	    if strcmp(option,'Left')
	      m21 = a + b*1/6 + c*1/36;
	      m22 = a + b*1/2 + c*1/4;
	      m23 = a + b*5/6 + c*25/36;
	      return;
	    elseif strcmp(option,'Left')
	      m21 = a + b*13/6 + c*169/36;
	      m22 = a + b*5/2 + c*25/4;
	      m23 = a + b*17/6 + c*289/36;
	      return;
	    end
	  end
	end

	d = d2 / d1;

	if (7/3 <= d & d <= 5),
	  rule = 2;  
	  % x* in [1/4, 3/4]
	  r = sign(d1) * sqrt(16*m1^2 + m2^2 + m3^2 -16*m1*m2 + 14*m2*m3 - 16*m3*m1);
	  a = -10*m1 + 15/2*m2 + 7/2*m3 -5/2*r;
	  b = 32/3*m1 - 19/3*m2 - 13/3*m3 + 8/3*r;
	  c = -8/3*m1 + 4/3*m2 + 4/3*m3 - 2/3*r;
	elseif (7/3 <= 1/d & 1/d <= 5),
	  rule = 3;  
	  % x* in [9/4, 11/4]
	  r = sign(d1) * sqrt(16*m3^2 + m2^2 + m1^2 -16*m3*m2 + 14*m2*m1 - 16*m3*m1);
	  a = 5/2*m1 + m2/2 - 2*m3 + r/2;
	  b = -11/3*m1 - 5/3*m2 + 16/3*m3 - 4/3*r;
	  c = 4/3*m1 + 4/3*m2 - 8/3*m3 + 2/3*r;
	elseif (-3 <= d & d <= -1/3),
	  rule = 4;  
	  % x* in [5/4, 7/4]
	  r = sign(d2) * sqrt(m1^2 + 64*m2^2 + m3^2 - 64*m1*m2 - 64*m2*m3 + 62*m3*m1);
	  a = 19/12*m1 - 2/3*m2 + m3/12 + r/12;
	  b = -13/10*m1 + 8/5*m2 - 3/10*m3 - r/5;
	  c = 4/15*m1 - 8/15*m2 + 4/15*m3 + r/15;
	else	      
	  rule = 1;  
	  % x* in (-inf, 1/4] or [3/4, 1] or [2, 9/4] or 
	  %       [11/4,+inf) or [1, 5/4] or [7/4, 2]
	  a = 15/8*m1 - 5/4*m2 + 3/8*m3;
	  b = -2*m1 + 3*m2 - m3;
	  c = m1/2 -m2 + m3/2;
	end

	% Impute to finer scale
	if nargin ==3,
	  m21 = quadmedian(a,b,c,1,4/3);
	  m22 = quadmedian(a,b,c,4/3,5/3);
	  m23 = quadmedian(a,b,c,5/3,2);
	else
	  if strcmp(option,'Left'),
	    m21 = quadmedian(a,b,c,0,1/3);
	    m22 = quadmedian(a,b,c,1/3,2/3);
	    m23 = quadmedian(a,b,c,2/3,1);
	  elseif strcmp(option,'Right'),
	    m21 = quadmedian(a,b,c,2,7/3);
	    m22 = quadmedian(a,b,c,7/3,8/3);
	    m23 = quadmedian(a,b,c,8/3,3);
	  end
	end
	
% 
% Copyright (c) 1995. David L. Donoho and Thomas P.Y.Yu
%



    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
