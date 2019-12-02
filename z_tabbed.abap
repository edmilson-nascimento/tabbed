report z_tabbed .

selection-screen begin of screen 100 as subscreen.
parameters:
p100                    type c length 10.
selection-screen end of screen 100.

selection-screen begin of screen 200 as subscreen.
parameters:
p200                    type c length 10.
selection-screen end of screen 200.

selection-screen: begin of tabbed block mytab for 10 lines,
  tab (20) button1 user-command push1,
  tab (20) button2 user-command push2,
end of block mytab.


initialization.

*  break-point.

  button1 = 'Selection Screen 1'.
  button2 = 'Selection Screen 2'.

if ( 0  eq 0 ) .
  mytab-prog = sy-repid.
  mytab-dynnr = 0100.
  mytab-activetab = 'PUSH1'.
else .
  mytab-prog = sy-repid.
  mytab-dynnr = 0200.
  mytab-activetab = 'PUSH2'.
endif.

at selection-screen.
  export mytab to memory id 'Z_MYTAB'. "capture state of tabs

  case sy-ucomm.
    when 'PUSH1'.
      mytab-dynnr = 100.
    when 'PUSH2'.
      mytab-dynnr = 200.
  endcase.

start-of-selection.
  write: 'Hello world'.
