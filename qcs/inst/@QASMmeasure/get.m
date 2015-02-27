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
## @deftypefn {Function File} {@var{s} =} get (@var{C},@var{f})
##
## Select field/property @var{f} of measurement gate @var{C}
##
## @end deftypefn

## Author: Logan Mayfield <lmayfield@monmouthcollege.edu>
## Keywords: QASM

function s = get(mg,f)

  if(nargin == 1)
    s = get(mg.meas);
  else
    s = get(mg.meas,f);
  endif


endfunction

%!test
%! a = @QASMmeasure();
%! b = @QASMmeasure(1:3);
%! assert(isequal([],get(a,"tar")));
%! assert(isequal([1,2,3],get(b,"tar")));
%! bs.tar = [1,2,3];
%! assert(isequal(bs,get(b)));
