*&---------------------------------------------------------------------*
*& Report ZSBM_BGRFC_TEST
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsbm_bgrfc_test.

DATA: l_inb_dest TYPE bgrfc_dest_name_inbound,
      l_level    TYPE int2,
      counter    TYPE char10,
      l_dest     TYPE REF TO if_bgrfc_destination_inbound.

l_inb_dest = 'BGRFC_STHANA4'.
TRY.
    l_dest = cl_bgrfc_destination_inbound=>create( l_inb_dest ).
  CATCH cx_bgrfc_invalid_destination.
    RAISE invalid_destination.
ENDTRY.


DO 10 TIMES .
  IF l_dest IS BOUND.
    DATA(l_unit) = l_dest->create_trfc_unit( ).
  ENDIF.
  IF l_unit IS BOUND.

    l_level = sy-index.
*  l_level = |{ l_level ALPHA = OUT }|.
    counter = 'CONT'.
    CALL FUNCTION 'ZSBM_WEB_SERVICE_CONCAT_01'
      IN BACKGROUND UNIT l_unit
      EXPORTING
*       level      = l_level
        iv_counter = l_level.
    COMMIT WORK.
  ENDIF.
ENDDO.
