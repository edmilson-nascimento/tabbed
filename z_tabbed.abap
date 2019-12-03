report z_tabbed .


selection-screen begin of screen 100 as subscreen .
  parameters:
    p100 type char10 .
selection-screen end of screen 100 .

selection-screen begin of screen 200 as subscreen .
  parameters:
    p200 type char10 .
selection-screen end of screen 200 .

selection-screen:
  begin of tabbed block tabs for 10 lines,
    tab (20) button1 user-command push1,
    tab (20) button2 user-command push2,
  end of block tabs .


initialization.

  perform tabbed_initialization .


at selection-screen.

  perform tabbed_selection_screen .


start-of-selection.

  perform tabbed_start_of_selection .


form tabbed_initialization .


  data:
    activetab_call type fnam_____4 .

  button1 = 'Selection Screen 1' .
  button2 = 'Selection Screen 2' .

  import tabs-activetab to activetab_call from memory id 'ACTIVETAB_CALL' .

  if ( activetab_call is not initial ) .

    tabs-prog      = sy-repid .
    tabs-activetab = activetab_call .

    case activetab_call .

      when 'PUSH1'.
        tabs-dynnr     = 100 .
      when 'PUSH2'.
        tabs-dynnr     = 200 .
      when others .
        tabs-dynnr     = 100 .
    endcase .

    free memory id 'ACTIVETAB_CALL' .

  else .

    tabs-prog  = sy-repid .
    tabs-dynnr = 100 .

  endif .


endform.


form tabbed_selection_screen .


  case sy-ucomm .

    when 'PUSH1'.
      tabs-dynnr = 100 .

    when 'PUSH2'.
      tabs-dynnr = 200 .

    when others .

  endcase.


endform .


form tabbed_start_of_selection .

  export tabs-activetab to memory id 'ACTIVETAB_CALL' .

  write: 'Hello world' .

endform .
