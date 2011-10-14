function m = BlockMedian(P,interval,method)
% BlockMedian -- Compute median of a polynomial over an interval
%  Usage
%    m = BlockMedian(P, interval)
%  Inputs
%    P         Polynomial, 
%              p(x) = P(1) x^(n-1) + P(2) x^(n-2) x + ... + P(n)
%    interval  2-vector, end points of a finite interval
%  Outputs
%    m         median(P|interval)
%    

     if nargin < 3, method = 'bisection'; end

     a = interval(1); b = interval(2);
     deg = length(P)-1;
     
     % calculate the local maxima of P that lie within [a,b]
     peaks = ZeroX(polyder(P),interval);

     % Some Simple cases where analytic solution is available
     if deg < 2 | length(peaks)==0,
       m = polyval(P,(a+b)/2);
     elseif deg == 2,
       pe = -P(2)/(2*P(1));
       if pe <= (3*a+b)/4 | pe >= (a+3*b)/4,
	 m = polyval(P,(a+b)/2);
       elseif pe > (3*a+b)/4 & pe <= (a+b)/2,
	 m = polyval(P,pe+(b-a)/4);
       elseif pe < (a+3*b)/4 & pe > (a+b)/2,
	 m = polyval(P,pe-(b-a)/4);
       end
       
     % General case where an numerical approach is necessary
     else
       if strcmp(method, 'sample'), 
	 % a easy, but computational expensive, thing to do is to
	 % sample P on [a,b] and take sample median
	 sam = linspace(a,b,50);
	 m = median(polyval(P,sam));
       elseif strcmp(method, 'bisection'),
	 % method of bisection: iterative
	 
	 % initial guess
	 EPS = 10^(-6);
	 found = 0;
	 maxi = ZeroX(polyder(P),interval);
	 maxi = [a maxi b];
	 lo   = min(polyval(P,maxi));
	 high = max(polyval(P,maxi));
	 m = polyval(P,(a+b)/2);

	 while found==0,
	   % Find the turn points
	   Q = P; Q(deg+1) = Q(deg+1)-m;
	   tp = ZeroX(Q,interval); tp = [a tp b];
	   len = length(tp);
	   
	   Measure1 = sum(tp(2:2:len) - tp(1:2:(len-1)));
	   Measure2 = sum(tp(3:2:len) - tp(2:2:(len-1)));
	   
	   if polyval(P, a) >= m
	     MeasureUp   = Measure1;
	     MeasureDown = Measure2;
	   else
	     MeasureUp   = Measure2;
	     MeasureDown = Measure1;
	   end
	   
	   if MeasureUp > MeasureDown+EPS,
	     % should raise m
	     lo = m;	     
	     m = (m+high)/2;
	   elseif MeasureDown > MeasureUp+EPS,
	     % should lower m
	     high = m;
	     m = (m+lo)/2;
	   else
	     found = 1;
	   end
	 end
       end
     end
 
% 
% Copyright (c) 1996. Thomas P.Y. Yu
% 
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:40 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
