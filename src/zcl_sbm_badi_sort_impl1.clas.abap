class ZCL_SBM_BADI_SORT_IMPL1 definition
  public
  final
  create public .

public section.

  interfaces IF_BADI_INTERFACE .
  interfaces ZIF_SBM_BADI_SORT .
protected section.
private section.
ENDCLASS.



CLASS ZCL_SBM_BADI_SORT_IMPL1 IMPLEMENTATION.


  method ZIF_SBM_BADI_SORT~WRITE.

    WRITE : / 'Implementation 1' .

  endmethod.
ENDCLASS.
