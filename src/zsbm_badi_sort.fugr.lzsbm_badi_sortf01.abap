*----------------------------------------------------------------------*
***INCLUDE LENH_BADI_SORTER_SUBSCREENSF01 .
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Form  pai_2000
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM pai_2000 .
  g_layer = enhbadi_sorter_impl-layer.
ENDFORM.                                                    " pai_2000

*&---------------------------------------------------------------------*
*&      Form  pai_3000
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM pai_3000 .
  g_impl_layer = enhbadi_sorter_impl-impl_layer.
  CHECK cl_badi_sort_layer_utility=>check_layer( g_impl_layer )
  IS INITIAL.
  MESSAGE w129(seef_badi).
  g_impl_layer = g_impl_layer_pbo.
ENDFORM.                                                    " pai_3000
