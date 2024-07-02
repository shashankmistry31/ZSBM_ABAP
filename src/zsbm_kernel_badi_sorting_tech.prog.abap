*&---------------------------------------------------------------------*
*& Report ZSBM_KERNEL_BADI_SORTING_TECH
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsbm_kernel_badi_sorting_tech.



DATA : lr_badi TYPE REF TO zsbm_badi .


GET BADI lr_badi.

CALL BADI lr_badi->write.
