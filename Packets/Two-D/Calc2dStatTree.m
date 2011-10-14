function SQTree = Calc2dStatTree(TFType,img,D,TFPar,ent,EntPar)
% Calc2dStatTree -- Put Wavelet/Cosine Packet Statistics into Quad Tree
%  Usage
%    SQTree = Calc2dStatTree(TFType,img,D,TFPar,ent[,EntPar])
%  Inputs
%    TFType    string, 'CP' or 'WP' selecting type of time-
%              frequency analysis
%    img       2-d image, n by n, n dyadic
%    D         maximum depth of splitting
%    TFPar     if 'WP', qmf
%              if 'CP', bellname
%    ent       type of entropy to record in tree: options are
%                 'Entropy' -- Coifman-Wickerhauser
%                 'Log'     -- sum log(abs(th_i))
%                 'l^p'     -- sum |th_i|^p, 0 < p < 2, p = EntPar
%                 'N(eps)'  -- #>= eps, eps = EntPar
%                 'Risk'    -- sum min(th_i^2,eps^2), eps = EntPar
%                 'Sum'     -- sum th_i
%                 'SURE'    -- SURE(Thresholding), thresh = EntPar
%    EntPar    extra parameter, depends on type of entropy
%  Outputs
%    sqtree    quad tree filled entropy numbers.
%              SQTree(qnode(d,bx,by)) contains entropy of quadlet(d,bx,by,n)
%
%  Description
%    A packet table is indexed by depth, block within depth, and
%    coefficient within block.  Because 2d images require four
%    splits per parent block, WaveLab prefers to store just the
%    entropy measure for the coefficients in a particular block
%    rather than the coefficients themselves.  Calc2dStatTree
%    creates this statistics tree for the entropy measure chosen
%    by the user.
%
%  See Also
%    Best2dBasis, Plot2dBasisTree
%

        [n,J]  = quadlength(img);
        boxlen = n;
        boxcnt = 1;
        SQTree = zeros(1, 2* (4^D));
        ss = norm(norm(img));
        coef = img ./ss;
%
        if nargin == 5, EntPar = []; end

        if strcmp(TFType,'WP'), % 2-d Wavelet Packets

          for deep = 0:D,
            for bx=0:(boxcnt-1),
              for by=0:(boxcnt-1),

                [lox,hix,loy,hiy] = quadbounds(deep,bx,by,n);
                Quad = coef(lox:hix,loy:hiy);

                SQTree(qnode(deep,bx,by)) = CalcEntropy(Quad,ent,EntPar);

                if deep < D,  %         prepare for finer scales
                  quad = DownQuad(Quad,TFPar,bx,by);
                  coef(lox:hix,loy:hiy) = quad;
                end

              end
            end
            boxlen = boxlen/2;
            boxcnt = boxcnt*2;
          end

        else % 2-d Cosine Packets

          m = n / 2^D /2;
          [bp,bm] = MakeONBell(TFPar,m);
          boxlen = n;
          boxcnt = 1;

          % ideally, fold edges at coarsest scale

          for deep = 0:D,
            for bx=0:(boxcnt-1),
              for by=0:(boxcnt-1),

                [lox,hix,loy,hiy] = quadbounds(deep,bx,by,n);
                Quad = dct2_iv(coef(lox:hix,loy:hiy));

                SQTree(qnode(deep,bx,by)) = CalcEntropy(Quad,ent,EntPar);

                if deep < D,  %         prepare for finer scales

                  % fold columns
                  midlo = floor((lox+hix)/2);
                  midhi = ceil ((lox+hix)/2);
                  for i=1:m
                    colright = coef(midlo+i,loy:hiy);
                    colleft  = coef(midhi-i,loy:hiy);
                    coef(midlo+i,loy:hiy) = bp(i)*colright + bm(i)*colleft ;
                    coef(midhi-i,loy:hiy) = bp(i)*colleft  - bm(i)*colright;
                  end

                  % fold rows
                  midlo = floor((loy+hiy)/2);
                  midhi = ceil ((loy+hiy)/2);
                  for i=1:m
                    rowright = coef(lox:hix,midlo+i);
                    rowleft  = coef(lox:hix,midhi-i);
                    coef(lox:hix,midlo+i) = bp(i)*rowright + bm(i)*rowleft ;
                    coef(lox:hix,midhi-i) = bp(i)*rowleft  - bm(i)*rowright;
                  end

                end
              end
            end
            boxlen = boxlen/2;
            boxcnt = boxcnt*2;
          end
        end

%
% Copyright (c) 1993-4. Jonathan Buckheit and David Donoho
%
    
    
    
 
 
%
%  Part of Wavelab Version 850
%  Built Tue Jan  3 13:20:41 EST 2006
%  This is Copyrighted Material
%  For Copying permissions see COPYING.m
%  Comments? e-mail wavelab@stat.stanford.edu 
