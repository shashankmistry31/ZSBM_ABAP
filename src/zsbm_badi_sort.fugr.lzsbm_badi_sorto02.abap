*----------------------------------------------------------------------*
***INCLUDE LENH_BADI_SORTER_SUBSCREENSO02 .
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  pbo_3000  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE pbo_3000 OUTPUT.
  LOOP AT SCREEN.
    IF g_impl_chang = true.
      screen-input = 1.
    ELSE.
      screen-input = 0.
    ENDIF.
    MODIFY SCREEN.
  ENDLOOP.
  IF g_impl_layer IS INITIAL.
    g_impl_layer =
    cl_badi_sort_layer_utility=>set_default( ).
  ENDIF.
  g_impl_layer_pbo = g_impl_layer.
  enhbadi_sorter_impl-impl_layer = g_impl_layer.
ENDMODULE.                 " pbo_3000  OUTPUT
