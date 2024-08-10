CLASS zsbm_subtotal_internal_table DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zsbm_subtotal_internal_table IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TYPES : BEGIN OF ty_line,
              lifnr  TYPE char10,
              belnr  TYPE char10,
              amount TYPE decfloat16,
            END OF ty_line,
            ty_lines TYPE STANDARD TABLE OF ty_line WITH DEFAULT KEY.

    DATA(gt_main) = VALUE ty_lines( ( lifnr = 'AAA' belnr = '123' amount = 10 )
                                    ( lifnr = 'AAA' belnr = '234' amount = 20 )
                                    ( lifnr = 'BBB' belnr = '456' amount = 30 )
                                    ( lifnr = 'CCC' belnr = '567' amount = 40 )
                                    ( lifnr = 'CCC' belnr = '789' amount = 50 )
                                    ( lifnr = 'CCC' belnr = '901' amount = 60 ) ).

    DATA(lt_display) = VALUE ty_lines(
            ( LINES OF VALUE #(
                  FOR GROUPS <g> OF <line> IN gt_main
                  GROUP BY ( lifnr = <line>-lifnr )
                  ( LINES OF VALUE #( FOR <line2> IN GROUP <g> ( <line2> ) ) )
                  ( lifnr = 'SUBTOTAL'
                    amount = REDUCE #( INIT subtotal TYPE ty_line-amount
                                       FOR <line2> IN GROUP <g>
                                       NEXT subtotal = subtotal + <line2>-amount ) ) ) )
            ( lifnr = 'TOTAL'
              amount = REDUCE #( INIT total TYPE ty_line-amount
                                 FOR <line> IN gt_main
                                 NEXT total = total + <line>-amount ) ) ).

*    ASSERT lt_display = VALUE ty_lines( ( lifnr = 'AAA'      amount = 10 )
*                                        ( lifnr = 'AAA'      amount = 20 )
*                                        ( lifnr = 'SUBTOTAL' amount = 30 )
*                                        ( lifnr = 'BBB'      amount = 30 )
*                                        ( lifnr = 'SUBTOTAL' amount = 30 )
*                                        ( lifnr = 'CCC'      amount = 40 )
*                                        ( lifnr = 'CCC'      amount = 50 )
*                                        ( lifnr = 'CCC'      amount = 60 )
*                                        ( lifnr = 'SUBTOTAL' amount = 150 )
*                                        ( lifnr = 'TOTAL'    amount = 210 ) ).
    out->write( lt_display ).

  ENDMETHOD.
ENDCLASS.
