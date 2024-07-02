FUNCTION ZSBM_IMPLEMENTATION_LAYER_GET.
*"--------------------------------------------------------------------
*"*"Local Interface:
*"  EXPORTING
*"     REFERENCE(EX_LAYER) TYPE  ENHBADI_IMPLEMENTATION_LAYER
*"--------------------------------------------------------------------

  ex_layer = g_impl_layer.
  CLEAR g_impl_layer.



ENDFUNCTION.
