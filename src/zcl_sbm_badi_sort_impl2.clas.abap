class ZCL_SBM_BADI_SORT_IMPL2 definition
  public
  final
  create public .

public section.

  interfaces IF_BADI_INTERFACE .
  interfaces ZIF_SBM_BADI_SORT .
protected section.
private section.
ENDCLASS.



CLASS ZCL_SBM_BADI_SORT_IMPL2 IMPLEMENTATION.


  METHOD zif_sbm_badi_sort~write.

    WRITE : / 'Implementation 2' .

  ENDMETHOD.
ENDCLASS.
