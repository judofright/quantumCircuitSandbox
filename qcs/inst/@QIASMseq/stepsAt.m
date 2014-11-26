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

## Usage: s = stepsAt(g,d)
##
##  used to compute number of steps at depth d of a circuit. 
##  
## 

## Author: Logan Mayfield <lmayfield@monmouthcollege.edu>
## Keywords: QIASM

function s = stepsAt(g,d)
  s = stepsAt(g.seq,d);
endfunction

%!test
%! A = @QASMseq({@QASMsingle("H",1),@QASMcNot(2,1),...
%!               @QASMmeasure([1,2,5])});
%! assert(stepsAt(A,1),3);
%! assert(stepsAt(A,2),3); 
%! B = @QASMseq({@QASMsingle("Z",2),A});
%! assert(stepsAt(B,1),2);
%! assert(stepsAt(B,2),4);