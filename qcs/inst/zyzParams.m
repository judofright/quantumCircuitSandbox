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

## usage: p = zyzParams(U,ep)
##
## Compute the Z-Y-Z decomposition angles for an arbitrary operator
## from U(2).
##

## Author: Logan Mayfield <lmayfield@monmouthcollege.edu>
## Keywords: Operators

function p = zyzParams(U)

  if(!isequal(size(U),[2,2]) )
    error("Operator size mismatch. Must be 2x2 Unitary.");
  endif

  ## get phase amp params
  ph = phaseAmpParams(U);

  ## [z1,y,z2,global]
  p = [ph(3),(2*ph(1)),ph(2),ph(4)];


endfunction

%!test
%! close = 2^-50;
%! fail('zyzParams(eye(3))');
%! assert(abs(zyzParams(eye(2))-[0,0,0,0]) < close);
%! assert(abs(zyzParams(X)-[-pi,pi,0,pi/2]) < close);
%! assert(abs(zyzParams(Y)-[0,pi,0,pi/2]) < close);
%! assert(abs(zyzParams(Z)-[pi,0,0,pi/2]) < close);
%! assert(abs(zyzParams(H)-[0,pi/2,pi,pi/2]) < close);
