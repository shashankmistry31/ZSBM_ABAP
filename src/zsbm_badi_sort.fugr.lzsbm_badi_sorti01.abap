*----------------------------------------------------------------------*
***INCLUDE LENH_BADI_SORTER_SUBSCREENSI01 .
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  pai_3000  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE pai_3000 INPUT.
  CHECK NOT
  enhbadi_sorter_impl-impl_layer = g_impl_layer_pbo.
  PERFORM pai_3000.
ENDMODULE.                 " pai_3000  INPUT
*&---------------------------------------------------------------------*
*&      Module  pai_2000  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
module pai_2000 input.
  PERFORM pai_2000.
endmodule.                 " pai_2000  INPUT