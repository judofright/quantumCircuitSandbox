## Search the precomputed approximations to find the one closest to
## U.
## eww globals... is there a better way for some persistant, shared state?
function [seq,mat] = findclosest(U)

  ## UZERO is the 'table' of precomputed sequences
  ## it's loaded by @QIASMcircuit compile
  ## it's computed by @QIASMcircuit/private/computeuzero.m script
  ## it's stored in @QIASMcircuit/private/uzero.mat
  global UZERO; # format (seq,U(2))

  nps = idivide(nproc("current"),2,"floor");

  if( nps > 1 && exist("parcellfun") ) ## parallel

    ## Compute the error
    parfun = @(V) norm(U-V);

    ## on all these mats
    mats = UZERO(:,2);

    errs = zeros(1,length(mats));
    errs = parcellfun(nps,parfun,mats,...
                      "VerboseLevel",0,"ChunksPerProc",1);

    [v,minIdx] = min(errs);

  else #nps == 1 and serial

    minIdx = 1;
    minVal = norm(U-UZERO{1,2});
    for k = 2:length(UZERO)
      er = norm(U-UZERO{k,2});
      if( er < minVal )
        minIdx = k;
        minVal = er;
      endif
    endfor

  endif

  mat = UZERO{minIdx,2}; ## select matrix
  seq = minIdx; ## select sequence

endfunction

## small test cases using some Pauli matricies, and
## no seq here, just place holders
%!test
%! X = [0,1;0,1];
%! Z = [1,0;0,-1];
%! Y = [0,-i;i,0];
%! H = sqrt(1/2)*(X+Z);
%! global UZERO = cell(5,2);
%! UZERO(:,1) = {1,2,3,4,5};
%! UZERO(:,2) = {H,Y,Z,X,eye(2)};
%! for k = 1:5
%!   [s,m] = findclosest(UZERO{k,2});
%!   assert(s,k);
%!   assert(isequal(m,UZERO{k,2}));
%! endfor
