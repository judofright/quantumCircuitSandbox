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

## usage: b = QIRvalidop(OpStr)
##
## Checks if OpStr is a valid operation descriptor string for QIR and returns
## true if it is.
##

## Author: Logan Mayfield <lmayfield@monmouthcollege.edu>
## Keywords: QIR

function b = QIRvalidop(OpStr)

  if( !ischar(OpStr) )
    b = false;
  else
    if( QIASMvalidop(OpStr) )
      b = true;
    else
      switch (OpStr)
	case { "Toffoli","Fredkin","Swap","CU" }
	  b = true;
	otherwise
	  b = false;
      endswitch
    endif
  endif

end
