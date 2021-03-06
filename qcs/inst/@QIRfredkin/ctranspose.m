## Copyright (C) 2014  James Logan Mayfield
##
##  This program is free software: you can redistribute it and/or modify
##  it under the terms of the GNU General Public License as published by
##  the Free Software Foundation, either version 3 of the License, or
##  (at your option) any later version.
##
##  This program is distributed in the hope that it will be useful,
##  but WITHOUT ANY WARRANTY; without even the implied warranty of
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##  GNU General Public License for more details.
##
##  You should have received a copy of the GNU General Public License
##  along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {Function File} {@var{h} =} ctranspose (@var{g})
##
## Computes the reverse of the Fredkin gate @var{g}. Enables @var{g}'.
##
## @end deftypefn

## Author: Logan Mayfield <lmayfield@monmouthcollege.edu>
## Keywords: QIR

function s = ctranspose(g)

  s = @QIRfredkin(get(g,"tars"),get(g,"ctrl"));

endfunction

%!test
%! err  = 2^-40;
%! a = @QIRfredkin([0,1],2);
%! n = 3;
%! assert( operr( circ2mat(a,n)', circ2mat(a',n)) < err );
%! a = @QIRfredkin([2,1],0);
%! n = 3;
%! assert( operr( circ2mat(a,n)', circ2mat(a',n)) < err );
%! a = @QIRfredkin([4,0],2);
%! n = 5;
%! assert( operr( circ2mat(a,n)', circ2mat(a',n)) < err );
