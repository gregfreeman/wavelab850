% mifig31 -- MI vs LMI
%
% Panel (a) MI and LMI refinement of Kronecker Seq.
% Panel (b) Difference Sequences of MI refinement Sequences
% Panel (c) Difference Sequences of LMI refinement Sequences
% Panel (d) 3^j max_k |d_{j,k}| Vs j for MI and LMI

scriptname = 'mifig31';
num_iter = 5;
D = 2;

Kron = [0 0 0 1 0 0 0];

start = -3;
ROI = [start,start+length(Kron)];
roi = linspace(ROI(1),ROI(2),length(Kron)*(3^num_iter));

% Panel (a)
subplot(2,2,1)
MIKron  = MultiMedRefine(Kron,D,num_iter); plot(roi,MIKron); hold on
LMIKron = MultiLMIRefine(Kron,D,num_iter); plot(roi,LMIKron, 'r--');
% title('(a): MI and LMI refinement of Kronecker Seq.')
t = 0:0.01:(2*pi); plot(0+.2*cos(t), .5+.2*sin(t))
title('(a)')
text(-0.1,-.4,'k^*')
grid on
axis([-2,3,-.2,1.2]);

% Panel(b)
subplot(2,2,2)

for num_iter = 0:6,
  MIKron  = MultiMedRefine(Kron,D,num_iter);
  roi = linspace(ROI(1),ROI(2),length(Kron)*(3^num_iter)+1);
  dMIKron  = abs(diff([0, MIKron, 0]));
  if num_iter>0, plot(roi,dMIKron); hold on, end
  dMImax(num_iter+1) = max(dMIKron);
end
% title('(b): |d_{j,k}^{MI}| vs k 3^{-j}, j=0,\ldots,6')
title('(b)')
text(-0.1,-.11,'k^*')
grid on
axis([-2,3,0,.8]);

% Panel(c)
subplot(2,2,3)
for num_iter = 0:6,
  LMIKron  = MultiLMIRefine(Kron,D,num_iter);
  roi = linspace(ROI(1),ROI(2),length(Kron)*(3^num_iter)+1);
  dLMIKron  = abs(diff([0, LMIKron, 0]));
  if num_iter>0, plot(roi,dLMIKron,'r'); hold on, end
  dLMImax(num_iter+1) = max(dLMIKron);  
end
% title('(c): |d_{j,k}^{LMI}| vs k 3^{-j}, j=0,\ldots,6')
title('(c)')
text(-0.1,-.11,'k^*')
grid on
axis([-2,3,0,.8]);

% Panel (d)
subplot(2,2,4)
plot(0:6, 3.^(0:6) .* dMImax); hold on
plot(0:6, 3.^(0:6) .* dLMImax, 'r--');
% title('(d): 3^j max_k |d_{j,k}| vs j')
title('(d)')

RegisterPlot(scriptname, '{R}')

%
% Copyright (c) 1996.  David Donoho and Thomas P.Y. Yu
%
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
