*----------------------------------------------------------------------*
***INCLUDE LENH_BADI_SORTER_SUBSCREENSO01 .
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  pbo_2000  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE pbo_2000 OUTPUT.

  LOOP AT SCREEN.
    IF g_changeable = 'X'.
      screen-input = 1.
    ELSE.
      screen-input = 0.
    ENDIF.
    MODIFY SCREEN.
  ENDLOOP.
  enhbadi_sorter_impl-layer = g_layer.
ENDMODULE.                 " pbo_2000  OUTPUT
