class ZCL_SBM_BADI_SORT_IMPL3 definition
  public
  final
  create public .

public section.

  interfaces IF_BADI_INTERFACE .
  interfaces ZIF_SBM_BADI_SORT .
protected section.
private section.
ENDCLASS.



CLASS ZCL_SBM_BADI_SORT_IMPL3 IMPLEMENTATION.


  METHOD zif_sbm_badi_sort~write.


    WRITE : / 'implementation 3' .


  ENDMETHOD.
ENDCLASS.
