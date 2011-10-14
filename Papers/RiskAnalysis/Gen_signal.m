function load_signal(i,willplot)
% Gen_signal  - Used in Risk Browser to generate the signals in 
% paper of Johnstone, Marron and others
global n x_length x_use x_name signal_name Signals____entries; 
global sigchoice PlotFig x_tmp
global fig_list Update
global allfig fig2 fig3 fig4 upd_never upd_ever


if nargin < 2,
 willplot = 'Yes';
end;
signal_name = deblank(Signals____entries( i,: ));

  if ~exist('x_length') | isempty(x_length) | x_length == 0
    x_length = 2^8;
  end
    n = x_length;
    n = 2^fix(log2(n));        % Generates dyadic length signal
    t = (1:n) ./n;
  if strcmp(signal_name,'Step'),
     x = 0.2 + 0.6*(t > 1/3 & t <= 0.75); 
     if (sum(sigchoice == 1) == 1 | sum(sigchoice == 1) == 0)
       use_pltoption(1);
       sigchoice = zeros(1,10);
       sigchoice(1) = 1;
      end
  elseif strcmp(signal_name,'Wave'),
     x = 0.5 + (0.2.*cos(4*pi*t)) + (0.1.*cos(24*pi*t));
     if (sum(sigchoice == 1) == 1 | sum(sigchoice == 1) == 0)
       use_pltoption(1);
       sigchoice = zeros(1,10);
       sigchoice(2) = 1;
      end
  elseif strcmp(signal_name,'Blip'),
     x = (0.32 + (0.6.*t) + 0.3*exp(-100*((t-0.3).^2))).*(t <= 0.8) + ...
         (-0.28 + (0.6.*t) + 0.3*exp(-100*((t-1.3).^2))).*(t > 0.8);
     if (sum(sigchoice == 1) == 1 | sum(sigchoice == 1) == 0)
       use_pltoption(1);
       sigchoice = zeros(1,10);
       sigchoice(3) = 1;
      end
  elseif strcmp(signal_name,'Blocks'),
     pos = [ .1 .13 .15 .23 .25 .40 .44 .65  .76 .78 .81];
     hgt = [4 (-5) 3 (-4) 5 (-4.2) 2.1 4.3  (-3.1) 2.1 (-4.2)];
     x = 2*ones(size(t));
     for j=1:length(pos)
        x = x + (1 + sign(t-pos(j))).*(hgt(j)/2) ;
     end
     x = (0.6/9.2)*x + 0.2;
     if (sum(sigchoice == 1) == 1 | sum(sigchoice == 1) == 0)
       use_pltoption(1);
       sigchoice = zeros(1,10);
       sigchoice(4) = 1;
      end
  elseif strcmp(signal_name,'Bumps'),
    pos = [ .1 .13 .15 .23 .25 .40 .44 .65  .76 .78 .81];
    hgt = [ 4  5   3   4  5  4.2 2.1 4.3  3.1 5.1 4.2];
    wth = [.005 .005 .006 .01 .01 .03 .01 .01  .005 .008 .005];
    x = zeros(size(t));
    for j =1:length(pos)
       x = x + hgt(j)./(( 1 + (abs(t - pos(j))./wth(j))).^4);
    end 
    x = ((0.6/5.3437952)*x) + 0.2;
     if (sum(sigchoice == 1) == 1 | sum(sigchoice == 1) == 0)
       use_pltoption(1);
       sigchoice = zeros(1,10);
       sigchoice(5) = 1;
      end
  elseif strcmp(signal_name,'HeaviSine'),
    x = 4.*sin(4*pi.*t) - sign(t - .3) - sign(.72 - t) + 5;
    x = (0.6/9)*x + 0.2;
     if (sum(sigchoice == 1) == 1 | sum(sigchoice == 1) == 0)
       use_pltoption(1);
       sigchoice = zeros(1,10);
       sigchoice(6) = 1;
      end
  elseif strcmp(signal_name,'Doppler'),
    x = sqrt(t.*(1-t)).*sin((2*pi*1.05) ./(t+.05)) + 0.5;
    x = 0.6*x + 0.2;
     if (sum(sigchoice == 1) == 1  | sum(sigchoice == 1) == 0)
       use_pltoption(1);
       sigchoice = zeros(1,10);
       sigchoice(7) = 1;
      end
  elseif strcmp(signal_name,'Angles'),
    x = ((2*t + 0.5).*(t <= 0.15)) + ...
        ((-12*(t-0.15) + 0.8).*(t > 0.15 & t <= 0.2)) + ...
        0.2*(t > 0.2 & t <= 0.5) + ...
        ((6*(t - 0.5) + 0.2).*(t > 0.5 & t <= 0.6)) + ...
        ((-10*(t - 0.6) + 0.8).*(t > 0.6 & t <= 0.65)) + ...
        ((-0.5*(t - 0.65) + 0.3).*(t > 0.65 & t <= 0.85)) + ...
        ((2*(t - 0.85) + 0.2).*(t > 0.85));
     if (sum(sigchoice == 1) == 1 | sum(sigchoice == 1) == 0)
       use_pltoption(1);
       sigchoice = zeros(1,10);
       sigchoice(8) = 1;
      end
  elseif strcmp(signal_name,'Parabolas'),
    pos = [0.1 0.2 0.3 0.35 0.37 0.41 0.43 0.5 0.7 0.9];
    hgt = [(-30) 60 (-30) 500 (-1000) 1000 (-500) 7.5 (-15) 7.5];
    x = zeros(size(t));
    for j =1:length(pos)
       x = x + hgt(j).*((t-pos(j)).^2).*(t > pos(j));
    end
    x = x + 0.8;
     if (sum(sigchoice == 1) == 1 | sum(sigchoice == 1) == 0)
       use_pltoption(1);
       sigchoice = zeros(1,10);
       sigchoice(9) = 1;
      end
  elseif strcmp(signal_name,'Time Shifted Sine') | ...
         strcmp(signal_name,'TSh Sine'),
      u = t;
    for j =1:4,
      u = 0.5*(1-cos(pi*u));
    end
      x = 0.3*sin(3*pi*(u+t)) + 0.5;
     if (sum(sigchoice == 1) == 1 | sum(sigchoice == 1) == 0)
       use_pltoption(1);
       sigchoice = zeros(1,10);
       sigchoice(10) = 1;
      end
  else
    disp('MakeSignal: I don*t recognize');signal_name
    disp('Allowable Names are:')
       disp('Step'),
       disp('wave'),
       disp('Blip'),
       disp('Blocks'),
       disp('Bumps'),
       disp('HeaviSine'),
       disp('Doppler'),
       disp('Angles'),
       disp('Parabolas'),
       disp('Time Shifted Sine'),
end
[ aa bb ] = size(x);
  if aa > bb
    x = x';
  end
  x = ...
   x(1:2^(fix(log(length(x))/log(2) ))); 
x_tmp = x;
if strcmp(willplot,'Yes'),
  x_use = x;
  n = length(x_use);
  x_length = n;
  x_name = signal_name;
  figure(PlotFig);
  plot_newdata;
end

if sum(sigchoice == 1) == 1 & strcmp(willplot,'Yes'),
    if isempty(upd_ever) | strcmp(Update,'ever'),
       updateplots;
else Update_figs;
end
end
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:42 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
