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

## Usage: b = eq(this,other)
##
## returns true if @QIRseq this is equivalent to other.
##

## Author: Logan Mayfield <lmayfield@monmouthcollege.edu>
## Keywords: QIR

function b = eq(this,other)
  b = false;
  if( isa(other,"QIRseq") )
    othseq = get(other,"seq");
    if( length(this.seq) == length(othseq) )
      for k = 1:length(this.seq)
	if( !eq(this.seq{k},get(other,"seq"){k}) )
	  b = false; 
	  return;
	endif
      endfor
      b=true;
    endif
  endif
endfunction



%!test
%! a = @QIRseq({@QIRsingle("H",1),@QIRcU(0,1,{"X"})});
%! b = @QIRseq({@QIRsingle("H",1),@QIRcU(0,1,{"X"})});
%! c = @QIRseq({@QIRsingle("H",1)});
%! d = @QIRseq({@QIRsingle("H",1),@QIRcU(0,1,{"X"}),@QIRseq({@QIRmeasure()})});
%! e = @QIRseq({@QIRsingle("H",1),@QIRcU(0,1,{"X"}),@QIRseq({@QIRmeasure()})});
%! assert(eq(a,a));
%! assert(eq(a,b));
%! assert(eq(d,e));
%! assert(!eq(a,c));
%! assert(!eq(a,d));

