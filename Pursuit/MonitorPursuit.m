function new_res = MonitorPursuit(type,nuc,t,amax,res,a,dp,D,pktype)
% MonitorPursuit -- Display intermediate Pursuit progress
%  Usage
%    new_res = MonitorPursuit(type,nuc,t,amax,res,dp,D,pktype)
%
%  Description
%    Utility used by WPPursuit & CPPursuit. Not intended for other use.
%
  if rem(nuc,5) == 0,
	clf; 
	subplot(121); LockAxes([0 1 nuc nuc+6]); 
	title(sprintf('Terms to enter at steps (%g:%g)',nuc+1,nuc+5));
	subplot(122); LockAxes([0 1 nuc-1 nuc+5]); 
	title(sprintf('Residuals at steps (%g:%g)',nuc,nuc+4));
  end
%
  if strcmp(type,'CP'),
      newterm = CPSynthesis(zeros(1,2^D),dp,pktype);
  else
      newterm = dp(:,1)';
  end
%
  subplot(121); plot(t, nuc + 1 + newterm .* ( a/(3*amax)));
  new_res = res - a.*newterm;
  subplot(122); plot(t, nuc +  res ./(3*amax));
  drawnow;
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:43 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
