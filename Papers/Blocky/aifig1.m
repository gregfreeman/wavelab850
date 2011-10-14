% aifig1 -- Average-Interpolating Refinement of a sequence of averages.%% The figure shows (as a step function) the block averages % of the function sin(t), and (as dashed and dotted curves)% several average-interpolating refinements to a resolution% 5 scales finer.%% At the resolution of the plotting device, all of the refinements % are equal to the true underlying function, and are much closer to % that function than the piecewise constant function. %global Fil2 Fil4 Fil6 Fil8global EdgeFil2 EdgeFil4 EdgeFil6 EdgeFil8%t = (0:63) ./16 - 2;ave = 16  .*(cos(t) - cos(t +1/16.));Blocks = ave;MaxOrd=8;dt = t(2)-t(1);vb = [ Blocks ; Blocks ]; vb = vb(:);tb = [t ; (t+dt) ]; tb = tb(:);%clf;hold onsubplot(1,1,1)plot(tb,vb)title('1. Interpolating Averages of sin(t)')%axis([0 1 0 1]); xlabel('t')%a = Blocks;for j=1:5,   a = AIRefine(a,2,Fil2,EdgeFil2); end;t = 4 * (0:(length(a)-1)) ./ length(a) - 2;plot(t,a,'--')%a = Blocks;for j=1:5,   a = AIRefine(a,4,Fil4,EdgeFil4); end;plot(t,a,'-.')%if(MaxOrd > 6),a = Blocks;for j=1:5,   a = AIRefine(a,8,Fil8,EdgeFil8); end;plot(t,a,':')end;UnlockAxes         
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
