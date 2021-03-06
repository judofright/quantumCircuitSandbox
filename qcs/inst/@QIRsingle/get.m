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
## Select field/property @var{f} of single qubit gate @var{C}
##
## @end deftypefn


## Author: Logan Mayfield <lmayfield@monmouthcollege.edu>
## Keywords: QIR

function s = get(sg,f)

  if (nargin == 1)
    s.name = sg.name;
    s.tars = sg.tars;
    s.params = sg.params;
  elseif (nargin == 2)
    if ( ischar(f) )
      switch(f)
	case "name"
	  s = sg.name;
	case "tars"
	  s = sg.tars;
	case "params"
	  s= sg.params;
	otherwise
	  error("get: invalid property %s",f);
      endswitch
    else
      error("get: expecting the property to be a string");
    endif
  else
      print_usage();
  endif

endfunction

%!test
%! a = @QIRsingle("X",0);
%! b = @QIRsingle("H",1);
%! c = @QIRsingle("Z",2);
%! assert(get(a,"tars"),0);
%! assert(get(b,"tars"),1);
%! assert(get(c,"tars"),2);
%! assert(get(c,"name"),"Z");
%! assert(get(a,"name"),"X");
%! as.name = "X";
%! as.tars = 0;
%! as.params = [];
%! assert(get(a),as);
