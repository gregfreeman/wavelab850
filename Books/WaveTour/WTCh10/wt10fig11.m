%CAPTION :
fprintf('\n');
disp('Figure 10.11')
disp('Window 1: Speech recording of the sound "grea".')
disp('Window 2: Noisy signal obtained by adding a Gaussian white noise (SNR=8.7db).')
disp('Window 3: Heisenberg boxes of the local coefficients above the threshold in the best basis.')
disp('Window 4: Estimated signal recovered from the thresholded cosine coefficients (SNR=10.9db)')
fprintf('\n');

        close all;
	x = ReadSignal('Greasy');
	x = x(1:3400);
	x(3401:4096) = zeros(1,696);
	[n,J] = dyadlength(x);
	D=J-1;

	sigma=150;
	Noisy = GWNoisy(x',sigma);
	snr1=SNR(Noisy,x');

	cp = CPAnalysis(Noisy,D,'Sine');
        T=sigma*3.8;
	stree = DisStatTree(cp,'HTE_Compr',T,0,sigma);
	[btree,vtree] = BestBasis(stree,D);

	for d=0:D,
	  for b=0:(2^d-1),
	    cpout(packet(d,b,n),d+1)=HardThresh(cp(packet(d,b,n),d+1),T);
	  end
	end

	out     = CPSynthesis(btree,cpout,'Sine');
	snr_out=SNR(out,x');

	figure(1);
	set(gcf, 'NumberTitle','off', 'Name','Window 1')
	plot(x);
	handle_axis = gca;
	set(handle_axis,'FontSize', 21);
	figure(2);
	set(gcf, 'NumberTitle','off', 'Name','Window 2')
	plot(Noisy);
	handle_axis = gca;
	set(handle_axis,'FontSize', 21);
	figure(3);
	set(gcf, 'NumberTitle','off', 'Name','Window 3')
	ImagePhasePlane('CP',btree,cpout)
	colormap(1-gray(256).^.25)
	handle_axis = gca;
	set(handle_axis,'FontSize', 21);
	figure(4);
	set(gcf, 'NumberTitle','off', 'Name','Window 4')
	plot(out);
	handle_axis = gca;
	set(handle_axis,'FontSize', 21);

% Written by Maureen Clerc and Jerome Kalifa, 1997
% clerc@cmapx.polytechnique.fr, kalifa@cmapx.polytechnique.fr


    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:39 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
