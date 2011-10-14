% mifig24 -- Nonlinearity of Median Refinement
%
% Panel (a) D=2 Refinement of Kronecker Sequence
% Panel (b) D=2 Refinement of Heaviside Sequence
% Panel (c) Superposition of shifts of (a)
% Panel (d) (b)-(c)

scriptname = 'mifig24';
num_iter = 4;
D = 2;

Kron0 = [0 0 0 1 0 0 0 0 0];
Kron1 = [0 0 0 0 1 0 0 0 0];
Kron2 = [0 0 0 0 0 1 0 0 0];
Heav3 = [0 0 0 0 0 0 1 1 1];
Heav0 = [0 0 0 1 1 1 1 1 1];

if Kron0 + Kron1 + Kron2 + Heav3 ~= Heav0,
  disp('Hypothetis violated!')
  return
end

start = -3;
ROI = [start,start+length(Kron0)];
roi = linspace(ROI(1),ROI(2),length(Kron0)*(3^num_iter));

% Panel (a)
subplot(2,2,1)
rKron0 = MultiMedRefine(Kron0,D,num_iter); plot(roi,rKron0); hold on
rKron1 = MultiMedRefine(Kron1,D,num_iter); plot(roi,rKron1);
rKron2 = MultiMedRefine(Kron2,D,num_iter); plot(roi,rKron2);
rHeav3 = MultiMedRefine(Heav3,D,num_iter); plot(roi,rHeav3);
title('(a): D=2 Refinement of Kronecker Sequence and shifts')
grid on
a = axis;
axis([ROI(1),ROI(2),a(3),a(4)]);
hold off

% Panel (b)
subplot(2,2,2)
rHeav0 = MultiMedRefine(Heav0,D,num_iter); plot(roi,rHeav0);
title('(b): D=2 Refinement of Heaviside Sequence')
grid on
axis([ROI(1),ROI(2),a(3),a(4)]);

% Panel (c)
subplot(2,2,3)
super = rKron0+rKron1+rKron2+rHeav3; % superposition of shifts
plot(roi,super)
axis([ROI(1),ROI(2),a(3),a(4)]);
grid on
title('(c): Superposition of shifts of (a)')

% Panel (d)
subplot(2,2,4)
plot(roi,rHeav0-super)
a = axis;
axis([ROI(1),ROI(2),a(3),a(4)]);
grid on
title('(d): (b)-(c)')

clear Kron0 Kron1 Kron2 Heav0 Heav3 
clear rKron0 rKron1 rKron2 rHeav0 rHeav3 

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
