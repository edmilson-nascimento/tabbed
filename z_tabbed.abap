REPORT YTESTE.

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

perform config_tabbed .

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
  
  
form config_tabbed .


  import tabs-activetab to activetab_call from memory id 'ACTIVETAB_CALL' .

  if ( activetab_call is not initial ) .

    tabs-prog      = sy-repid .
    tabs-activetab = activetab_call .

    case activetab_call .

    when 'UCOMM1'.
      tabs-dynnr     = 3010 .
    when 'UCOMM2'.
      tabs-dynnr     = 3020 .
    when others .
      tabs-dynnr     = 3010 .
    endcase .

    free memory id 'ACTIVETAB_CALL' .

  endif .


endform.
