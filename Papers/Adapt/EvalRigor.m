% EvalRigor -- Performance of Hybrid(+) shrinkage for varying sparsity % parameters C and epsif ~exist('NProb'),   NProb = input('Size of Problem');endif ~exist('M'),   M = input('Number of Repetitions');enddisp('in EvalRigor ...')disp(sprintf('doing %g Monte Carlo repetitions at N=%g',M,N))disp('this could take a while ...')PlusRecords = zeros( M*13*3 , 3);MedPlus = zeros( 13*3, 3);v = zeros(1,M); rcount = 1; scount = 1;for C = [3 5 7],    for eps = [.005 .01 .02 .04 .06 .08 .10 .12 .14 .16 .18 .20 .25],      x = zeros(1,NProb);      k = floor(eps*NProb);      x(1:k) = zeros(1,k)+C;      for m=1:M,         y = x + WhiteNoise(x);         xhat = RigorThresh(y);         loss = rms(xhat-x); % root mean square!         v(m) = loss;         PlusRecords(rcount,:) =  [C eps loss]; rcount = rcount +1;		 if rem(rcount,10)==0, fprintf('.'), end        end       MedPlus(scount,:) =  [C eps rms(v)]; scount = scount +1;    endendplot(PlusRecords(:,2),PlusRecords(:,3).^2,'*')holdtitle('(c) Hybrid(+) Thresholds')xlabel('Epsilon')ylabel('MSE')hold off%prtsc              
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
