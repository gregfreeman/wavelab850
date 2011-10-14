% adfig12 -- Adapt Figure 12: Simulating the behavior of various threshold rules%% Here we compare the behavior of several schemes for threshold% choice, when the noise is Normal(0,1). Several Different degrees% of sparsity are studied.%% (Panel a) Choice by minimizing pure SURE criterion.% (Panel b) Choice by fixed sqrt{2 log(n)} criterion.% (Panel c) Choice by Hybrid of (a) and (b).% (Panel d) Choice by Hybrid on random half-samples.%NProb=1024; M=25;rand('seed',0);%   EvalSure   EvalFix   EvalHybrid   EvalRigor%ax = [0 .3 0 1];%clf;versaplot(221,SureRecords(:,2),SureRecords(:,3).^2,'o',...    '12 (a) SURE Threshold',ax,[]);xlabel('Epsilon')ylabel('root MSE')versaplot(222,FixRecords(:,2),FixRecords(:,3).^2,'.',...    '12 (b) Fixed Threshold',ax,[]);xlabel('Epsilon')ylabel('root MSE')versaplot(223,HybridRecords(:,2),HybridRecords(:,3).^2,'*',...    '12 (c) Hybrid(*) Threshold',ax,[]);xlabel('Epsilon')ylabel('root MSE')versaplot(224,PlusRecords(:,2),PlusRecords(:,3).^2,'+',...    '12 (d) Hybrid(+) Threshold',ax,[]);xlabel('Epsilon')ylabel('root MSE')         
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
